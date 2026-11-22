part of '../game_req.dart';

class GameMatchJoinReq extends GameReq {
  final String nickname;
  final Language language;

  const GameMatchJoinReq({required this.nickname, required this.language});
}
