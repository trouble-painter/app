part of '../x_game_req.dart';

class XGameEnterReq extends XGameReq {
  XGameEnterReq({required super.action, required super.data});

  factory XGameEnterReq.fromEntiry(GameEnterReq req) {
    return XGameEnterReq(
      action: XGameReqAction.enter,
      data: {
        if (req.roomId != null) "roomId": req.roomId?.toUpperCase(),
        "accessToken": req.jwt.accessToken,
        "nickname": req.nickname,
        "locale": req.language.locale.languageCode,
      },
    );
  }
}
