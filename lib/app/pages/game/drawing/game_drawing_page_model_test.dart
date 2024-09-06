import 'package:x_pr/app/pages/game/drawing/game_drawing_page_model.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/features/game/domain/entities/drawing/sketch.dart';
import 'package:x_pr/features/game/domain/entities/game_reaction.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/entities/game_step.dart';

class GameDrawingPageModelTest extends GameDrawingPageModel {
  GameDrawingPageModelTest(super.buildState);

  @override
  void testGoNext() {
    if (state.isFinalTurn) {
      gameService.debugStep(GameStep.voting);
    } else {
      final nextState = _next();
      gameService.emit(nextState);
    }
  }

  GameDrawingState _next() {
    switch (state.stage) {
      case GameDrawingStage.round:
        return state.copyWith(
          stage: GameDrawingStage.play,
          currentTurnStartedAt: NetworkTime.now,
        );
      case GameDrawingStage.play:
        final isNextTurn = state.currentTurn < state.userList.length - 1;
        if (isNextTurn) {
          return state.copyWith(
            currentTurn: state.currentTurn + 1,
            currentTurnStartedAt: NetworkTime.now,
            currentSketch: Sketch.empty(),
            strokesLeft: state.maxStroke,
            sketchList: [...state.sketchList, state.currentSketch],
          );
        }

        final isNextRound = state.currentRound < state.maxRound;
        if (isNextRound) {
          return state.copyWith(
            stage: GameDrawingStage.round,
            currentRound: state.currentRound + 1,
            currentTurn: 0,
            currentTurnStartedAt: NetworkTime.now,
            currentSketch: Sketch.empty(),
            strokesLeft: state.maxStroke,
            sketchList: [...state.sketchList, state.currentSketch],
          );
        } else {
          return state;
        }
    }
  }

  @override
  void testReset() {
    isStokeGuided = false;
    gameService.emit(
      state.copyWith(
        stage: GameDrawingStage.round,
        currentRound: 0,
        currentTurn: 0,
        currentTurnStartedAt: NetworkTime.now,
        currentSketch: Sketch.empty(),
        sketchList: [],
        strokesLeft: state.maxStroke,
      ),
    );
    reserveRoundAnimRemoveTimer();
  }

  @override
  void testNextSection() {
    final currentIndex = GameDrawingStage.values.indexOf(state.stage);
    final nextIndex = (currentIndex + 1) % GameDrawingStage.values.length;
    gameService.emit(
      state.copyWith(
        stage: GameDrawingStage.values[nextIndex],
      ),
    );
  }

  @override
  void testToggleIsMafia() {
    gameService.emit(
      state.copyWith(
        isMafia: !state.isMafia,
      ),
    );
  }

  @override
  void testReactionReceived(GameReaction reaction) {
    state.reaction$Ctrl.sink.add(reaction);
  }

  @override
  void endTurn() {
    super.endTurn();
    testGoNext();
  }

  @override
  void sendCurrentSketch(Sketch sketch) {}
}
