import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/features/game/v2/data/repository/result/game_result_repository_impl.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/result/game_result.dart';

abstract interface class GameResultRepository {
  static final $ = AutoDisposeProvider<GameResultRepository>((ref) {
    return GameResultRepositoryImpl();
  });

  GameResult getGameResult(GameRound round);
}
