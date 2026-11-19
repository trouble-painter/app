import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/domain/usecases/base_usecase.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/utils/time/server_time.dart';
import 'package:trouble_painter/features/auth/domain/entities/jwt.dart';
import 'package:trouble_painter/features/game/data/models/protocol/client_message.dart';
import 'package:trouble_painter/features/game/data/models/protocol/protocol_enums.dart';
import 'package:trouble_painter/features/game/data/models/protocol/server_message.dart';
import 'package:trouble_painter/features/game/data/repositories/game_repository.dart';
import 'package:trouble_painter/features/game/domain/entities/game_channel.dart';
import 'package:trouble_painter/features/game/domain/entities/game_exception/game_exception.dart';
import 'package:trouble_painter/features/game/domain/entities/game_reaction.dart';
import 'package:trouble_painter/features/game/domain/entities/game_req/game_req.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';
import 'package:trouble_painter/features/game/domain/usecases/connect_usecase.dart';
import 'package:trouble_painter/features/network/domain/entities/network_state.dart';
import 'package:trouble_painter/features/notification/data/repositories/notification_repository.dart';
import 'package:trouble_painter/features/notification/domain/usecases/notification_push_token_usecase.dart';

import '../../../../helpers/protocol_fixtures.dart';
import '../../../../helpers/test_env.dart';

class _FakeChannel implements GameChannel {
  final _ctrl = StreamController<ServerMessage>();
  final List<String> sentTypes = [];
  bool isClosed = false;

  @override
  int? closeCode;

  @override
  Stream<ServerMessage> get stream => _ctrl.stream;

  @override
  void send(GameReq req) {
    sentTypes.add(jsonDecode(ClientMessage.encode(req))['type']);
  }

  @override
  Future<void> close() async {
    isClosed = true;
  }

  void receive(Map<String, dynamic> frame) {
    _ctrl.add(ServerMessage.decode(jsonEncode(frame))!);
  }

  /// Server side closure
  void drop([int? code]) {
    closeCode = code;
    _ctrl.close();
  }
}

class _UnusedGameRepository implements GameRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

class _FakeConnectUsecase extends ConnectUsecase {
  _FakeConnectUsecase()
      : super(
          gameRepository: _UnusedGameRepository(),
          getNetworkState: () => NetworkState.connected,
          getBaseSocketUrl: () => Uri(),
          getJwt: (_) => throw UnimplementedError(),
        );

  final List<_FakeChannel> channels = [];
  static const myId = 1;

  @override
  Future<ConnectUsecaseResult> call(ConnectUsecaseParam param) async {
    final channel = _FakeChannel();
    channels.add(channel);
    return (
      jwt: Jwt(userId: myId, refreshToken: '', accessToken: ''),
      channel: channel as GameChannel,
    );
  }
}

/// Tokens the test hands out; buffered until the service listens.
class _FakePushTokenUsecase implements NotificationPushTokenUsecase {
  final tokens = StreamController<String>();

  @override
  NotificationRepository get notificationRepository =>
      throw UnimplementedError();

  @override
  Stream<String> call([VoidParam param]) => tokens.stream;
}

/// Lets queued stream events reach the service.
Future<void> flush() => Future<void>.delayed(Duration.zero);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _FakeConnectUsecase connect;
  late _FakePushTokenUsecase pushToken;
  late ProviderContainer container;
  GameService service() => container.read(GameService.$.notifier);
  GameState state() => container.read(GameService.$);
  _FakeChannel channel([int index = 0]) => connect.channels[index];

  setUpAll(() async {
    loadTestEnv();
    await S.load(const Locale('ko'));
  });

  setUp(() {
    connect = _FakeConnectUsecase();
    pushToken = _FakePushTokenUsecase();
    container = ProviderContainer(
      overrides: [
        ConnectUsecase.$.overrideWithValue(connect),
        NotificationPushTokenUsecase.$.overrideWithValue(pushToken),
      ],
    );
  });

  tearDown(() => container.dispose());

  final waitingRoom = {
    'type': 'ROOM',
    'data': {'room': roomJson()},
  };

  group('GameService', () {
    test('sends the first request only after HELLO and ignores its room',
        () async {
      final future = service().enter();
      await flush();
      expect(channel().sentTypes, isEmpty);

      /// HELLO with an old waiting room must not change the state.
      channel().receive(helloJson(room: roomJson(), serverTime: 5000));
      await flush();
      expect(channel().sentTypes, ['CREATE_ROOM']);
      expect(state(), isA<GameDisconnectedState>());
      expect(
        ServerTime.now.millisecondsSinceEpoch,
        closeTo(5000, 1000),
      );

      channel().receive(waitingRoom);
      expect(await future, isA<Success<void>>());
      final waiting = state() as GameWaitingState;
      expect(waiting.roomId, 'K7Q2ZP');
      expect(waiting.isHost, isTrue);
      expect(service().limits.maxStrokePoints, 500);
    });

    test('join sends JOIN_ROOM', () async {
      final future = service().enter(roomId: 'abcdef');
      await flush();
      channel().receive(helloJson());
      await flush();
      channel().receive(waitingRoom);
      await future;
      expect(channel().sentTypes, ['JOIN_ROOM']);
    });

    test('sends the push token after every HELLO and when it changes',
        () async {
      pushToken.tokens.add('token-1');
      final future = service().enter(roomId: 'abcdef');
      await flush();
      expect(channel().sentTypes, isEmpty);
      channel().receive(helloJson());
      await flush();
      expect(channel().sentTypes, ['PUSH_TOKEN', 'JOIN_ROOM']);
      channel().receive(waitingRoom);
      await future;

      pushToken.tokens.add('token-2');
      await flush();
      expect(channel().sentTypes, ['PUSH_TOKEN', 'JOIN_ROOM', 'PUSH_TOKEN']);
    });

    test('drops requests before HELLO', () async {
      unawaited(service().rejoin());
      await flush();
      service().request(const GameStartReq());
      expect(channel().sentTypes, isEmpty);
    });

    test('fails the first request on ERROR and closes the socket', () async {
      final future = service().enter(roomId: 'ABCDEF');
      await flush();
      channel().receive(helloJson());
      await flush();
      channel().receive({
        'type': 'ERROR',
        'data': {'request': 'JOIN_ROOM', 'code': 'ROOM_FULL'},
      });

      final result = await future;
      expect((result as Failure<void>).e, GameException.roomFull);
      expect(channel().isClosed, isTrue);
    });

    test('rejoin follows HELLO.room', () async {
      final future = service().rejoin();
      await flush();
      channel().receive(helloJson(room: roomJson()));

      expect(await future, isA<Success<void>>());
      expect(state(), isA<GameWaitingState>());
      expect(channel().sentTypes, isEmpty);
    });

    test('rejoin without a room fails and goes home', () async {
      final future = service().rejoin();
      await flush();
      channel().receive(helloJson());

      final result = await future;
      expect((result as Failure<void>).e, GameException.roomNotFound);
      expect(state(), isA<GameDisconnectedState>());
      expect(channel().isClosed, isTrue);
    });

    test('quick start shows the queue and exit cancels matching', () async {
      final future = service().quickStart();
      await flush();
      channel().receive(helloJson());
      await flush();
      channel().receive({
        'type': 'MATCHING',
        'data': {
          'locale': 'KO',
          'waitingCount': 3,
          'minCount': 3,
          'waitMs': 10000,
        },
      });

      expect(await future, isA<Success<void>>());
      expect((state() as GameQuickStartWaitingState).waitingCount, 3);

      service().exit();
      expect(channel().sentTypes, ['MATCH_JOIN', 'MATCH_CANCEL']);
      expect(channel().isClosed, isTrue);
    });

    test('quick start can be matched at once with ROOM', () async {
      final future = service().quickStart();
      await flush();
      channel().receive(helloJson());
      await flush();
      expect(channel().sentTypes, ['MATCH_JOIN']);

      final now = DateTime.now().millisecondsSinceEpoch;
      channel().receive(
        roomFrame(
          {'type': 'READY', 'game': gameJson(), 'deadline': now + 5000},
          isQuickStart: true,
        ),
      );
      expect(await future, isA<Success>());
      expect(state(), isA<GameReadyState>());
    });

    group('in a game', () {
      setUp(() async {
        final now = DateTime.now().millisecondsSinceEpoch;
        final future = service().rejoin();
        await flush();
        channel().receive(
          helloJson(
            serverTime: now,
            room: roomFrame({
              'type': 'DRAWING',
              'game': gameJson(),
              'turn': turnJson(drawerId: 1, startedAt: now, drawFrom: now),
              'sketches': [],
              'current': null,
            })['data']['room'],
          ),
        );
        await future;
      });

      test('HELLO puts a reconnecting player back into the turn', () {
        final drawing = state() as GameDrawingState;
        expect(drawing.isMyTurn, isTrue);
        expect(drawing.isDrawable, isTrue);
        expect(service().limits.drawThrottleMs, 50);
      });

      test('game requests change nothing until the room answers', () async {
        final before = state();
        service().request(const GameClearSketchReq());
        service().request(const GameEndTurnReq());
        expect(channel().sentTypes, ['CLEAR_SKETCH', 'END_TURN']);
        expect(state(), same(before));

        final now = DateTime.now().millisecondsSinceEpoch;
        channel().receive({
          'type': 'TURN',
          'data': {
            'turn': turnJson(
              turn: 1,
              drawerId: 3,
              startedAt: now,
              drawFrom: now,
            ),
            'sketch': null,
          },
        });
        await flush();
        expect((state() as GameDrawingState).drawerId, 3);
      });

      test('REACTION is passed to the drawing page with its sender', () async {
        final drawing = state() as GameDrawingState;
        final reactions = <GameReactionSent>[];
        final subs = drawing.reaction$Ctrl.stream.listen(reactions.add);
        channel().receive({
          'type': 'REACTION',
          'data': {'userId': 2, 'reaction': 'HEART'},
        });
        await flush();
        expect(reactions.map((r) => (r.userId, r.reaction)), [
          (2, GameReaction.like),
        ]);
        expect(state(), same(drawing));
        await subs.cancel();
      });

      test('in-game ERROR keeps the phase', () async {
        channel().receive({
          'type': 'ERROR',
          'data': {'request': 'CLEAR_SKETCH', 'code': 'INVALID_PHASE'},
        });
        await flush();
        expect(state(), isA<GameDrawingState>());
        expect(state().exception, GameException.invalidPhase);
      });

      test('a quick start room closes with IDLE after the result', () async {
        final now = DateTime.now().millisecondsSinceEpoch;
        channel().receive(
          roomFrame(
            {
              'type': 'END',
              'game': gameJson(),
              'sketches': [],
              'result': {
                'mafiaId': 3,
                'accusedId': null,
                'answer': '도시',
                'mafiaGuess': null,
                'winner': 'MAFIA',
              },
              'deadline': now + 15000,
            },
            isQuickStart: true,
          ),
        );
        await flush();
        expect((state() as GameResultState).isQuickStartGame, isTrue);

        channel().receive({
          'type': 'IDLE',
          'data': {'reason': 'ROOM_CLOSED'},
        });
        await flush();
        expect(state(), isA<GameDisconnectedState>());
        expect(channel().isClosed, isTrue);
      });
    });

    group('in a waiting room', () {
      setUp(() async {
        final future = service().rejoin();
        await flush();
        channel().receive(helloJson(room: roomJson()));
        await future;
      });

      test('PLAYERS updates players and host', () async {
        channel().receive({
          'type': 'PLAYERS',
          'data': {
            'players': [playerJson(2), playerJson(1)],
            'hostId': 2,
          },
        });
        await flush();

        final waiting = state() as GameWaitingState;
        expect(waiting.userList.map((u) => u.id), [2, 1]);
        expect(waiting.isHost, isFalse);
      });

      test('in-room ERROR is sunk into the state', () async {
        channel().receive({
          'type': 'ERROR',
          'data': {'request': 'START_GAME', 'code': 'NOT_ENOUGH_PLAYERS'},
        });
        await flush();
        expect(state().exception, GameException.notEnoughPlayers);
      });

      test('IDLE goes home and closes the socket', () async {
        channel().receive({
          'type': 'IDLE',
          'data': {'reason': 'ROOM_CLOSED'},
        });
        await flush();
        expect(state(), isA<GameDisconnectedState>());
        expect(channel().isClosed, isTrue);
      });

      test('exit sends LEAVE_ROOM', () {
        service().exit();
        expect(channel().sentTypes, ['LEAVE_ROOM']);
        expect(channel().isClosed, isTrue);
      });

      test('close code 4000 goes home without reconnecting', () async {
        channel().drop(ProtocolCloseCode.replaced);
        await flush();
        expect(state(), isA<GameDisconnectedState>());
        await Future<void>.delayed(const Duration(milliseconds: 1200));
        expect(connect.channels, hasLength(1));
      });

      test('abnormal closure reconnects and follows only HELLO', () async {
        channel().drop();
        await flush();
        expect(state().exception, GameException.channelDisconnected);

        await Future<void>.delayed(const Duration(milliseconds: 1200));
        expect(connect.channels, hasLength(2));

        channel(1).receive(
          helloJson(
            matching: {
              'locale': 'KO',
              'waitingCount': 1,
              'minCount': 3,
              'waitMs': 10000,
            },
          ),
        );
        await flush();
        expect(state(), isA<GameQuickStartWaitingState>());
        expect(channel(1).sentTypes, isEmpty);
      });
    });
  });
}
