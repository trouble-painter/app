part of '../game_req.dart';

class GameVoteReq extends GameReq {
  final GameUser votedUser;

  GameVoteReq({
    required this.votedUser,
  }) : super(type: GameReqType.vote);
}
