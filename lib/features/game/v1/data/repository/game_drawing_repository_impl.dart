import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/game/v1/data/repository/game_drawing_repository.dart';
import 'package:x_pr/features/game/v1/data/source/game_firestore_source.dart';
import 'package:x_pr/features/game/v1/domain/entities/playing/game_drawing.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';

class GameDrawingRepositoryImpl implements GameDrawingRepository {
  final GameFirestoreSource gameFirestoreSource;
  GameDrawingRepositoryImpl({
    required this.gameFirestoreSource,
  });

  @override
  Future<Result<void>> addDrawing(GameRoom room, GameDrawing drawing) {
    return gameFirestoreSource.drawing(room, drawing);
  }

  @override
  Future<Result<Stream<List<GameDrawing>>>> subscribeDrawing(GameRoom room) {
    return gameFirestoreSource.subscribeDrawing(room);
  }
}
