import 'package:x_pr/app/pages/game/guess/game_guess_page_model.dart';
import 'package:x_pr/features/game/domain/entities/game_step.dart';

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
  void submitAnswer(String keyword, {required bool isEnterPressed}) {
    super.submitAnswer(keyword, isEnterPressed: isEnterPressed);
    gameService.debugStep(GameStep.result);
  }
}
