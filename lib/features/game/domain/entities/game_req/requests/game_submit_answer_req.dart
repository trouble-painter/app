part of '../game_req.dart';

class GameSubmitAnswerReq extends GameReq {
  final String answer;

  const GameSubmitAnswerReq({
    required this.answer,
  });
}
