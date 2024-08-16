import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_state/game_state.dart';

abstract class GameVotingPageModel extends BaseViewModel<GameVotingState> {
  GameVotingPageModel(super.buildState);

  void vote(int index);

  /// For test
  void toggleIsMafia() {}

  /// For test
  void goToGuess() {}
}
