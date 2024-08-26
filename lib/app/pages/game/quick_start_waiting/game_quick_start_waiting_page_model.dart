import 'dart:async';

import 'package:x_pr/core/utils/log/webhook/webhook.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entity/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/service/analytics_service.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/service/game_service.dart';

abstract class GameQuickStartWaitingPageModel
    extends BaseViewModel<GameQuickStartWaitingState> {
  GameQuickStartWaitingPageModel(super.buildState);

  GameService get gameService => ref.read(GameService.$.notifier);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);
  Webhook get webhook => ref.read(Webhook.$);
  Config get config => ref.read(ConfigService.$);

  Timer? _webhookTimer;

  void init() {
    /// Send event
    analyticsService.sendEvent(QuickStartWaitingPageExposureEvent());
    _webhookTimer = Timer.periodic(
      Duration(seconds: config.quickStartWebHookWaitingSec),
      (_) {
        webhook.sendQuickStart(config.nickname, config.language);
        _webhookTimer?.cancel();
      },
    );
  }

  /// For test
  void goToReady() {}

  @override
  void dispose() {
    _webhookTimer?.cancel();
    super.dispose();
  }
}
