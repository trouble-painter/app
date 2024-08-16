import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/game/v2/data/repository/room/game_room_repository_impl.dart';
import 'package:x_pr/features/game/v2/data/source/game_room_firestore_source.dart';
import 'package:x_pr/features/game/v2/domain/entities/common/game_player.dart';
import 'package:x_pr/features/game/v2/domain/entities/room/game_room.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round.dart';

enum GameRoomRepositoryException {
  full,
  notFound,
}

abstract interface class GameRoomRepository {
  static final $ = AutoDisposeProvider<GameRoomRepository>((ref) {
    return GameRoomRepositoryImpl(
      gameRoomFirestoreSource: ref.read(GameRoomFirestoreSource.$),
    );
  });

  List<Color> notUsedColors(GameRoom room);

  Future<Result<GameRoom?>> getLatest();

  Future<Result<GameRoom>> create(String uuid, String nickname);

  Future<Result<GameRoom>> join({
    required String roomId,
    required String uuid,
    required String nickname,
  });

  Future<Result<Stream<GameRoom>>> subscribe(String roomId);

  Future<Result<void>> updateSetting(GameRoom room);

  Future<Result<GameRoom>> get(String roomId);

  Future<Result<void>> left(GameRoom room, GamePlayer player);

  Future<Result<void>> linkToRound(GameRoom room, GameRound round);

  Future<Result<void>> unlinkToRound(GameRoom room, GameRound round);

  Future<Result<void>> clearPlayers(String roomId);
}
