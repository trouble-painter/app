part of '../game_req.dart';

class GameAnswerReq extends GameReq {
  final String answer;

  GameAnswerReq({
    required this.answer,
  }) : super(type: GameReqType.answer);
}
