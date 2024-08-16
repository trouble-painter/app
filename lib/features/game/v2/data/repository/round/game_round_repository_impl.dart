import 'dart:math';

import 'package:uuid/v4.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/features/game/v2/data/repository/round/game_round_repository.dart';
import 'package:x_pr/features/game/v2/data/source/game_keyword_source.dart';
import 'package:x_pr/features/game/v2/data/source/game_round_firestore_source.dart';
import 'package:x_pr/features/game/v2/domain/entities/room/game_room.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round_setting.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round_step.dart';

class GameRoundRepositoryImpl implements GameRoundRepository {
  final GameRoundFirestoreSource gameRoundFirestoreSource;
  final GameKeywordSource gameKeywordSource;

  GameRoundRepositoryImpl({
    required this.gameRoundFirestoreSource,
    required this.gameKeywordSource,
  });

  @override
  Future<Result<GameRound>> startWaiting(
    GameRoom room,
    GameRoundSetting setting,
  ) {
    final roundId = const UuidV4().generate().split('-').first;
    final spyId = room.players[Random().nextInt(room.players.length)].id;
    final players = room.players.toList()..shuffle();
    final round = GameRound(
      id: roundId,
      roomId: room.id,
      hostId: room.hostId,
      spyId: spyId,
      step: GameRoundStep.waiting,
      voting: {for (int i = 0; i < players.length; i++) i: -1},
      secondsLeft: setting.waitingSec,
      keyword: gameKeywordSource.random(),
      players: players,
      setting: setting,
      spyAnswer: '',
      startedAt: NetworkTime.now,
    );
    return gameRoundFirestoreSource.create(round);
  }

  @override
  Future<Result<GameRound>> get(String roundId) {
    return gameRoundFirestoreSource.get(roundId);
  }

  @override
  Future<Result<Stream<GameRound>>> subscribe(String roundId) {
    return gameRoundFirestoreSource.subscribe(roundId);
  }

  @override
  Future<Result<void>> updateSecondsLeft(
    String roundId,
    int secondsLeft,
  ) {
    return gameRoundFirestoreSource.update(
      roundId,
      {"secondsLeft": secondsLeft},
    );
  }

  @override
  Future<Result<void>> startPlaying(GameRound round, String drawingId) {
    return gameRoundFirestoreSource.update(round.id, {
      "drawingId": drawingId,
      "step": GameRoundStep.drawing.name,
    });
  }

  @override
  Future<Result<void>> updateStep(String roundId, GameRoundStep step) {
    return gameRoundFirestoreSource.update(roundId, {
      "step": step.name,
    });
  }

  @override
  Future<Result<void>> startVoting(GameRound round) {
    return gameRoundFirestoreSource.update(round.id, {
      "secondsLeft": round.setting.votingSecLimit,
      "step": GameRoundStep.voting.name,
    });
  }

  @override
  Future<Result<void>> vote(
    String roundId,
    int voter,
    int target,
  ) {
    return gameRoundFirestoreSource.update(roundId, {
      "voting.$voter": target,
    });
  }

  @override
  Future<Result<void>> updateKeyword(String roundId, String keyword) {
    return gameRoundFirestoreSource.update(roundId, {
      "spyAnswer": keyword,
    });
  }

  @override
  Future<Result<void>> startAnswering(GameRound round) {
    return gameRoundFirestoreSource.update(round.id, {
      "secondsLeft": round.setting.spyAnsweringSecLimit,
      "step": GameRoundStep.answering.name,
    });
  }

  @override
  Future<Result<void>> startEnding(String roundId) {
    return gameRoundFirestoreSource.update(roundId, {
      "step": GameRoundStep.ending.name,
    });
  }
}
