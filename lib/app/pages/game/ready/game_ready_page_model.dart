import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/services/analytics_service.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';

abstract class GameReadyPageModel extends BaseViewModel<GameReadyState> {
  GameReadyPageModel(super.buildState);

  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);

  void init() {
    /// Send event
    analyticsService.sendEvent(ReadyPageExposureEvent());
  }

  /// For test
  void toggleRole() {}

  /// For test
  void goToDrawingStep() {}
}
