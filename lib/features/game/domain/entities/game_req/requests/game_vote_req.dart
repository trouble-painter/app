part of '../game_req.dart';

class GameVoteReq extends GameReq {
  /// Null withdraws my vote
  final int? targetId;

  const GameVoteReq({required this.targetId});
}
