part of '../game_req.dart';

class GameSetReadyReq extends GameReq {
  /// False cancels my ready. Non-host players of a waiting room only
  final bool isReady;

  const GameSetReadyReq({required this.isReady});
}
