part of '../x_game_req.dart';

class XGameQuickStartReq extends XGameReq {
  XGameQuickStartReq({required super.action, required super.data});

  factory XGameQuickStartReq.fromEntiry(GameQuickStartReq req) {
    return XGameQuickStartReq(
      action: XGameReqAction.quickStart,
      data: {
        "accessToken": req.jwt.accessToken,
        "nickname": req.nickname,
        "locale": req.language.locale.languageCode,
      },
    );
  }
}
