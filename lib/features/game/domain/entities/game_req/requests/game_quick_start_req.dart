part of '../game_req.dart';

class GameQuickStartReq extends GameReq {
  final Jwt jwt;
  final String nickname;
  final Language language;

  GameQuickStartReq({
    required this.jwt,
    required this.nickname,
    required this.language,
  }) : super(type: GameReqType.quickStart);
}
