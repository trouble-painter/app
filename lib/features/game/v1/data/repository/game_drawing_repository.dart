import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/game/v1/data/repository/game_drawing_repository_impl.dart';
import 'package:x_pr/features/game/v1/data/source/game_firestore_source.dart';
import 'package:x_pr/features/game/v1/domain/entities/playing/game_drawing.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';

abstract interface class GameDrawingRepository {
  static final $ = AutoDisposeProvider<GameDrawingRepository>((ref) {
    return GameDrawingRepositoryImpl(
      gameFirestoreSource: ref.read(GameFirestoreSource.$),
    );
  });

  Future<Result<void>> addDrawing(
    GameRoom room,
    GameDrawing drawing,
  );

  Future<Result<Stream<List<GameDrawing>>>> subscribeDrawing(
    GameRoom room,
  );
}
