import 'package:x_pr/app/pages/game/voting/game_voting_page_model.dart';
import 'package:x_pr/features/game/domain/entities/game_step.dart';
import 'package:x_pr/features/game/domain/service/game_service.dart';

class GameVotingPageModelTest extends GameVotingPageModel {
  GameVotingPageModelTest(super.buildState);

  @override
  void vote(int index) {
    final voterList = state.voteResult[index];
    int? myVoteIndex;
    if (voterList.contains(state.me)) {
      // Voting cannot be canceled
      // state.voteResult[index].remove(state.me);
      // myVoteIndex = -1;
      return;
    } else {
      if (state.myVoteIndex != -1) {
        state.voteResult[state.myVoteIndex].remove(state.me);
      }
      state.voteResult[index].add(state.me);
      myVoteIndex = index;
    }

    ref.read(GameService.$.notifier).emit(
          state.copyWith(
            myVoteIndex: myVoteIndex,
            voteResult: state.voteResult,
          ),
        );
  }

  @override
  void toggleIsMafia() {
    ref.read(GameService.$.notifier).emit(
          state.copyWith(
            isMafia: !state.isMafia,
          ),
        );
  }

  @override
  void goToGuess() {
    ref.read(GameService.$.notifier).debugStep(GameStep.guess);
  }
}
