part of '../game_req.dart';

class GameEnterReq extends GameReq {
  final String? roomId;
  final Jwt jwt;
  final String nickname;
  final Language language;

  GameEnterReq({
    required this.jwt,
    required this.nickname,
    required this.language,
    this.roomId,
  }) : super(type: GameReqType.enter);
}
