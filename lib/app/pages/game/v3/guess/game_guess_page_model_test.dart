import 'package:x_pr/app/pages/game/v3/guess/game_guess_page_model.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_step.dart';

class GameGuessPageModelTest extends GameGuessPageModel {
  GameGuessPageModelTest(super.buildState);

  @override
  void toggleIsMafia() {
    gameService.emit(
      state.copyWith(
        isMafia: !state.isMafia,
      ),
    );
  }

  @override
  void onAnswerChanged(String keyword) {
    gameService.emit(
      state.copyWith(
        mafiaAnswer: keyword,
      ),
    );
  }

  @override
  void submitAnswer(String keyword) {
    gameService.debugStep(GameStep.result);
  }
}
