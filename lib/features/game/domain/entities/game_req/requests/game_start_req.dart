part of '../game_req.dart';

class GameStartReq extends GameReq {
  final String roomId;

  GameStartReq({
    required this.roomId,
  }) : super(type: GameReqType.start);
}
