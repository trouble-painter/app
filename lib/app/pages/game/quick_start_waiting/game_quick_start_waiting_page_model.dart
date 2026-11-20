import 'package:trouble_painter/core/view/base_view_model.dart';
import 'package:trouble_painter/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:trouble_painter/features/analytics/domain/services/analytics_service.dart';
import 'package:trouble_painter/features/game/domain/entities/game_req/game_req.dart';
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
    _sendMatchFoundExposure();
  }

  void onStateChanged(GameQuickStartWaitingState? oldState) {
    if (oldState?.ready == null) _sendMatchFoundExposure();
  }

  void accept() {
    /// Send event
    analyticsService.sendEvent(QuickStartWaitingPageMatchAcceptClickEvent());
    gameService.request(const GameMatchAcceptReq());
  }

  /// Sent once per accept step: when it first shows up.
  void _sendMatchFoundExposure() {
    if (state.ready == null) return;
    analyticsService.sendEvent(QuickStartWaitingPageMatchFoundExposureEvent());
  }

  /// For test
  void goToReady() {}
}
