import 'package:x_pr/features/auth/domain/entities/jwt.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';
import 'package:x_pr/features/game/domain/entities/drawing/sketch.dart';
import 'package:x_pr/features/game/domain/entities/game_req/game_req_type.dart';
import 'package:x_pr/features/game/domain/entities/game_user.dart';

part 'requests/game_answer_req.dart';
part 'requests/game_draw_req.dart';
part 'requests/game_end_turn_req.dart';
part 'requests/game_enter_req.dart';
part 'requests/game_restart_req.dart';
part 'requests/game_start_req.dart';
part 'requests/game_submit_answer_req.dart';
part 'requests/game_vote_req.dart';

sealed class GameReq {
  final GameReqType type;
  GameReq({required this.type});
}
