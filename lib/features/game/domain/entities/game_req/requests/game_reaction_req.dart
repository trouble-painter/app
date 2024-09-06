part of '../game_req.dart';

class GameReactionReq extends GameReq {
  final GameReaction reaction;

  GameReactionReq({
    required this.reaction,
  }) : super(type: GameReqType.reaction);
}
