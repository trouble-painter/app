part of '../x_game_req.dart';

class XGameVoteReq extends XGameReq {
  XGameVoteReq({required super.action, required super.data});

  factory XGameVoteReq.fromEntiry(GameVoteReq req) {
    return XGameVoteReq(
      action: XGameReqAction.vote,
      data: {
        "userId": req.votedUser.id,
      },
    );
  }
}
