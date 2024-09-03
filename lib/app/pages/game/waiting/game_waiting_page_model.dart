import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/utils/env/env.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entity/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/service/analytics_service.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
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

  String getDeepLink() {
    final inviteUrl = ref.read(ConfigService.$).inviteUrl;
    final roomId = state.roomId;
    final link = inviteUrl.replace(
      queryParameters: {
        "room": roomId,
        if (Env.FLAVOR.isDev) "flavor": "dev",
      },
    ).toString();
    return link;
  }

  Future<void> invite() async {
    /// Send event
    analyticsService.sendEvent(WaitingPageInviteClickEvent());
    final roomId = state.roomId;
    final link = getDeepLink();
    final text = S.current.gameWaitingInviteMessage(roomId, link);
    await Clipboard.setData(ClipboardData(text: text));
    Toast.showText(S.current.copied);
    await Share.share(text);
    return;
  }

  /// For test
  void kick(GameUser kickUser) {}

  /// For test
  void toggleHost() {}
}
