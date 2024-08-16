import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/game/v2/data/repository/round/game_round_repository_impl.dart';
import 'package:x_pr/features/game/v2/data/source/game_keyword_source.dart';
import 'package:x_pr/features/game/v2/data/source/game_round_firestore_source.dart';
import 'package:x_pr/features/game/v2/domain/entities/room/game_room.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round_setting.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round_step.dart';

enum GameRoundRepositoryException {
  notFound,
}

abstract interface class GameRoundRepository {
  static final $ = AutoDisposeProvider<GameRoundRepository>((ref) {
    return GameRoundRepositoryImpl(
      gameRoundFirestoreSource: ref.read(GameRoundFirestoreSource.$),
      gameKeywordSource: ref.read(GameKeywordSource.$),
    );
  });

  Future<Result<GameRound>> startWaiting(
      GameRoom room, GameRoundSetting setting,);

  Future<Result<GameRound>> get(String roundId);

  Future<Result<void>> updateStep(String roundId, GameRoundStep step);

  Future<Result<Stream<GameRound>>> subscribe(String roundId);

  Future<Result<void>> updateSecondsLeft(String roundId, int secondsLeft);

  Future<Result<void>> startPlaying(GameRound round, String drawingId);

  Future<Result<void>> startVoting(GameRound round);

  Future<Result<void>> vote(
    String roundId,
    int voter,
    int target,
  );

  Future<Result<void>> updateKeyword(String roundId, String keyword);

  Future<Result<void>> startAnswering(GameRound round);

  Future<Result<void>> startEnding(String roundId);
}
