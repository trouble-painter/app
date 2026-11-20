import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:trouble_painter/features/game/data/models/protocol/server_message.dart';
import 'package:trouble_painter/features/game/domain/entities/game_reaction.dart';
import 'package:trouble_painter/features/game/domain/entities/game_role.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/entities/player_color.dart';
import 'package:trouble_painter/features/game/domain/usecases/game_state_reducer.dart';

import '../../../../helpers/protocol_fixtures.dart';

const myId = 1;

ServerMessage message(Map<String, dynamic> frame) =>
    ServerMessage.decode(jsonEncode(frame))!;

GameState? reduce(GameState current, Map<String, dynamic> frame) =>
    GameStateReducer.reduce(current, message(frame), myId);

GameState room(
  Map<String, dynamic> phase, {
  bool isQuickStart = false,
  Map<String, dynamic>? rule,
}) =>
    reduce(
      GameDisconnectedState(),
      roomFrame(phase, isQuickStart: isQuickStart, rule: rule),
    )!;

int get nowMs => DateTime.now().millisecondsSinceEpoch;

void main() {
  group('GameStateReducer snapshots', () {
    test('WAIT carries the rule and the categories to pick from', () {
      final waiting = room(
        waitPhaseJson(),
        rule: ruleJson(strokesPerTurn: 3, categoryIds: ['food']),
      ) as GameWaitingState;
      expect(waiting.rule.strokesPerTurn, 3);
      expect(waiting.defaultStrokesPerTurn, 1);
      expect(waiting.categories.map((c) => c.id), ['animal', 'food']);
      expect(waiting.selectedCategories.map((c) => c.name), ['음식']);
      expect(waiting.initialRule.strokesPerTurn, 1);
      expect(waiting.initialRule.categoryIds, isEmpty);
    });

    test('WAIT starts only once every player but the host is ready', () {
      final waiting = room(waitPhaseJson()) as GameWaitingState;
      expect(waiting.hasEnoughPlayers, isTrue);
      expect(waiting.isAllReady, isFalse);
      expect(waiting.canStart, isFalse);
      expect(waiting.isMyReady, isFalse);

      GameWaitingState withReady(List<int> readyIds) => reduce(waiting, {
            'type': 'PLAYERS',
            'data': {
              'players': [
                for (final id in [1, 2, 3])
                  {...playerJson(id), 'isReady': readyIds.contains(id)},
              ],
              'hostId': 1,
            },
          }) as GameWaitingState;

      expect(withReady([2]).canStart, isFalse);
      final ready = withReady([2, 3]);
      expect(ready.canStart, isTrue);
      expect(ready.isMyReady, isFalse);
    });

    test('DRAWING with no stroke limit never runs out of strokes', () {
      final startedAt = nowMs;
      final drawing = room(
        {
          'type': 'DRAWING',
          'game': gameJson(),
          'turn': turnJson(
            drawerId: 1,
            startedAt: startedAt,
            drawFrom: startedAt,
          ),
          'sketches': [],
          'current': sketchJson(1, strokes: 7),
        },
        rule: ruleJson(strokesPerTurn: null),
      ) as GameDrawingState;
      expect(drawing.strokesPerTurn, isNull);
      expect(drawing.strokesLeft, isNull);
      expect(drawing.strokesLeftAfterStroke, isNull);
      expect(drawing.strokesLeftAfterUndo, isNull);
      expect(drawing.isDrawable, isTrue);
      expect(drawing.noStrokesLeft, isFalse);
    });

    test('READY shows the role, and the mafia gets no keyword', () {
      final deadline = nowMs + 5000;
      final citizen = room({
        'type': 'READY',
        'game': gameJson(),
        'deadline': deadline,
      }) as GameReadyState;
      expect(citizen.isMafia, isFalse);
      expect(citizen.keyword, '도시');
      expect(citizen.deadline.millisecondsSinceEpoch, deadline);
      expect(citizen.readyMs, 5000);
      expect(citizen.startedAt.millisecondsSinceEpoch, deadline - 5000);

      final mafia = room({
        'type': 'READY',
        'game': gameJson(role: 'MAFIA', keyword: null),
        'deadline': deadline,
      }) as GameReadyState;
      expect(mafia.isMafia, isTrue);
      expect(mafia.keyword, isNull);
      expect(mafia.category, '장소');
    });

    test('DRAWING follows the turn order and colors sketches by drawer', () {
      final startedAt = nowMs;
      final drawing = room({
        'type': 'DRAWING',
        'game': gameJson(),
        'turn': turnJson(
          round: 1,
          turn: 1,
          drawerId: 1,
          startedAt: startedAt,
          drawFrom: startedAt,
        ),
        'sketches': [sketchJson(2)],
        'current': sketchJson(1),
      }) as GameDrawingState;

      expect(drawing.userList.map((u) => u.id), [2, 1, 3]);
      expect(drawing.myTurn, 1);
      expect(drawing.currentTurn, 1);
      expect(drawing.isMyTurn, isTrue);
      expect(drawing.currentRound, 1);
      expect(drawing.rounds, 2);
      expect(drawing.turnMs, 10000);
      expect(drawing.deadline.millisecondsSinceEpoch, startedAt + 10000);
      expect(drawing.sketchList.single.userId, 2);
      expect(drawing.sketchList.single.color, PlayerColor.orange.drawing);
      expect(drawing.currentSketch.strokeList, hasLength(1));
      expect(drawing.currentSketch.color, PlayerColor.red.drawing);

      /// strokesPerTurn is 1 and one stroke is drawn.
      expect(drawing.strokesLeft, 0);
      expect(drawing.stage, GameDrawingStage.play);
    });

    test('DRAWING shows the round animation until drawFrom', () {
      final startedAt = nowMs;
      final drawing = room({
        'type': 'DRAWING',
        'game': gameJson(),
        'turn': turnJson(startedAt: startedAt, drawFrom: startedAt + 5000),
        'sketches': [],
        'current': null,
      }) as GameDrawingState;

      expect(drawing.stage, GameDrawingStage.round);
      expect(drawing.isShowRoundAnim, isTrue);
      expect(drawing.isDrawable, isFalse);
      expect(drawing.currentSketch.strokeList, isEmpty);
      expect(drawing.currentSketch.userId, 2);
      expect(drawing.strokesLeft, 1);
    });

    test('a new DRAWING snapshot keeps the reaction stream', () {
      final phase = {
        'type': 'DRAWING',
        'game': gameJson(),
        'turn': turnJson(startedAt: nowMs, drawFrom: nowMs),
        'sketches': [],
        'current': null,
      };
      final first = room(phase) as GameDrawingState;
      final second = reduce(first, roomFrame(phase)) as GameDrawingState;
      expect(second.reaction$Ctrl, same(first.reaction$Ctrl));
    });

    test('VOTE counts the voters of each player', () {
      final voting = room({
        'type': 'VOTE',
        'game': gameJson(),
        'sketches': [sketchJson(2)],
        'votes': {'1': 3, '2': 3},
        'deadline': nowMs + 30000,
      }) as GameVotingState;

      expect(voting.userList.map((u) => u.id), [2, 1, 3]);
      expect(voting.voteResult.map((voters) => voters.map((u) => u.id)), [
        <int>[],
        <int>[],
        [2, 1],
      ]);
      expect(voting.myVoteIndex, 2);
      expect(voting.voteMs, 30000);
    });

    test('ANSWER names the accused as the mafia', () {
      final guess = room({
        'type': 'ANSWER',
        'game': gameJson(),
        'sketches': [],
        'accusedId': 3,
        'typing': '도',
        'deadline': nowMs + 20000,
      }) as GameGuessState;

      expect(guess.mafia.id, 3);
      expect(guess.mafiaAnswer, '도');
      expect(guess.isMafia, isFalse);
      expect(guess.answerMs, 20000);
    });

    test('END takes the keyword and the judgment from the result', () {
      final result = room(
        {
          'type': 'END',
          'game': gameJson(role: 'MAFIA', keyword: null),
          'sketches': [],
          'result': {
            'mafiaId': 1,
            'accusedId': 1,
            'answer': '도시',
            'mafiaGuess': '시내',
            'winner': 'MAFIA',
          },
        },
        isQuickStart: true,
      ) as GameResultState;

      expect(result.keyword, '도시');
      expect(result.mafia.id, 1);
      expect(result.isMafiaWin, isTrue);

      /// A synonym is correct too: the server judges it.
      expect(result.isMafiaCorrect, isTrue);
      expect(result.mafiaAnswer, '시내');
      expect(result.isQuickStartGame, isTrue);
      expect(result.roomId, 'K7Q2ZP');
    });

    test('END without an ANSWER phase is a win by vote', () {
      final result = room({
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
      }) as GameResultState;

      expect(result.isMafiaCorrect, isFalse);
      expect(result.mafiaAnswer, '');
      expect(result.winner, GameRole.mafia);
      expect(result.isQuickStartGame, isFalse);
    });
  });

  test('MATCHING shows the count only when someone else waits', () {
    GameQuickStartWaitingState matching(int count) => reduce(
          GameDisconnectedState(),
          {
            'type': 'MATCHING',
            'data': {
              'locale': 'KO',
              'waitingCount': count,
              'minCount': 3,
              'waitMs': 10000,
            },
          },
        ) as GameQuickStartWaitingState;
    expect(matching(1).isShowWaitingCount, isFalse);
    expect(matching(2).isShowWaitingCount, isTrue);
    expect(matching(2).waitingCount, 2);
  });

  test('MATCHING carries the start time once enough people wait', () {
    final waiting = reduce(
      GameDisconnectedState(),
      {
        'type': 'MATCHING',
        'data': {
          'locale': 'KO',
          'waitingCount': 2,
          'startsAt': null,
          'minCount': 3,
          'waitMs': 10000,
        },
      },
    ) as GameQuickStartWaitingState;
    expect(waiting.startsAt, isNull);
    final gathered = reduce(
      waiting,
      {
        'type': 'MATCHING',
        'data': {
          'locale': 'KO',
          'waitingCount': 3,
          'startsAt': nowMs,
          'minCount': 3,
          'waitMs': 10000,
        },
      },
    ) as GameQuickStartWaitingState;
    expect(gathered.startsAt, DateTime.fromMillisecondsSinceEpoch(nowMs));
    expect(gathered.waitMs, 10000);
  });

  test('MATCHING carries my accept step only while one runs', () {
    GameQuickStartWaitingState matching(Object? ready) => reduce(
          GameDisconnectedState(),
          {
            'type': 'MATCHING',
            'data': {
              'locale': 'KO',
              'waitingCount': 0,
              'startsAt': null,
              'minCount': 3,
              'waitMs': 10000,
              'ready': ready,
            },
          },
        ) as GameQuickStartWaitingState;
    expect(matching(null).ready, isNull);
    final endsAt = nowMs + 5000;
    final ready = matching({
      'endsAt': endsAt,
      'acceptMs': 5000,
      'isAccepted': true,
    }).ready!;
    expect(ready.endsAt, DateTime.fromMillisecondsSinceEpoch(endsAt));
    expect(ready.acceptMs, 5000);
    expect(ready.isAccepted, isTrue);
  });

  group('GameStateReducer patches', () {
    late GameDrawingState drawing;
    setUp(() {
      drawing = room({
        'type': 'DRAWING',
        'game': gameJson(),
        'turn': turnJson(drawerId: 2, startedAt: nowMs, drawFrom: nowMs),
        'sketches': [],
        'current': null,
      }) as GameDrawingState;
    });

    test('STROKE appends the next stroke and replaces the last one', () {
      final first = reduce(drawing, {
        'type': 'STROKE',
        'data': {
          'index': 0,
          'stroke': strokeJson([1]),
          'canvas': {'w': 300, 'h': 400},
        },
      }) as GameDrawingState;
      expect(first.currentSketch.strokeList.single.x, [1]);
      expect(first.currentSketch.canvasSize.width, 300);
      expect(first.currentSketch.color, PlayerColor.orange.drawing);

      final replaced = reduce(first, {
        'type': 'STROKE',
        'data': {
          'index': 0,
          'stroke': strokeJson([1, 2, 3]),
          'canvas': {'w': 300, 'h': 400},
        },
      }) as GameDrawingState;
      expect(replaced.currentSketch.strokeList.single.x, [1, 2, 3]);

      final appended = reduce(replaced, {
        'type': 'STROKE',
        'data': {
          'index': 1,
          'stroke': strokeJson([4]),
          'canvas': {'w': 300, 'h': 400},
        },
      }) as GameDrawingState;
      expect(appended.currentSketch.strokeList.map((s) => s.x), [
        [1, 2, 3],
        [4],
      ]);
    });

    test('STROKE does not touch my own drawing', () {
      final mine = drawing.copyWith(drawerId: myId);
      expect(
        reduce(mine, {
          'type': 'STROKE',
          'data': {
            'index': 0,
            'stroke': strokeJson(),
            'canvas': {'w': 1, 'h': 1},
          },
        }),
        isNull,
      );
    });

    test('SKETCH_CLEARED empties the sketch and gives the strokes back', () {
      final drawn = reduce(drawing, {
        'type': 'STROKE',
        'data': {
          'index': 0,
          'stroke': strokeJson(),
          'canvas': {'w': 1, 'h': 1},
        },
      }) as GameDrawingState;
      final cleared = reduce(
        drawn.copyWith(strokesLeft: 0),
        {'type': 'SKETCH_CLEARED', 'data': {}},
      ) as GameDrawingState;
      expect(cleared.currentSketch.strokeList, isEmpty);
      expect(cleared.strokesLeft, cleared.strokesPerTurn);
    });

    test('undoing a stroke gives one stroke back, up to the rule', () {
      expect(drawing.copyWith(strokesLeft: 0).strokesLeftAfterUndo, 1);
      expect(
        drawing
            .copyWith(strokesLeft: drawing.strokesPerTurn)
            .strokesLeftAfterUndo,
        drawing.strokesPerTurn,
      );
    });

    test('STROKE_UNDONE drops the last stroke', () {
      Map<String, dynamic> stroke(int index, List<double> x) => {
            'type': 'STROKE',
            'data': {
              'index': index,
              'stroke': strokeJson(x),
              'canvas': {'w': 1, 'h': 1},
            },
          };
      final drawn = reduce(
        reduce(drawing, stroke(0, [1])) as GameDrawingState,
        stroke(1, [2]),
      ) as GameDrawingState;
      final undone = reduce(drawn, {'type': 'STROKE_UNDONE', 'data': {}})
          as GameDrawingState;
      expect(undone.currentSketch.strokeList.map((s) => s.x), [
        [1],
      ]);
      expect(
        reduce(drawing, {'type': 'STROKE_UNDONE', 'data': {}}),
        isNull,
      );
    });

    test('TURN files the finished sketch and starts the next turn', () {
      final startedAt = nowMs;
      final next = reduce(drawing.copyWith(strokesLeft: 0), {
        'type': 'TURN',
        'data': {
          'turn': turnJson(
            turn: 1,
            drawerId: 1,
            startedAt: startedAt,
            drawFrom: startedAt,
          ),
          'sketch': sketchJson(2),
        },
      }) as GameDrawingState;

      expect(next.drawerId, 1);
      expect(next.isMyTurn, isTrue);
      expect(next.sketchList.single.userId, 2);
      expect(next.currentSketch.strokeList, isEmpty);
      expect(next.currentSketch.color, PlayerColor.red.drawing);
      expect(next.strokesLeft, 1);
      expect(next.reaction$Ctrl, same(drawing.reaction$Ctrl));

      final empty = reduce(next, {
        'type': 'TURN',
        'data': {
          'turn': turnJson(
            turn: 2,
            drawerId: 3,
            startedAt: startedAt,
            drawFrom: startedAt,
          ),
          'sketch': null,
        },
      }) as GameDrawingState;
      expect(empty.sketchList, hasLength(1));
      expect(empty.drawerId, 3);
    });

    test('PLAYERS in a game keeps the turn order', () {
      final updated = reduce(drawing, {
        'type': 'PLAYERS',
        'data': {
          'players': [
            playerJson(1),
            {...playerJson(2, color: 'ORANGE'), 'isConnected': false},
            playerJson(3, color: 'YELLOW'),
          ],
          'hostId': 1,
        },
      }) as GameDrawingState;
      expect(updated.userList.map((u) => u.id), [2, 1, 3]);
      expect(updated.userList.first.isConnect, isFalse);
    });

    test('VOTES replaces the votes', () {
      final voting = room({
        'type': 'VOTE',
        'game': gameJson(),
        'sketches': [],
        'votes': {},
        'deadline': nowMs + 30000,
      }) as GameVotingState;
      expect(voting.myVoteIndex, -1);

      final voted = reduce(voting, {
        'type': 'VOTES',
        'data': {
          'votes': {'1': 2},
        },
      }) as GameVotingState;
      expect(voted.myVoteIndex, 0);
      expect(voted.voteResult.first.single.id, 1);
    });

    test('ANSWER_TYPING shows what the mafia types', () {
      final guess = room({
        'type': 'ANSWER',
        'game': gameJson(),
        'sketches': [],
        'accusedId': 3,
        'typing': '',
        'deadline': nowMs + 20000,
      });
      final typed = reduce(guess, {
        'type': 'ANSWER_TYPING',
        'data': {'answer': '도시'},
      }) as GameGuessState;
      expect(typed.mafiaAnswer, '도시');
    });

    test('a patch for another phase keeps the state', () {
      expect(
        reduce(drawing, {
          'type': 'VOTES',
          'data': {'votes': {}},
        }),
        isNull,
      );
      expect(
        reduce(drawing, {'type': 'SKETCH_CLEARED', 'data': {}}),
        isNotNull,
      );
      expect(
        reduce(GameDisconnectedState(), {'type': 'SKETCH_CLEARED', 'data': {}}),
        isNull,
      );
      expect(
        reduce(drawing, {
          'type': 'REACTION',
          'data': {'userId': 2, 'reaction': 'HEART'},
        }),
        isNull,
      );
    });

    test('IDLE goes home', () {
      expect(
        reduce(drawing, {
          'type': 'IDLE',
          'data': {'reason': 'LEFT'},
        }),
        isA<GameDisconnectedState>(),
      );
    });

    test('IDLE MATCH_DECLINED goes home as declined', () {
      final state = reduce(drawing, {
        'type': 'IDLE',
        'data': {'reason': 'MATCH_DECLINED'},
      });
      expect(state, isA<GameDisconnectedState>());
      expect((state as GameDisconnectedState).isMatchDeclined, isTrue);
      expect(state.isKicked, isFalse);
    });

    test('IDLE KICKED goes home as kicked', () {
      final state = reduce(drawing, {
        'type': 'IDLE',
        'data': {'reason': 'KICKED'},
      });
      expect(state, isA<GameDisconnectedState>());
      expect((state as GameDisconnectedState).isKicked, isTrue);
    });
  });

  test('reaction stream is a broadcast stream', () {
    final drawing = room({
      'type': 'DRAWING',
      'game': gameJson(),
      'turn': turnJson(startedAt: nowMs, drawFrom: nowMs),
      'sketches': [],
      'current': null,
    }) as GameDrawingState;
    final StreamController<GameReactionSent> ctrl = drawing.reaction$Ctrl;
    expect(ctrl.stream.isBroadcast, isTrue);
  });
}
