import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:trouble_painter/app/routes/routes.dart';
import 'package:trouble_painter/app/routes/routes_setting.dart';
import 'package:trouble_painter/core/view/base_view_model.dart';
import 'package:trouble_painter/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:trouble_painter/features/analytics/domain/services/analytics_service.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/entities/game_step.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

class GameExitConfirmDialogModel extends BaseViewModel<void> {
  GameExitConfirmDialogModel(super.buildState);

  BuildContext get context => ref.read(RoutesSetting.$).context;
  GameState get gameState => ref.read(GameService.$);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);
  GameStep get step => switch (gameState) {
        GameDisconnectedState() => throw UnimplementedError(),
        GameQuickStartWaitingState(step: final step) => step,
        GameWaitingState(step: final step) => step,
        GameReadyState(step: final step) => step,
        GameDrawingState(step: final step) => step,
        GameVotingState(step: final step) => step,
        GameGuessState(step: final step) => step,
        GameResultState(step: final step) => step,
      };

  void init() {
    /// Send event
    if (gameState is! GameDisconnectedState) {
      analyticsService.sendEvent(GameExitDialogExposureEvent(step));
    }
  }

  void onConfirm() {
    if (context.mounted) context.pop();
    context.popUntil(Routes.homePage);

    /// Send eveng
    if (gameState is! GameDisconnectedState) {
      analyticsService.sendEvent(GameExitDialogConfirmClickEvent(step));
    }
  }
}
