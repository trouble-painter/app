import 'package:x_pr/features/game/data/models/x/raw/x_game_raw.dart';

enum XGameReqAction {
  enter("INIT"),
  quickStart("RANDOM_MATCHING"),
  start("START_GAME"),
  endTurn("END_TURN"),
  vote("VOTE"),
  draw("DRAW"),
  answer("ANSWER"),
  submitAnswer("DECIDE_ANSWER"),
  restart("GAME_AGAIN"),
  reaction("REACTION"),
  unknown(""),
  ;

  const XGameReqAction(this.value);
  final String value;

  factory XGameReqAction.fromXGameRaw(XGameRaw raw) {
    for (final type in values) {
      if (type.name == raw.action) return type;
    }
    return unknown;
  }
}
