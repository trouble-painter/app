import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entity/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/service/analytics_service.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/entities/game_user.dart';

abstract class GameWaitingViewModel extends BaseViewModel<GameWaitingState> {
  GameWaitingViewModel(super.buildState);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);

  void init() {
    /// Send event
    analyticsService.sendEvent(WaitingPageExposureEvent());
  }

  void onStateChanged(GameWaitingState oldState) {
    if (!oldState.isHost && state.isHost) {
      /// Be host
      Toast.showText(S.current.gameWaitingYouAreHost);
    }
  }

  void start() {
    /// Send event
    analyticsService.sendEvent(WaitingPageStartClickEvent());
  }

  Future<void> invite() async {
    /// Send event
    analyticsService.sendEvent(WaitingPageInviteClickEvent());
  }

  /// For test
  void kick(GameUser kickUser) {}

  /// For test
  void toggleHost() {}
}
