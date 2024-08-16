import 'package:x_pr/features/game/v2/data/repository/result/game_result_repository.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/result/game_result.dart';

class GameResultRepositoryImpl implements GameResultRepository {
  @override
  GameResult getGameResult(GameRound round) {
    final (players, spyId, voting) = (round.players, round.spyId, round.voting);
    final voteResult = List.generate(players.length, (_) => 0);
    voting.forEach((_, index) {
      if (index != -1) {
        voteResult[index] += 1;
      }
    });
    final spyIndex = players.indexWhere((p) => p.id == spyId);
    final spy = players[spyIndex];
    return GameResult(
      round,
      spy,
      players,
      voteResult[spyIndex],
      voteResult,
    );
  }
}
