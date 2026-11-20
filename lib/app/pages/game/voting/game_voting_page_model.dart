import 'package:flutter/foundation.dart';
import 'package:trouble_painter/core/view/base_view_model.dart';
import 'package:trouble_painter/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:trouble_painter/features/analytics/domain/services/analytics_service.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/entities/game_user.dart';

abstract class GameVotingPageModel extends BaseViewModel<GameVotingState> {
  GameVotingPageModel(super.buildState);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);

  void init() {
    /// Send event
    analyticsService.sendEvent(VotingPageExposureEvent());
  }

  /// Pressing the user I already voted for withdraws the vote.
  bool isCancel(int index) => index == state.myVoteIndex;

  void vote(int index) {
    /// Send event
    analyticsService.sendEvent(
      VotingPageVoteEvent(
        nVoter: state.voteResult[index].length,
        remainMs: state.remainMs,
        isMe: index == state.myTurn,
        isCancel: isCancel(index),
      ),
    );
  }

  /// Send an event when the top-voted suspect changes
  void onVotesChanged(GameVotingState state, GameVotingState? oldState) {
    final topUsers = state.topVotedUsers;
    if (topUsers.isEmpty) return;
    final topIds = [for (final user in topUsers) user.id];
    final oldTopIds = [
      for (final user in oldState?.topVotedUsers ?? <GameUser>[]) user.id,
    ];
    if (listEquals(topIds, oldTopIds)) return;
    analyticsService.sendEvent(
      VotingPageSuspectChangedEvent(
        nSuspect: topUsers.length,
        nVoter: state.voteResult[state.userList.indexOf(topUsers.first)].length,
      ),
    );
  }

  /// For test
  void toggleIsMafia() {}

  /// For test
  void goToGuess() {}
}
