import 'package:x_pr/app/pages/game/ready/game_ready_page_model.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/features/game/domain/entities/game_step.dart';
import 'package:x_pr/features/game/domain/service/game_service.dart';

class GameReadyPageModelTest extends GameReadyPageModel {
  GameReadyPageModelTest(super.buildState);

  @override
  void toggleRole() {
    ref.read(GameService.$.notifier).emit(
          state.copyWith(
            startedAt: NetworkTime.now,
            isMafia: !state.isMafia,
          ),
        );
  }

  @override
  void goToDrawingStep() {
    ref.read(GameService.$.notifier).debugStep(GameStep.drawing);
  }
}
