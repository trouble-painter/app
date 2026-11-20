import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:trouble_painter/features/game/data/models/protocol/protocol_enums.dart';
import 'package:trouble_painter/features/game/data/models/protocol/server_message.dart';
import 'package:trouble_painter/features/game/data/models/protocol/views.dart';
import 'package:trouble_painter/features/game/domain/entities/game_exception/game_exception.dart';
import 'package:trouble_painter/features/game/domain/entities/game_reaction.dart';
import 'package:trouble_painter/features/game/domain/entities/game_role.dart';
import 'package:trouble_painter/features/game/domain/entities/player_color.dart';

import '../../../../../helpers/protocol_fixtures.dart';

ServerMessage? decode(Map<String, dynamic> frame) =>
    ServerMessage.decode(jsonEncode(frame));

void main() {
  group('ServerMessage.decode', () {
    test('ignores an unknown type', () {
      expect(decode({'type': 'SOMETHING_NEW', 'data': {}}), isNull);
    });

    test('HELLO with a waiting room', () {
      final hello = decode(helloJson(room: roomJson())) as HelloMessage;

      expect(hello.serverTime.millisecondsSinceEpoch, 1700000000000);
      expect(hello.limits.maxAnswerLength, 20);
      expect(hello.limits.maxStrokesPerTurn, 5);
      expect(hello.matching, isNull);
      final room = hello.room!;
      expect(room.id, 'K7Q2ZP');
      expect(room.locale, ProtocolLocale.ko);
      expect(room.option.defaultStrokesPerTurn, 1);
      expect(room.rule.strokesPerTurn, 1);
      expect(room.rule.categoryIds, isEmpty);
      final phase = room.phase as WaitPhaseView;
      expect(phase.categories.map((c) => c.id), ['animal', 'food']);
      expect(phase.categories.first.name, '동물');
      expect(room.players.map((p) => p.color), [
        PlayerColor.red,
        PlayerColor.orange,
      ]);
    });

    test('HELLO in the queue', () {
      final hello = decode(
        helloJson(
          matching: {
            'locale': 'EN',
            'waitingCount': 2,
            'minCount': 3,
            'waitMs': 10000,
          },
        ),
      ) as HelloMessage;

      expect(hello.room, isNull);
      expect(hello.matching!.locale, ProtocolLocale.en);
      expect(hello.matching!.waitingCount, 2);
      expect(hello.matching!.ready, isNull);
    });

    test('HELLO in the accept step', () {
      final hello = decode(
        helloJson(
          matching: {
            'locale': 'KO',
            'waitingCount': 0,
            'minCount': 3,
            'waitMs': 10000,
            'ready': {'endsAt': 1700000005000, 'acceptMs': 5000, 'isAccepted': false},
          },
        ),
      ) as HelloMessage;

      final ready = hello.matching!.ready!;
      expect(ready.endsAt, DateTime.fromMillisecondsSinceEpoch(1700000005000));
      expect(ready.acceptMs, 5000);
      expect(ready.isAccepted, isFalse);
    });

    test('ROOM in DRAWING with a mafia view', () {
      final message = decode({
        'type': 'ROOM',
        'data': {
          'room': roomJson(
            phase: {
              'type': 'DRAWING',
              'game': {
                'role': 'MAFIA',
                'category': '장소',
                'keyword': null,
                'turnOrder': [2, 1],
              },
              'turn': {
                'round': 0,
                'turn': 1,
                'drawerId': 1,
                'startedAt': 1000,
                'drawFrom': 6000,
                'deadline': 16000,
              },
              'sketches': [
                {
                  'userId': 2,
                  'canvas': {'w': 335, 'h': 425.5},
                  'strokes': [
                    {
                      'x': [1, 2],
                      'y': [3, 4],
                      't': [0, 10],
                    },
                  ],
                },
              ],
              'current': null,
            },
          ),
        },
      }) as RoomMessage;

      final phase = message.room.phase as DrawingPhaseView;
      expect(phase.game.role, GameRole.mafia);
      expect(phase.game.keyword, isNull);
      expect(phase.turn.drawFrom.millisecondsSinceEpoch, 6000);
      expect(phase.current, isNull);
      expect(phase.sketches.single.canvas.height, 425.5);
      expect(phase.sketches.single.strokes.single.x, [1.0, 2.0]);
    });

    test('END with a result', () {
      final message = decode({
        'type': 'ROOM',
        'data': {
          'room': roomJson(
            phase: {
              'type': 'END',
              'game': {
                'role': 'CITIZEN',
                'category': 'c',
                'keyword': 'k',
                'turnOrder': [1, 2],
              },
              'sketches': [],
              'result': {
                'mafiaId': 2,
                'accusedId': null,
                'answer': 'k',
                'mafiaGuess': null,
                'winner': 'MAFIA',
              },
            },
          ),
        },
      }) as RoomMessage;

      final result = (message.room.phase as EndPhaseView).result;
      expect(result.accusedId, isNull);
      expect(result.winner, GameRole.mafia);
    });

    test('VOTES parses voter ids', () {
      final message = decode({
        'type': 'VOTES',
        'data': {
          'votes': {'1': 3, '2': 3},
        },
      }) as VotesMessage;

      expect(message.votes, {1: 3, 2: 3});
    });

    test('PLAYERS, IDLE and REACTION', () {
      final players = decode({
        'type': 'PLAYERS',
        'data': {
          'players': [playerJson(2)],
          'hostId': 2,
        },
      }) as PlayersMessage;
      expect(players.hostId, 2);

      final idle = decode({
        'type': 'IDLE',
        'data': {'reason': 'MATCH_CANCELED'},
      }) as IdleMessage;
      expect(idle.reason, IdleReason.matchCanceled);

      final reaction = decode({
        'type': 'REACTION',
        'data': {'userId': 1, 'reaction': 'HAMSTER'},
      }) as ReactionMessage;
      expect(reaction.reaction, GameReaction.mafia);
    });

    test('SKETCH_CLEARED has no data', () {
      expect(
        decode({'type': 'SKETCH_CLEARED', 'data': {}}),
        isA<SketchClearedMessage>(),
      );
    });

    test('STROKE_UNDONE has no data', () {
      expect(
        decode({'type': 'STROKE_UNDONE', 'data': {}}),
        isA<StrokeUndoneMessage>(),
      );
    });

    test('ANSWER carries the accused', () {
      final room = (decode({
        'type': 'ROOM',
        'data': {
          'room': roomJson(
            phase: {
              'type': 'ANSWER',
              'game': gameJson(),
              'sketches': [],
              'accusedId': 3,
              'typing': '도',
              'deadline': 1000,
            },
          ),
        },
      }) as RoomMessage)
          .room;
      final phase = room.phase as AnswerPhaseView;
      expect(phase.accusedId, 3);
      expect(phase.typing, '도');
    });

    test('ERROR maps the code and falls back to internal', () {
      final known = decode({
        'type': 'ERROR',
        'data': {'request': 'JOIN_ROOM', 'code': 'ROOM_FULL'},
      }) as ErrorMessage;
      expect(known.request, ClientMessageType.joinRoom);
      expect(known.code.exception, GameException.roomFull);

      final unknown = decode({
        'type': 'ERROR',
        'data': {'request': 'X', 'code': 'NEW_CODE'},
      }) as ErrorMessage;
      expect(unknown.request, isNull);
      expect(unknown.code, ProtocolErrorCode.internal);
    });
  });
}
