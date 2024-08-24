import 'package:x_pr/core/utils/env/constant.dart';
import 'package:x_pr/core/utils/serializer/time_serializer.dart';
import 'package:x_pr/features/game/data/models/x/raw/x_game_raw.dart';
import 'package:x_pr/features/game/data/models/x/req/x_game_req_action.dart';
import 'package:x_pr/features/game/data/models/x/x_game_info.dart';
import 'package:x_pr/features/game/data/models/x/x_game_user.dart';
import 'package:x_pr/features/game/domain/entities/drawing/sketch.dart';
import 'package:x_pr/features/game/domain/entities/game_exception/game_exception.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/entities/game_user.dart';

part 'exception/x_game_exception.dart';
part 'patch/patches/x_game_answer_patch.dart';
part 'patch/patches/x_game_draw_patch.dart';
part 'patch/patches/x_game_player_list_patch.dart';
part 'patch/patches/x_game_turn_info_patch.dart';
part 'patch/patches/x_game_vote_status_patch.dart';
part 'patch/x_game_patch.dart';
part 'phase/phases/x_game_drawing_phase.dart';
part 'phase/phases/x_game_guess_phase.dart';
part 'phase/phases/x_game_quick_start_waiting_phase.dart';
part 'phase/phases/x_game_ready_phase.dart';
part 'phase/phases/x_game_result_phase.dart';
part 'phase/phases/x_game_vote_phase.dart';
part 'phase/phases/x_game_waiting_phase.dart';
part 'phase/x_game_phase.dart';

sealed class XGameRes {}
