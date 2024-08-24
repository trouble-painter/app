import 'package:x_pr/app/pages/game/quick_start_waiting/game_quick_start_waiting_page_model.dart';
import 'package:x_pr/features/game/domain/entities/game_step.dart';

class GameQuickStartWaitingPageModelTest
    extends GameQuickStartWaitingPageModel {
  GameQuickStartWaitingPageModelTest(super.buildState);

  @override
  void goToReady() {
    gameService.debugStep(GameStep.ready);
  }
}
