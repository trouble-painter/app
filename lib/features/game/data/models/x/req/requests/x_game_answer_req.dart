part of '../x_game_req.dart';

class XGameAnswerReq extends XGameReq {
  XGameAnswerReq({required super.action, required super.data});

  factory XGameAnswerReq.fromEntiry(GameAnswerReq req) {
    return XGameAnswerReq(
      action: XGameReqAction.answer,
      data: {
        "answer": req.answer,
      },
    );
  }
}
