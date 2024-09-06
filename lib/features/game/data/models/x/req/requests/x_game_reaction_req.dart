part of '../x_game_req.dart';

class XGameReactionReq extends XGameReq {
  XGameReactionReq({required super.action, required super.data});

  factory XGameReactionReq.fromEntiry(GameReactionReq req) {
    return XGameReactionReq(
      action: XGameReqAction.reaction,
      data: {
        "reaction": XGameReaction.fromEntity(req.reaction).value,
      },
    );
  }
}
