import 'dart:convert';

import 'package:trouble_painter/features/game/data/models/protocol/protocol_enums.dart';
import 'package:trouble_painter/features/game/data/models/protocol/views.dart';
import 'package:trouble_painter/features/game/data/models/protocol/wire.dart';
import 'package:trouble_painter/features/game/domain/entities/game_req/game_req.dart';

/// protocol.md 4. Client requests. Frame: `{type, data}`
abstract final class ClientMessage {
  static ClientMessageType typeOf(GameReq req) => switch (req) {
        GameCreateRoomReq() => ClientMessageType.createRoom,
        GameJoinRoomReq() => ClientMessageType.joinRoom,
        GameLeaveRoomReq() => ClientMessageType.leaveRoom,
        GameUpdateRuleReq() => ClientMessageType.updateRule,
        GameSetReadyReq() => ClientMessageType.setReady,
        GameKickPlayerReq() => ClientMessageType.kickPlayer,
        GameStartReq() => ClientMessageType.startGame,
        GameDrawReq() => ClientMessageType.drawStroke,
        GameUndoStrokeReq() => ClientMessageType.undoStroke,
        GameEndTurnReq() => ClientMessageType.endTurn,
        GameReactionReq() => ClientMessageType.reaction,
        GameVoteReq() => ClientMessageType.vote,
        GameAnswerReq() => ClientMessageType.typeAnswer,
        GameSubmitAnswerReq() => ClientMessageType.submitAnswer,
        GameMatchJoinReq() => ClientMessageType.matchJoin,
        GameMatchAcceptReq() => ClientMessageType.matchAccept,
        GameMatchCancelReq() => ClientMessageType.matchCancel,
        GamePushTokenReq() => ClientMessageType.pushToken,
      };

  static Json _dataOf(GameReq req) => switch (req) {
        GameCreateRoomReq() => {
            'nickname': req.nickname,
            'locale': toWire(ProtocolLocale.fromLanguage(req.language)),
          },
        GameJoinRoomReq() => {
            'roomId': req.roomId.toUpperCase(),
            'nickname': req.nickname,
          },
        GameDrawReq(:final canvas) => {
            'index': req.index,
            'from': req.from,
            'stroke': strokeToWire(req.stroke),
            if (canvas != null) 'canvas': canvasToJson(canvas),
          },
        GameReactionReq() => {
            'reaction': toWire(ProtocolReaction.fromEntity(req.reaction)),
          },
        GameUpdateRuleReq() => GameRuleView.toJson(req.rule),
        GameSetReadyReq() => {'isReady': req.isReady},
        GameKickPlayerReq() => {'targetId': req.targetId},
        GameVoteReq() => {'targetId': req.targetId},
        GamePushTokenReq() => {'token': req.token},
        GameAnswerReq() => {'answer': req.answer},
        GameSubmitAnswerReq() => {'answer': req.answer},
        GameMatchJoinReq() => {
            'nickname': req.nickname,
            'locale': toWire(ProtocolLocale.fromLanguage(req.language)),
          },
        GameLeaveRoomReq() ||
        GameStartReq() ||
        GameUndoStrokeReq() ||
        GameEndTurnReq() ||
        GameMatchAcceptReq() ||
        GameMatchCancelReq() =>
          const {},
      };

  static String encode(GameReq req) => jsonEncode({
        'type': toWire(typeOf(req)),
        'data': _dataOf(req),
      });
}
