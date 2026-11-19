import 'package:trouble_painter/core/view/base_view_model.dart';
import 'package:trouble_painter/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:trouble_painter/features/analytics/domain/services/analytics_service.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

abstract class GameQuickStartWaitingPageModel
    extends BaseViewModel<GameQuickStartWaitingState> {
  GameQuickStartWaitingPageModel(super.buildState);

  GameService get gameService => ref.read(GameService.$.notifier);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);

  void init(bool isUiTestMode) {
    if (isUiTestMode) return;

    /// Send event
    analyticsService.sendEvent(QuickStartWaitingPageExposureEvent());
  }

  /// For test
  void goToReady() {}
}
