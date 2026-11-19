import 'package:trouble_painter/app/pages/game/drawing/game_drawing_page_model.dart';
import 'package:trouble_painter/core/utils/time/server_time.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/sketch.dart';
import 'package:trouble_painter/features/game/domain/entities/game_reaction.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/entities/game_step.dart';
import 'package:trouble_painter/features/game/domain/usecases/debug_ui_usecase.dart';

class GameDrawingPageModelTest extends GameDrawingPageModel {
  GameDrawingPageModelTest(super.buildState);

  /// Turn of [round] and [turn] starting now, like the server schedules it
  GameDrawingState _turnOf(int round, int turn) {
    final now = ServerTime.now;
    final animMs = turn > 0
        ? 0
        : round == 0
            ? state.introAnimMs + state.roundAnimMs
            : state.roundAnimMs;
    final drawFrom = now.add(Duration(milliseconds: animMs));
    final turnMs = state.turnMs;
    return state.copyWith(
      currentRound: round,
      drawerId: state.userList[turn].id,
      currentTurnStartedAt: now,
      drawFrom: drawFrom,
      deadline: drawFrom.add(Duration(milliseconds: turnMs)),
      currentSketch: Sketch.empty(),
      strokesLeft: state.strokesPerTurn,
      stage: GameDrawingStage.from(drawFrom),
    );
  }

  @override
  void testGoNext() {
    if (state.isFinalTurn) {
      gameService.debugStep(GameStep.voting);
      return;
    }
    final isNextTurn = state.currentTurn < state.userList.length - 1;
    final sketchList = state.currentSketch.strokeList.isEmpty
        ? state.sketchList
        : [...state.sketchList, state.currentSketch];
    final next = isNextTurn
        ? _turnOf(state.currentRound, state.currentTurn + 1)
        : _turnOf(state.currentRound + 1, 0);
    gameService.emit(next.copyWith(sketchList: sketchList));
    reserveRoundAnimRemoveTimer();
  }

  @override
  void testReset() {
    isStokeGuided = false;
    gameService.emit(_turnOf(0, 0).copyWith(sketchList: []));
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
    final isMafia = !state.isMafia;
    gameService.emit(
      state.copyWith(
        isMafia: isMafia,
        keyword: () => isMafia ? null : ref.read(DebugUiUsecase.$).keyword,
      ),
    );
  }

  /// On someone else's turn, the drawer is the one reacting.
  @override
  void onReactionPressed(GameReaction reaction) {
    if (state.isMyTurn) {
      super.onReactionPressed(reaction);
      return;
    }
    playReaction(GameReactionSent(userId: state.drawerId, reaction: reaction));
  }

  @override
  void testReactionReceived(GameReaction reaction) {
    state.reaction$Ctrl.sink.add(
      GameReactionSent(userId: state.userList.first.id, reaction: reaction),
    );
  }

  @override
  void endTurn() {
    super.endTurn();
    testGoNext();
  }

  @override
  void sendCurrentSketch(Sketch sketch) {}

  @override
  void sendUndoStroke() {}
}
