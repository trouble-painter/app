import 'dart:convert';

import 'package:x_pr/features/game/data/models/x/req/x_game_req_action.dart';
import 'package:x_pr/features/game/data/models/x/x_game_reaction.dart';
import 'package:x_pr/features/game/domain/entities/game_req/game_req.dart';

part 'requests/x_game_answer_req.dart';
part 'requests/x_game_draw_req.dart';
part 'requests/x_game_end_turn_req.dart';
part 'requests/x_game_enter_req.dart';
part 'requests/x_game_quick_start_req.dart';
part 'requests/x_game_reaction_req.dart';
part 'requests/x_game_restart_req.dart';
part 'requests/x_game_start_req.dart';
part 'requests/x_game_submit_answer_req.dart';
part 'requests/x_game_vote_req.dart';

sealed class XGameReq {
  final XGameReqAction action;
  final Map<String, dynamic> data;

  XGameReq({
    required this.action,
    required this.data,
  });

  @override
  String toString() {
    return "${action.value}\n${jsonEncode(data)}";
  }
}
