import 'package:trouble_painter/app/pages/game/voting/game_voting_page_model.dart';
import 'package:trouble_painter/features/game/domain/entities/game_step.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

class GameVotingPageModelTest extends GameVotingPageModel {
  GameVotingPageModelTest(super.buildState);

  @override
  void vote(int index, {bool isFromCanvas = false}) {
    final isCancel = this.isCancel(index);
    super.vote(index, isFromCanvas: isFromCanvas);
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
