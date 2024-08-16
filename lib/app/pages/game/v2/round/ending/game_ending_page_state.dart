import 'package:x_pr/features/game/v2/domain/entities/common/game_player.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/result/game_result.dart';

sealed class GameEndingPageState {}

class GameEndingLoadingState extends GameEndingPageState {}

class SpyWinByAnsweringState extends GameEndingPageState {
  final GameResult result;
  SpyWinByAnsweringState(this.result);
  SpyWinByAnsweringState copyWith({
    GameResult? result,
  }) {
    return SpyWinByAnsweringState(
      result ?? this.result,
    );
  }
}

class SpyWinByVotingState extends GameEndingPageState {
  final GameResult result;
  final GamePlayer? mostVotedCitizen;
  SpyWinByVotingState(this.result, this.mostVotedCitizen);
}

class CitizenWinState extends GameEndingPageState {
  final GameResult result;
  CitizenWinState(this.result);
}
