import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/theme/components/toast/toast.dart';
import 'package:trouble_painter/core/utils/env/constant.dart';
import 'package:trouble_painter/core/utils/log/logger.dart';
import 'package:trouble_painter/core/utils/time/server_time.dart';
import 'package:trouble_painter/features/config/domain/entities/config.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/game/data/models/protocol/protocol_enums.dart';
import 'package:trouble_painter/features/game/data/models/protocol/server_message.dart';
import 'package:trouble_painter/features/game/data/models/protocol/views.dart';
import 'package:trouble_painter/features/game/domain/entities/game_channel.dart';
import 'package:trouble_painter/features/game/domain/entities/game_exception/game_exception.dart';
import 'package:trouble_painter/features/game/domain/entities/game_reaction.dart';
import 'package:trouble_painter/features/game/domain/entities/game_req/game_req.dart';
import 'package:trouble_painter/features/game/domain/entities/game_rule.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/entities/game_step.dart';
import 'package:trouble_painter/features/game/domain/entities/game_user.dart';
import 'package:trouble_painter/features/game/domain/usecases/connect_usecase.dart';
import 'package:trouble_painter/features/game/domain/usecases/debug_ui_usecase.dart';
import 'package:trouble_painter/features/game/domain/usecases/game_state_reducer.dart';
import 'package:trouble_painter/features/game/domain/usecases/get_jwt_usecase.dart';
import 'package:trouble_painter/features/game/domain/usecases/is_playing_room_usecase.dart';
import 'package:trouble_painter/features/notification/domain/usecases/notification_push_token_usecase.dart';

/// Game socket session (protocol v2).
/// The app never tracks the room on its own: every connect starts from `HELLO`.
class GameService extends Notifier<GameState> {
  static final $ = NotifierProvider<GameService, GameState>(
    GameService.new,
  );

  GameChannel? _channel;
  StreamSubscription<ServerMessage>? _channel$;
  int? _myId;
  bool _isHelloReceived = false;

  /// Request sent right after `HELLO`, and the completer waiting for its answer.
  GameReq? _firstReq;
  Completer<Result<void>>? _pending;
  bool _isReconnecting = false;

  LimitsView? _limits;
  RuleSpecView? _ruleSpec;

  /// Room rule in UI test mode, where no server keeps it
  GameRule? _debugRule;

  /// Players of the room in UI test mode, so a kicked player stays out of the game
  List<GameUser>? _debugUserList;

  /// Sent after every `HELLO`: the server keeps it in memory only (protocol.md 8).
  String? _pushToken;

  /// Limits the server checks (`HELLO.limits`). Game pages exist only after `HELLO`.
  LimitsView get limits =>
      _limits ?? (throw StateError('No limits before HELLO'));

  /// What a host may pick in a rule (`HELLO.ruleSpec`). The rule sheet exists only after `HELLO`.
  RuleSpecView get ruleSpec =>
      _ruleSpec ?? (throw StateError('No rule spec before HELLO'));

  Config get config => ref.read(ConfigService.$);
  bool get isPlaying => state.isPlaying;
  bool get isHome => state is GameDisconnectedState;

  @override
  GameState build() {
    final pushToken$ = ref.read(NotificationPushTokenUsecase.$).call().listen(
      (token) {
        _pushToken = token;
        request(GamePushTokenReq(token: token));
      },
      onError: (Object e, StackTrace s) =>
          Logger.e('Failed to get push token', e, s),
    );
    ref.onDispose(pushToken$.cancel);
    return GameDisconnectedState();
  }

  /// Create a room ([roomId] is null) or join one
  Future<Result<void>> enter({String? roomId}) {
    return _open(
      roomId == null
          ? GameCreateRoomReq(
              nickname: config.nickname,
              language: config.language,
            )
          : GameJoinRoomReq(roomId: roomId, nickname: config.nickname),
    );
  }

  /// Quick start matching
  Future<Result<void>> quickStart() {
    return _open(
      GameMatchJoinReq(nickname: config.nickname, language: config.language),
    );
  }

  /// Go back to the playing room. The server sends it in `HELLO`.
  Future<Result<void>> rejoin() => _open(null);

  /// Leave the room or the queue and close the socket.
  void exit() {
    Logger.d("🧩 Game Exit : $state");
    final exitedState = state;
    if (exitedState is! GameDisconnectedState && _isHelloReceived) {
      _channel?.send(
        exitedState is GameQuickStartWaitingState
            ? const GameMatchCancelReq()
            : const GameLeaveRoomReq(),
      );
    }
    _detach();
    _isReconnecting = false;
    if (exitedState is GameDisconnectedState) return;

    /// Called from dispose. Change the state after this frame.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      state = GameDisconnectedState();

      /// A player who left mid-game stays in it until it ends. Show "rejoin" on home.
      if (exitedState.isPlaying) unawaited(checkIsPlayingRoom());
    });
  }

  /// Send a request. Dropped until `HELLO` arrives.
  void request(GameReq req) {
    if (!_isHelloReceived) {
      Logger.d("🧩 Request dropped before HELLO : $req");
      return;
    }
    _channel?.send(req);
  }

  Future<String?> checkIsPlayingRoom() async {
    final jwt = await ref.read(GetJwtUsecase.$).call();
    final result = await ref.read(GetPlayingRoomIdUsecase.$).call(jwt);
    final playingRoomId = switch (result) {
      Success(value: final playingRoomId) => playingRoomId,
      _ => null,
    };
    Logger.d("🎮 isPlayingRoom : $playingRoomId");
    if (state is GameDisconnectedState) {
      state = GameDisconnectedState(playingRoomId);
    }
    return playingRoomId;
  }

  /// Changing the state in a subview that is out of sync because it is local.
  bool emit(GameState newState) {
    if (state.runtimeType != newState.runtimeType) return false;
    state = newState;
    return true;
  }

  /// Change step for debuggin
  Future<void> debugStep(GameStep step) async {
    if (!ref.read(ConfigService.$).isUiTestMode) {
      Logger.e('Not in UI test mode');
      return;
    }
    _limits = DebugUiUsecase.limits;
    _ruleSpec = DebugUiUsecase.ruleSpec;
    final current = state;
    _debugRule = switch (current) {
      /// A custom room's rule carries into its game and the next one.
      GameWaitingState() => current.rule,

      /// A new room or a quick start begins with the initial rule.
      GameDisconnectedState() || GameQuickStartWaitingState() => null,
      _ => _debugRule,
    };
    _debugUserList = switch (current) {
      GameWaitingState() => current.userList,
      GameDisconnectedState() || GameQuickStartWaitingState() => null,
      _ => _debugUserList,
    };
    final param = (step: step, rule: _debugRule, userList: _debugUserList);
    state = ref.read(DebugUiUsecase.$).call(param);
  }

  Future<Result<void>> _open(GameReq? firstReq) async {
    _detach();
    _isReconnecting = false;
    final pending = _pending = Completer();
    _firstReq = firstReq;
    try {
      await _connect(Constant.connectionTimeout);
      return await pending.future.timeout(Constant.connectionTimeout);
    } catch (e, s) {
      Logger.e("Failed to open game channel", e, s);
      _detach();
      return Failure(e);
    } finally {
      if (identical(_pending, pending)) _pending = null;
    }
  }

  Future<void> _connect(Duration timeout) async {
    final param = ConnectUsecaseParam(timeout);
    final (:jwt, :channel) = await ref.read(ConnectUsecase.$).call(param);
    _myId = jwt.userId;
    _isHelloReceived = false;
    _channel = channel;
    _channel$ = channel.stream.listen(
      _onMessage,
      onDone: () => _onDone(channel),
    );
  }

  void _detach() {
    _channel$?.cancel();
    _channel$ = null;
    _channel?.close();
    _channel = null;
    _isHelloReceived = false;
  }

  void _complete(Result<void> result) {
    final pending = _pending;
    if (pending == null || pending.isCompleted) return;
    pending.complete(result);
  }

  void _onMessage(ServerMessage message) {
    final myId = _myId;
    if (myId == null) return;

    switch (message) {
      case HelloMessage():
        _isHelloReceived = true;
        ServerTime.sync(message.serverTime);
        _limits = message.limits;
        _ruleSpec = message.ruleSpec;
        _sendPushToken();
        final firstReq = _firstReq;
        if (firstReq != null) {
          /// Ignore HELLO's state: the answer to the request replaces it.
          _firstReq = null;
          _channel?.send(firstReq);
          return;
        }
        final newState = GameStateReducer.fromHello(message, myId, state);
        _complete(
          newState is GameDisconnectedState
              ? const Failure(GameException.roomNotFound)
              : const Success(null),
        );
        state = newState;
        if (newState is GameDisconnectedState) _detach();
        return;

      case ErrorMessage(code: final code):
        final exception = code.exception;
        Logger.d("🧩 🔴 Error | ${message.request} $code");
        if (_pending != null && !_pending!.isCompleted) {
          /// The page that sent the first request shows the toast.
          _complete(Failure(exception));
          _detach();
          return;
        }
        Toast.showText(exception.toast, type: TextToastType.warning);
        state = state.sinkException(exception);
        return;

      case ReactionMessage(:final userId, :final reaction):
        final current = state;
        if (current is GameDrawingState) {
          current.reaction$Ctrl.add(
            GameReactionSent(userId: userId, reaction: reaction),
          );
        }
        return;

      default:
        final newState = GameStateReducer.reduce(state, message, myId);
        if (newState == null) return;
        state = newState;
        _complete(const Success(null));

        /// After the result the server has taken everyone out of the room.
        if (newState is GameDisconnectedState || newState is GameResultState) {
          _detach();
        }
    }
  }

  void _sendPushToken() {
    final token = _pushToken;
    if (token != null) _channel?.send(GamePushTokenReq(token: token));
  }

  void _onDone(GameChannel channel) {
    if (!identical(channel, _channel)) return;
    final closeCode = channel.closeCode;
    Logger.d("🧩 👋 GameChannel closed : $closeCode");
    _channel$ = null;
    _channel = null;
    _isHelloReceived = false;
    _complete(const Failure(GameException.channelDisconnected));
    if (state is GameDisconnectedState) return;

    switch (closeCode) {
      case ProtocolCloseCode.replaced:
        _goHome(GameException.replaced);
      case ProtocolCloseCode.rateLimited:
        _goHome(GameException.rateLimited);
      default:
        state = state.sinkException(GameException.channelDisconnected);
        unawaited(_reconnect());
    }
  }

  void _goHome(GameException exception) {
    Toast.showText(exception.toast, type: TextToastType.warning);
    state = GameDisconnectedState();
  }

  /// Reconnect with backoff. After reconnecting, only `HELLO` decides the state.
  Future<void> _reconnect() async {
    if (_isReconnecting) return;
    _isReconnecting = true;
    Toast.showSpinner(text: GameException.channelDisconnected.toast);
    final deadline = DateTime.now().add(Constant.reconnectionWindow);
    var delay = Constant.reconnectionFirstDelay;
    try {
      while (true) {
        await Future.delayed(delay);
        if (!_isReconnecting) return;
        final remain = deadline.difference(DateTime.now());
        if (remain <= Duration.zero) break;
        try {
          Logger.d("🧩 🟣 Reconnecting");
          await _connect(
            remain < Constant.connectionTimeout
                ? remain
                : Constant.connectionTimeout,
          );
          return;
        } catch (e) {
          Logger.d("🧩 Reconnection failed", e);
          if (!_isReconnecting) return;
          delay *= 2;
          if (delay > Constant.reconnectionMaxDelay) {
            delay = Constant.reconnectionMaxDelay;
          }
        }
      }

      /// Gave up
      final wasPlaying = state.isPlaying;
      _detach();
      _goHome(GameException.networkNotConnected);
      if (wasPlaying) unawaited(checkIsPlayingRoom());
    } finally {
      _isReconnecting = false;
      Toast.dismiss(ToastType.spinner);
    }
  }
}
