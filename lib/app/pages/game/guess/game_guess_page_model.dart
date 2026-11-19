import 'package:trouble_painter/core/view/base_view_model.dart';
import 'package:trouble_painter/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:trouble_painter/features/analytics/domain/services/analytics_service.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

abstract class GameGuessPageModel extends BaseViewModel<GameGuessState> {
  GameGuessPageModel(super.buildState);

  late GameService gameService = ref.read(GameService.$.notifier);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);

  void init() {
    /// Send event
    analyticsService.sendEvent(GuessPageExposureEvent());
  }

  void onAnswerChanged(String keyword);

  void submitAnswer(String keyword, {required bool isEnter}) {
    /// Send event
    analyticsService.sendEvent(
      GuessPageSubmitEvent(remainMs: state.remainMs, isEnter: isEnter),
    );
  }

  /// For test
  void toggleIsMafia() {}
}
