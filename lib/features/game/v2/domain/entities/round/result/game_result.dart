import 'package:x_pr/features/game/v2/domain/entities/common/game_player.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round.dart';

class GameResult {
  final GameRound round;
  final GamePlayer spy;
  final List<GamePlayer> players;
  final List<int> voteResult;
  final int nSpyVote;

  List<GamePlayer> get mostVotedCitizens {
    if (!isSpyFound) {
      return [];
    }
    final maxVotes = voteResult.reduce((c, n) => c > n ? c : n);
    List<GamePlayer> citizens = [];
    for (int i = 0; i < voteResult.length; i++) {
      if (voteResult[i] == maxVotes && spy.id != players[i].id) {
        citizens.add(players[i]);
      }
    }
    return citizens;
  }

  bool get isSpyFound {
    return voteResult.where((total) => total >= nSpyVote).length == 1;
  }

  bool get isSpyAnswering {
    final spyAnswer = round.spyAnswer.toLowerCase().trim();
    return [
      round.keyword.ko.trim(),
      round.keyword.en.toLowerCase().trim(),
    ].contains(spyAnswer);
  }

  GameResult(
    this.round,
    this.spy,
    this.players,
    this.nSpyVote,
    this.voteResult,
  );
}
