import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/game/v1/data/repository/game_room_repository.dart';
import 'package:x_pr/features/game/v1/data/source/game_firestore_source.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_player.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_step.dart';

class GameRoomRepositoryImpl implements GameRoomRepository {
  final GameFirestoreSource gameFirestoreSource;

  GameRoomRepositoryImpl({required this.gameFirestoreSource});

  @override
  Future<Result<GameRoom>> create(GameRoom room) {
    return gameFirestoreSource.createRoom(room);
  }

  @override
  Future<Result<GameRoom>> join({
    required GameRoom room,
    required GamePlayer player,
  }) {
    return gameFirestoreSource.joinRoom(room: room, player: player);
  }

  @override
  Future<Result<GameRoom>> get(String roomId) {
    return gameFirestoreSource.getRoom(roomId);
  }

  @override
  Future<Result<Stream<GameRoom>>> subscribe(String roomId) {
    return gameFirestoreSource.subscribeRoom(roomId);
  }

  @override
  Future<Result<void>> left({
    required GameRoom room,
    required GamePlayer player,
  }) {
    return gameFirestoreSource.leftRoom(
      roomId: room.id,
      player: player,
    );
  }

  @override
  Future<Result<GameRoom>> start(GameRoom room) {
    return gameFirestoreSource.start(room);
  }

  @override
  Future<Result<void>> play(GameRoom room) {
    return gameFirestoreSource.play(room);
  }

  @override
  Future<Result<void>> endTurn(GameRoom room) {
    return gameFirestoreSource.endTurn(room);
  }

  @override
  Future<Result<void>> changeStep(GameRoom room, GameRoomState step) {
    return gameFirestoreSource.changeStep(room, step);
  }

  @override
  Future<Result<void>> removePlay(GameRoom room, GamePlayer targetPlayer) {
    return gameFirestoreSource.removePlayer(room, targetPlayer);
  }

  @override
  Future<Result<GameRoom?>> getLatestRoom() {
    return gameFirestoreSource.getLatestRoom();
  }

  @override
  Future<Result<void>> resetTurn(GameRoom room) {
    return gameFirestoreSource.resetTurn(room);
  }
}
