import 'dart:math';

import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/features/game/domain/entities/drawing/sketch.dart';
import 'package:x_pr/features/game/domain/entities/game_exception/game_exception.dart';
import 'package:x_pr/features/game/domain/entities/game_step.dart';
import 'package:x_pr/features/game/domain/entities/game_user.dart';

part 'states/game_disconnected_state.dart';
part 'states/game_drawing_state.dart';
part 'states/game_guess_state.dart';
part 'states/game_quick_start_waiting_state.dart';
part 'states/game_ready_state.dart';
part 'states/game_result_state.dart';
part 'states/game_voting_state.dart';
part 'states/game_waiting_state.dart';

sealed class GameState {
  final GameException? exception;
  GameState({this.exception});

  GameState sinkException(GameException exception);
}
