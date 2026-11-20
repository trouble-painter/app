import 'package:trouble_painter/app/pages/game/voting/game_voting_page_model.dart';
import 'package:trouble_painter/features/game/domain/entities/game_step.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

class GameVotingPageModelTest extends GameVotingPageModel {
  GameVotingPageModelTest(super.buildState);

  @override
  void vote(int index) {
    final isCancel = this.isCancel(index);
    super.vote(index);
    ref.read(GameService.$.notifier).emit(
          state.copyWith(
            votes: {
              for (final vote in state.votes.entries)
                if (vote.key != state.myId) vote.key: vote.value,
              if (!isCancel) state.myId: state.userList[index].id,
            },
          ),
        );
  }

  /// Each case is a list of (voter index, target index) in [userList]
  static const List<List<(int, int)>> _voteCases = [
    /// No votes
    [],

    /// One top suspect
    [(0, 1), (2, 1), (3, 2)],

    /// 2-way tie
    [(0, 1), (1, 0)],

    /// 3-way tie
    [(0, 1), (1, 2), (2, 0)],

    /// Everyone on one user
    [(0, 3), (1, 3), (2, 3), (3, 3), (4, 3)],
  ];

  int _voteCaseIndex = 0;

  @override
  void cycleVoteCase() {
    _voteCaseIndex = (_voteCaseIndex + 1) % _voteCases.length;
    final userList = state.userList;
    ref.read(GameService.$.notifier).emit(
          state.copyWith(
            votes: {
              for (final (voter, target) in _voteCases[_voteCaseIndex])
                userList[voter % userList.length].id:
                    userList[target % userList.length].id,
            },
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
