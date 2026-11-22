part of '../game_req.dart';

class GameCreateRoomReq extends GameReq {
  final String nickname;
  final Language language;

  const GameCreateRoomReq({required this.nickname, required this.language});
}
