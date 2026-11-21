import 'package:trouble_painter/app/pages/game/quick_start_waiting/game_quick_start_waiting_page_model.dart';
import 'package:trouble_painter/core/utils/time/server_time.dart';
import 'package:trouble_painter/features/game/domain/entities/game_match_ready.dart';
import 'package:trouble_painter/features/game/domain/entities/game_step.dart';

class GameQuickStartWaitingPageModelTest
    extends GameQuickStartWaitingPageModel {
  GameQuickStartWaitingPageModelTest(super.buildState);

  static const int _acceptMs = 10000;

  /// Long press: first shows the ready step, then goes to the game.
  @override
  void goToReady() {
    if (state.ready != null) {
      gameService.debugStep(GameStep.ready);
      return;
    }
    gameService.emit(
      state.copyWith(
        ready: GameMatchReady(
          endsAt: ServerTime.now.add(const Duration(milliseconds: _acceptMs)),
          acceptMs: _acceptMs,
          isAccepted: false,
        ),
      ),
    );
  }

  @override
  void accept() {
    final ready = state.ready;
    if (ready == null) return;
    gameService.emit(
      state.copyWith(
        ready: GameMatchReady(
          endsAt: ready.endsAt,
          acceptMs: ready.acceptMs,
          isAccepted: true,
        ),
      ),
    );
  }
}
