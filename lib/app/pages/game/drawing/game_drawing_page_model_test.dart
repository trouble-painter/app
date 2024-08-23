import 'package:x_pr/app/pages/game/drawing/game_drawing_page_model.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/features/game/domain/entities/drawing/sketch.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/entities/game_step.dart';

class GameDrawingPageModelTest extends GameDrawingPageModel {
  GameDrawingPageModelTest(super.buildState);

  @override
  void goNext() {
    if (state.isFinalTurn) {
      gameService.debugStep(GameStep.voting);
    } else {
      final nextState = GameDrawingState.next(state);
      gameService.emit(nextState);
    }
  }

  @override
  void reset() {
    gameService.emit(
      state.copyWith(
        stage: GameDrawingStage.round,
        currentRound: 0,
        currentTurn: 0,
        currentTurnStartedAt: NetworkTime.now,
      ),
    );
    reserveRoundAnimRemoveTimer();
  }

  @override
  void nextSection() {
    final currentIndex = GameDrawingStage.values.indexOf(state.stage);
    final nextIndex = (currentIndex + 1) % GameDrawingStage.values.length;
    gameService.emit(
      state.copyWith(
        stage: GameDrawingStage.values[nextIndex],
      ),
    );
  }

  @override
  void toggleIsMafia() {
    gameService.emit(
      state.copyWith(
        isMafia: !state.isMafia,
      ),
    );
  }

  @override
  void endTurn() {
    super.endTurn();
    goNext();
  }

  @override
  void sendCurrentSketch(Sketch sketch) {}
}
