import 'package:x_pr/app/pages/game/result/enums/game_result_type.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entity/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/service/analytics_service.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';

abstract class GameResultPageModel extends BaseViewModel<GameResultState> {
  GameResultPageModel(super.buildState);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);

  GameResultType get resultType {
    if (state.isMafiaWin && state.isMafiaCorrect) {
      return GameResultType.mafiaWinsByKeyword;
    } else if (state.isMafiaWin && !state.isMafiaCorrect) {
      return GameResultType.mafiaWinsByVote;
    } else {
      return GameResultType.citizensWin;
    }
  }

  void init() {
    /// Send event
    final event = switch (resultType) {
      GameResultType.mafiaWinsByVote => ResultPageMafiaWinsByVoteEvent(),
      GameResultType.mafiaWinsByKeyword => ResultPageMafiaWinsByKeywordEvent(),
      GameResultType.citizensWin => ResultPageCitizensWinEvent(),
    };
    analyticsService.sendEvent(event);
  }

  void restart();

  /// For test
  void changeResultType() {}
}
