part of '../x_game_req.dart';

class XGameStartReq extends XGameReq {
  XGameStartReq({required super.action, required super.data});

  factory XGameStartReq.fromEntiry(GameStartReq req) {
    return XGameStartReq(
      action: XGameReqAction.start,
      data: {
        "roomId": req.roomId,
      },
    );
  }
}
