part of '../x_game_req.dart';

class XGameDrawReq extends XGameReq {
  XGameDrawReq({required super.action, required super.data});

  factory XGameDrawReq.fromEntiry(GameDrawReq req) {
    return XGameDrawReq(
      action: XGameReqAction.draw,
      data: {
        "drawData": req.sketch.toJson(),
      },
    );
  }
}
