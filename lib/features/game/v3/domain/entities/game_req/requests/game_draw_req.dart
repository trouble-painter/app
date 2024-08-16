part of '../game_req.dart';

class GameDrawReq extends GameReq {
  final Sketch sketch;
  GameDrawReq({
    required this.sketch,
  }) : super(type: GameReqType.draw);
}
