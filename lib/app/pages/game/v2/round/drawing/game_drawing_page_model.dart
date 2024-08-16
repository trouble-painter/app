import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v2/round/drawing/game_drawing_page_state.dart';
import 'package:x_pr/app/pages/game/v2/round/game_round_page_model.dart';
import 'package:x_pr/app/pages/game/v2/round/game_round_page_state.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v2/data/repository/drawing/game_drawing_repository.dart';
import 'package:x_pr/features/game/v2/data/repository/round/game_round_repository.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_sketch.dart';

class GameDrawingPageModel extends BaseViewModel<GameDrawingPageState> {
  static late var $;
  GameDrawingPageModel(super.buildState);

  GameRoundRepository get gameRoundRepository {
    return ref.read(GameRoundRepository.$);
  }

  GameDrawingRepository get gameDrawingRepository {
    return ref.read(GameDrawingRepository.$);
  }

  GameRoundLoadedState get roundState {
    return ref.read(GameRoundPageModel.$) as GameRoundLoadedState;
  }

  bool get isGameDevMode => ref.read(ConfigService.$).isGameDevMode;

  Future<void> init() async {
    final (round, player) = (roundState.round, roundState.player);
    final drawingId = round.drawingId;
    state = drawingId == null
        ? GameDrawingFailureState()
        : switch (await gameDrawingRepository.get(drawingId)) {
            Success(value: final drawing) => GameDrawingLoadedState(
                round: round,
                player: player,
                drawing: drawing,
                strokesLeft: round.setting.drawingStokeLimit,
                secondsLeft: round.setting.drawingSecLimit,
                localSketch: GameSketch(
                  strokeList: const [],
                  color: player.color,
                  canvasSize: const Size(0, 0),
                ),
              ),
            _ => GameDrawingFailureState(),
          };
  }
}
