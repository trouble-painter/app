import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/features/config/domain/entities/language.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/stroke.dart';
import 'package:trouble_painter/features/game/domain/entities/game_reaction.dart';

part 'requests/game_answer_req.dart';
part 'requests/game_clear_sketch_req.dart';
part 'requests/game_create_room_req.dart';
part 'requests/game_draw_req.dart';
part 'requests/game_end_turn_req.dart';
part 'requests/game_join_room_req.dart';
part 'requests/game_leave_room_req.dart';
part 'requests/game_match_cancel_req.dart';
part 'requests/game_match_join_req.dart';
part 'requests/game_push_token_req.dart';
part 'requests/game_reaction_req.dart';
part 'requests/game_restart_req.dart';
part 'requests/game_start_req.dart';
part 'requests/game_submit_answer_req.dart';
part 'requests/game_vote_req.dart';

/// Room requests carry no roomId. The server knows the user's room.
sealed class GameReq {
  const GameReq();
}
