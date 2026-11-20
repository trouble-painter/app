import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:trouble_painter/app/routes/routes.dart';
import 'package:trouble_painter/app/routes/routes_setting.dart';
import 'package:trouble_painter/core/view/base_view_model.dart';
import 'package:trouble_painter/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:trouble_painter/features/analytics/domain/services/analytics_service.dart';
import 'package:trouble_painter/features/audio/domain/services/audio_service.dart';
import 'package:trouble_painter/features/config/domain/entities/config.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

class GamePageModel extends BaseViewModel<GameState> {
  GamePageModel(super.buildState);

  bool get isUiTestMode => ref.read(ConfigService.$).isUiTestMode;
  GameService get gameService => ref.read(GameService.$.notifier);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);
  AudioService get audioService => ref.read(AudioService.$);
  Config get config => ref.read(ConfigService.$);

  void init() {
    WakelockPlus.enable();
    _logScreenViewEvent(state);
  }

  void onStateChanged(
    GameState state,
    GameState? oldState,
  ) {
    if (state is GameDisconnectedState && state.isKicked) {
      _showKickedDialog();
    }
    if (state.runtimeType != oldState.runtimeType) {
      if (!config.isGameBgmDisabled) {
        _setBgm(state);
      }
      _logScreenViewEvent(state);
    }
  }

  /// GamePage closes with this state, so the dialog opens over the page below it.
  void _showKickedDialog() {
    final context = ref.read(RoutesSetting.$).context;

    /// Send event
    analyticsService.sendEvent(WaitingPageKickedExposureEvent());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) context.pushNamed(Routes.gameKickedDialog.name);
    });
  }

  void _setBgm(GameState state) {
    if (state is GameResultState) {
      audioService.playResult(isWin: state.isMeWin);
    } else {
      audioService.play(isInGame: state.isPlaying);
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
    if (!config.isGameBgmDisabled) {
      audioService.play(isInGame: false);
    }
    WakelockPlus.disable();
    if (!isUiTestMode) {
      gameService.exit();
    }
    super.dispose();
  }
}
