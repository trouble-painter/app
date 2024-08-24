import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/utils/env/constant.dart';
import 'package:x_pr/core/utils/ext/future_ext.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/auth/domain/entities/jwt.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/data/repository/game_repository.dart';
import 'package:x_pr/features/game/domain/entities/game_channel.dart';
import 'package:x_pr/features/game/domain/entities/game_exception/game_exception.dart';
import 'package:x_pr/features/game/domain/entities/game_req/game_req.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/entities/game_step.dart';
import 'package:x_pr/features/game/domain/usecase/channel_listen/channel_listen_usecase.dart';
import 'package:x_pr/features/game/domain/usecase/connect_usecase.dart';
import 'package:x_pr/features/game/domain/usecase/debug_ui_usecase.dart';
import 'package:x_pr/features/game/domain/usecase/get_jwt_usecase.dart';
import 'package:x_pr/features/game/domain/usecase/is_playing_room_usecase.dart';

typedef GameStateCallback = void Function(GameState gameState);
typedef GameExceptionCallback = void Function(GameException gameException);

class GameService extends Notifier<GameState> {
  static final $ = NotifierProvider<GameService, GameState>(
    GameService.new,
  );

  late bool isQuickStart;
  late String currentRoomId;
  late GameChannel _channel;
  late StreamSubscription _state$;
  late StreamSubscription _channel$;
  late StreamSubscription _exception$;
  late StreamController<GameState> _state$Ctrl;
  late StreamController<GameException> exception$Ctrl;
  Completer<Result<void>> _requestCompleter = Completer();
  Config get config => ref.read(ConfigService.$);

  @override
  GameState build() {
    return GameDisconnectedState();
  }

  GameRepository get gameRepository => ref.read(GameRepository.$);

  void _cancel() {
    _channel.close();
    _state$.cancel();
    _channel$.cancel();
    _exception$.cancel();
    Logger.d("🧩 🔘 Channel & stream canceled");
  }

  Future<void> _reconnection(
    int nTry, {
    int nMaxTry = 3,
    Duration waitDuration = const Duration(seconds: 1),
  }) async {
    try {
      if (state is GameDisconnectedState) return;
      if (nTry <= nMaxTry) {
        Logger.d("🧩 🟣 Reconnecting try : $nTry");
        Toast.showSpinner(text: GameException.channelDisconnected.toast);
        final result = await enter(roomId: currentRoomId, timeout: waitDuration)
            .waiting(milliseconds: waitDuration.inMilliseconds);
        switch (result) {
          case Success():
            Toast.dismiss(ToastType.spinner);
            return;
          default:
            return await _reconnection(nTry + 1);
        }
      } else {
        throw Exception("Maximum number of attempts exceeded");
      }
    } catch (e) {
      Logger.e("Failed", e);
      Toast.dismiss(ToastType.spinner);
      return exit();
    }
  }

  /// Listen
  void _listen({
    required Jwt jwt,
    required GameChannel channel,
    GameStateCallback? stateCallback,
    GameExceptionCallback? exceptionCallback,
  }) {
    _channel = channel;
    _state$Ctrl = StreamController();
    exception$Ctrl = StreamController.broadcast();

    /// Listen GameState stream
    _state$ = _state$Ctrl.stream.listen((gameState) {
      Logger.d("🧩 🟢 GameState | $gameState");
      state = gameState;
      stateCallback?.call(gameState);
    });

    /// Listen GameException stream
    _exception$ = exception$Ctrl.stream.listen((gameException) {
      Logger.d("🧩 🔴 GameException | $gameException");

      /// Handle in page
      state = state.sinkException(gameException);
      exceptionCallback?.call(gameException);

      /// Handle in service
      switch (gameException) {
        case GameException.channelDisconnected:
          _cancel();
          if (state is! GameDisconnectedState) {
            _reconnection(1);
          }
          return;
        case GameException.unauthenticated:
        case GameException.accessTokenExpired:
        case GameException.networkNotConnected:
        case GameException.maxRoom:
        case GameException.ongoingGame:
        case GameException.noRoom:
          if (state is GameDisconnectedState) {
            if ((state as GameDisconnectedState).playingRoomId != null) {
              state = GameDisconnectedState();
            }
          }
        case GameException.notMyTurn:
        case GameException.error:
          return;
      }
    });

    /// Listen GameChannel
    final param = ChannelListenParam(
      jwt: jwt,
      channel: channel,
      state$Ctrl: _state$Ctrl,
      exception$Ctrl: exception$Ctrl,
    );
    _channel$ = ref.read(ChannelListenUsecase.$).call(param);
  }

  /// Quick start
  Future<Result<void>> quickStart({
    Duration timeout = Constant.connectionTimeout,
  }) async {
    try {
      /// Jwt
      final jwt = await ref.read(GetJwtUsecase.$).call();

      /// Connect
      final param = ConnectUsecaseParam(timeout);
      final channel = await ref.read(ConnectUsecase.$).call(param);

      /// Listen
      if (_requestCompleter.isCompleted) {
        _requestCompleter = Completer();
      }
      _listen(
        jwt: jwt,
        channel: channel,
        stateCallback: (gameState) {
          if (_requestCompleter.isCompleted) return;
          if (gameState is GameReadyState) {
            /// Init currentRoomId (create case)
            currentRoomId = gameState.roomId;
          }
          _requestCompleter.complete(const Success(null));
        },
        exceptionCallback: (gameException) {
          if (_requestCompleter.isCompleted) return;
          _requestCompleter.complete(Failure(gameException));
          _cancel();
        },
      );

      /// Request
      _channel.send(
        GameQuickStartReq(
          jwt: jwt,
          nickname: config.nickname,
          language: config.language,
        ),
      );
      return _requestCompleter.future;
    } catch (e, s) {
      Logger.e("Failed to enter", e, s);
      return Failure(e);
    }
  }

  /// Enter room
  Future<Result<void>> enter({
    String? roomId,
    Duration timeout = Constant.connectionTimeout,
  }) async {
    try {
      /// Init currentRoomId(join case)
      if (roomId != null) {
        currentRoomId = roomId;
      }

      /// Jwt
      final jwt = await ref.read(GetJwtUsecase.$).call();

      /// Connect
      final param = ConnectUsecaseParam(timeout);
      final channel = await ref.read(ConnectUsecase.$).call(param);

      /// Listen
      if (_requestCompleter.isCompleted) {
        _requestCompleter = Completer();
      }
      _listen(
        jwt: jwt,
        channel: channel,
        stateCallback: (gameState) {
          if (_requestCompleter.isCompleted) return;
          if (gameState is GameWaitingState) {
            /// Init currentRoomId (create case)
            currentRoomId = gameState.roomId;
          }
          _requestCompleter.complete(const Success(null));
        },
        exceptionCallback: (gameException) {
          if (_requestCompleter.isCompleted) return;
          _requestCompleter.complete(Failure(gameException));
          _cancel();
        },
      );

      /// Request
      _channel.send(
        GameEnterReq(
          jwt: jwt,
          nickname: config.nickname,
          language: config.language,
          roomId: roomId,
        ),
      );
      return _requestCompleter.future;
    } catch (e, s) {
      Logger.e("Failed to enter", e, s);
      return Failure(e);
    }
  }

  /// Exit room
  void exit() {
    Logger.d("🧩 Game Exit");
    _cancel();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      switch (state) {
        case GameReadyState():
        case GameDrawingState():
        case GameGuessState():
        case GameVotingState():
        case GameResultState():
          state = GameDisconnectedState(currentRoomId);
          return;
        case GameDisconnectedState():
        case GameWaitingState():
        case GameQuickStartWaitingState():
          state = GameDisconnectedState();
          return;
      }
    });
  }

  /// Request
  void request(GameReq req) {
    _channel.send(req);
  }

  Future<String?> checkIsPlayingRoom() async {
    if (state is! GameDisconnectedState) return null;
    final jwt = await ref.read(GetJwtUsecase.$).call();
    final result = await ref.read(GetPlayingRoomIdUsecase.$).call(jwt);
    final playingRoomId = switch (result) {
      Success(value: final playingRoomId) => playingRoomId,
      _ => null,
    };
    Logger.d("🎮 isPlayingRoom : $playingRoomId");
    state = GameDisconnectedState(playingRoomId);
    return playingRoomId;
  }

  /// Changing the state in a subview that is out of sync because it is local.
  bool emit(GameState newState) {
    if (state.runtimeType != newState.runtimeType) return false;
    state = newState;
    ref.read(ChannelListenUsecase.$).gameState = state;
    return true;
  }

  /// Change step for debuggin
  Future<void> debugStep(GameStep step) async {
    if (!ref.read(ConfigService.$).isUiTestMode) {
      Logger.e('Not in UI test mode');
      return;
    }
    state = ref.read(DebugUiUsecase.$).call(step);
  }
}
