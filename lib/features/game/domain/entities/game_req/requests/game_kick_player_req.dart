part of '../game_req.dart';

class GameKickPlayerReq extends GameReq {
  /// Host only, waiting room only
  final int targetId;

  const GameKickPlayerReq({required this.targetId});
}
