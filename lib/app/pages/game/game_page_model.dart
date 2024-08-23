import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entity/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/service/analytics_service.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/service/game_service.dart';

class GamePageModel extends BaseViewModel<GameState> {
  GamePageModel(super.buildState);

  bool get isUiTestMode => ref.read(ConfigService.$).isUiTestMode;
  GameService get gameService => ref.read(GameService.$.notifier);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);

  void init() {
    WakelockPlus.enable();
    _logScreenViewEvent(state);
  }

  void onStateChanged(
    GameState state,
    GameState? oldState,
  ) {
    if (state.runtimeType != oldState.runtimeType) {
      _logScreenViewEvent(state);
    }
  }

  void _logScreenViewEvent(GameState state) {
    try {
      /// Send event
      final appEventScreen = AppEventScreen.fromGameState(state);
      analyticsService.sendScreenViewEvent(appEventScreen);
    } catch (_) {}
  }

  @override
  void dispose() {
    WakelockPlus.disable();
    if (!isUiTestMode) {
      gameService.exit();
    }
    super.dispose();
  }
}
