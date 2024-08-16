part of '../x_game_req.dart';

class XGameRestartReq extends XGameReq {
  XGameRestartReq({required super.action, required super.data});

  factory XGameRestartReq.fromEntiry(GameRestartReq req) {
    return XGameRestartReq(
      action: XGameReqAction.restart,
      data: {},
    );
  }
}
