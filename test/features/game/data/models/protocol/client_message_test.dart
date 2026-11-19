import 'dart:convert';

import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trouble_painter/features/config/domain/entities/language.dart';
import 'package:trouble_painter/features/game/data/models/protocol/client_message.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/stroke.dart';
import 'package:trouble_painter/features/game/domain/entities/game_reaction.dart';
import 'package:trouble_painter/features/game/domain/entities/game_req/game_req.dart';

Map<String, dynamic> encode(GameReq req) =>
    jsonDecode(ClientMessage.encode(req));

void main() {
  group('ClientMessage.encode', () {
    test('CREATE_ROOM with locale', () {
      expect(
        encode(
          const GameCreateRoomReq(nickname: 'nick', language: Language.korean),
        ),
        {
          'type': 'CREATE_ROOM',
          'data': {'nickname': 'nick', 'locale': 'KO'},
        },
      );
    });

    test('JOIN_ROOM upper cases the code', () {
      expect(
        encode(const GameJoinRoomReq(roomId: 'k7q2zp', nickname: 'n'))['data'],
        {'roomId': 'K7Q2ZP', 'nickname': 'n'},
      );
    });

    test('MATCH_JOIN with locale', () {
      expect(
        encode(
          const GameMatchJoinReq(nickname: 'n', language: Language.english),
        ),
        {
          'type': 'MATCH_JOIN',
          'data': {'nickname': 'n', 'locale': 'EN'},
        },
      );
    });

    test('DRAW_STROKE sends one stroke', () {
      final json = encode(
        GameDrawReq(
          index: 2,
          stroke: Stroke(x: [1], y: [2], t: [3]),
          canvas: const Size(10, 20),
        ),
      );
      expect(json, {
        'type': 'DRAW_STROKE',
        'data': {
          'index': 2,
          'stroke': {
            'x': [1.0],
            'y': [2.0],
            't': [3.0],
          },
          'canvas': {'w': 10.0, 'h': 20.0},
        },
      });
    });

    test('VOTE, REACTION and answers', () {
      expect(encode(const GameVoteReq(targetId: 3))['data'], {'targetId': 3});
      expect(
        encode(const GameReactionReq(reaction: GameReaction.citizen))['data'],
        {'reaction': 'BEAR'},
      );
      expect(encode(const GameAnswerReq(answer: 'a'))['type'], 'TYPE_ANSWER');
      expect(
        encode(const GameSubmitAnswerReq(answer: 'a'))['type'],
        'SUBMIT_ANSWER',
      );
    });

    test('requests without data send an empty object', () {
      final cases = {
        const GameLeaveRoomReq(): 'LEAVE_ROOM',
        const GameStartReq(): 'START_GAME',
        const GameEndTurnReq(): 'END_TURN',
        const GameClearSketchReq(): 'CLEAR_SKETCH',
        const GameRestartReq(): 'PLAY_AGAIN',
        const GameMatchCancelReq(): 'MATCH_CANCEL',
      };
      cases.forEach((req, type) {
        expect(encode(req), {'type': type, 'data': <String, dynamic>{}});
      });
    });
  });
}
