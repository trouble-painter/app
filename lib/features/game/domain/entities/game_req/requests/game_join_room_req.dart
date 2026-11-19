part of '../game_req.dart';

class GameJoinRoomReq extends GameReq {
  final String roomId;
  final String nickname;

  const GameJoinRoomReq({required this.roomId, required this.nickname});
}
