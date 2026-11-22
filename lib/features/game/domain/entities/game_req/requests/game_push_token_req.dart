part of '../game_req.dart';

/// The device's FCM token, for the game-start push (protocol.md 8)
class GamePushTokenReq extends GameReq {
  final String token;

  const GamePushTokenReq({required this.token});
}
