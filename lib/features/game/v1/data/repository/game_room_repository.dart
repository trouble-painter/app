import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/game/v1/data/repository/game_room_repository_impl.dart';
import 'package:x_pr/features/game/v1/data/source/game_firestore_source.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_player.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_step.dart';

abstract interface class GameRoomRepository {
  static final $ = AutoDisposeProvider<GameRoomRepository>((ref) {
    return GameRoomRepositoryImpl(
      gameFirestoreSource: ref.read(GameFirestoreSource.$),
    );
  });

  Future<Result<GameRoom>> create(GameRoom room);

  Future<Result<GameRoom>> get(String roomId);

  Future<Result<GameRoom>> join({
    required GameRoom room,
    required GamePlayer player,
  });

  Future<Result<void>> left({
    required GameRoom room,
    required GamePlayer player,
  });

  Future<Result<Stream<GameRoom>>> subscribe(String roomId);

  Future<Result<GameRoom>> start(GameRoom room);

  Future<Result<void>> play(GameRoom room);

  Future<Result<void>> removePlay(GameRoom room, GamePlayer targetPlayer);

  Future<Result<void>> endTurn(GameRoom room);

  Future<Result<void>> resetTurn(GameRoom room);

  Future<Result<void>> changeStep(GameRoom room, GameRoomState step);

  Future<Result<GameRoom?>> getLatestRoom();
}
