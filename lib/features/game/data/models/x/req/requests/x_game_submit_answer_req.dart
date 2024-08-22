part of '../x_game_req.dart';

class XGameSubmitAnswerReq extends XGameReq {
  XGameSubmitAnswerReq({required super.action, required super.data});

  factory XGameSubmitAnswerReq.fromEntiry(GameSubmitAnswerReq req) {
    return XGameSubmitAnswerReq(
      action: XGameReqAction.submitAnswer,
      data: {
        "answer": req.answer,
      },
    );
  }
}
