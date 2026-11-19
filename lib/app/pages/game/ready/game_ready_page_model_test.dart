import 'package:trouble_painter/app/pages/game/ready/game_ready_page_model.dart';
import 'package:trouble_painter/core/utils/time/server_time.dart';
import 'package:trouble_painter/features/game/domain/entities/game_step.dart';
import 'package:trouble_painter/features/game/domain/usecases/debug_ui_usecase.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

class GameReadyPageModelTest extends GameReadyPageModel {
  GameReadyPageModelTest(super.buildState);

  @override
  void toggleRole() {
    final isMafia = !state.isMafia;
    ref.read(GameService.$.notifier).emit(
          state.copyWith(
            deadline: ServerTime.now.add(
              Duration(milliseconds: state.readyMs),
            ),
            isMafia: isMafia,
            keyword: () =>
                isMafia ? null : ref.read(DebugUiUsecase.$).keyword,
          ),
        );
  }

  @override
  void goToDrawingStep() {
    ref.read(GameService.$.notifier).debugStep(GameStep.drawing);
  }
}
