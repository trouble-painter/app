import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/utils/serializer/deep_serializer.dart';
import 'package:x_pr/features/game/v2/data/repository/round/game_round_repository.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round.dart';

class GameRoundFirestoreSource {
  static const _cRounds = 'rounds';

  static final $ = AutoDisposeProvider<GameRoundFirestoreSource>((ref) {
    return GameRoundFirestoreSource(
      rounds: FirebaseFirestore.instance.collection(_cRounds),
    );
  });

  final CollectionReference<Map<String, dynamic>> rounds;
  GameRoundFirestoreSource({required this.rounds});

  Future<Result<GameRound>> create(GameRound round) async {
    try {
      final doc = const DeepSerializer().toJson(round.toJson());
      await rounds.doc(round.id).set(doc);
      return Success(round);
    } catch (e, s) {
      Logger.e("Failed to create", e, s);
      return Failure(e);
    }
  }

  Future<Result<GameRound>> get(String roundId) async {
    try {
      final snapshot = await rounds.doc(roundId).get();
      final doc = snapshot.data();
      if (doc == null) {
        return const Failure(GameRoundRepositoryException.notFound);
      } else {
        return Success(GameRound.fromJson(doc));
      }
    } catch (e, s) {
      Logger.e("Failed to get", e, s);
      return Failure(e);
    }
  }

  Future<Result<Stream<GameRound>>> subscribe(String roundId) async {
    try {
      final stream = rounds.doc(roundId).snapshots().transform<GameRound>(
        StreamTransformer.fromHandlers(
          handleData: (json, sink) {
            final room = GameRound.fromJson(json.data()!);
            sink.add(room);
          },
        ),
      );
      return Success(stream);
    } catch (e, s) {
      Logger.e("Failed to subscribe", e, s);
      return Failure(e);
    }
  }

  Future<Result<void>> update(
    String roundId,
    Map<String, dynamic> data,
  ) async {
    try {
      await rounds.doc(roundId).update(data);
      return const Success(null);
    } catch (e, s) {
      Logger.e("Failed to update", e, s);
      return Failure(e);
    }
  }
}
