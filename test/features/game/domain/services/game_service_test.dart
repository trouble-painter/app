import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/utils/time/server_time.dart';
import 'package:trouble_painter/features/auth/domain/entities/jwt.dart';
import 'package:trouble_painter/features/game/data/models/protocol/client_message.dart';
import 'package:trouble_painter/features/game/data/models/protocol/protocol_enums.dart';
import 'package:trouble_painter/features/game/data/models/protocol/server_message.dart';
import 'package:trouble_painter/features/game/data/repositories/game_repository.dart';
import 'package:trouble_painter/features/game/domain/entities/game_channel.dart';
import 'package:trouble_painter/features/game/domain/entities/game_exception/game_exception.dart';
import 'package:trouble_painter/features/game/domain/entities/game_req/game_req.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';
import 'package:trouble_painter/features/game/domain/usecases/connect_usecase.dart';
import 'package:trouble_painter/features/network/domain/entities/network_state.dart';

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

/// Lets queued stream events reach the service.
Future<void> flush() => Future<void>.delayed(Duration.zero);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _FakeConnectUsecase connect;
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
    container = ProviderContainer(
      overrides: [ConnectUsecase.$.overrideWithValue(connect)],
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
      expect(service().limits!.maxStrokePoints, 500);
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
        'data': {'locale': 'KO', 'waitingCount': 3},
      });

      expect(await future, isA<Success<void>>());
      expect((state() as GameQuickStartWaitingState).waitingCount, 3);

      service().exit();
      expect(channel().sentTypes, ['MATCH_JOIN', 'MATCH_CANCEL']);
      expect(channel().isClosed, isTrue);
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
          helloJson(matching: {'locale': 'KO', 'waitingCount': 1}),
        );
        await flush();
        expect(state(), isA<GameQuickStartWaitingState>());
        expect(channel(1).sentTypes, isEmpty);
      });
    });
  });
}
