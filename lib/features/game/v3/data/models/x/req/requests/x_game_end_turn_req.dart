part of '../x_game_req.dart';

class XGameEndTurnReq extends XGameReq {
  XGameEndTurnReq({required super.action, required super.data});

  factory XGameEndTurnReq.fromEntiry(GameEndTurnReq req) {
    return XGameEndTurnReq(
      action: XGameReqAction.endTurn,
      data: {},
    );
  }
}
