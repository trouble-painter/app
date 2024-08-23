import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entity/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/service/analytics_service.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';

abstract class GameVotingPageModel extends BaseViewModel<GameVotingState> {
  GameVotingPageModel(super.buildState);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);

  void init() {
    /// Send event
    analyticsService.sendEvent(VotingPageExposureEvent());
  }

  void vote(int index) {
    /// Send event
    analyticsService.sendEvent(
      VotingPageVoteEvent(
        nVoter: state.voteResult[index].length,
        remainMs: state.remainMs,
        isMe: index == state.myTurn,
      ),
    );
  }

  /// For test
  void toggleIsMafia() {}

  /// For test
  void goToGuess() {}
}
