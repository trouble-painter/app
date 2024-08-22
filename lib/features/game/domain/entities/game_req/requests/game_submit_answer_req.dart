part of '../game_req.dart';

class GameSubmitAnswerReq extends GameReq {
  final String answer;

  GameSubmitAnswerReq({
    required this.answer,
  }) : super(type: GameReqType.submitAnswer);
}
