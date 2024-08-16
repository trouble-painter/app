import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/game/v2/data/repository/drawing/game_drawing_repository_impl.dart';
import 'package:x_pr/features/game/v2/data/source/game_drawing_firestore_source.dart';
import 'package:x_pr/features/game/v2/domain/entities/common/game_player.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_drawing.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_sketch.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round.dart';

enum GameDrawingRepositoryException {
  notFound,
}

abstract interface class GameDrawingRepository {
  static final $ = AutoDisposeProvider<GameDrawingRepository>((ref) {
    return GameDrawingRepositoryImpl(
      gameDrawingFirestoreSource: ref.read(GameDrawingFirestoreSource.$),
    );
  });

  Future<Result<GameDrawing>> create(GameDrawing drawing);

  Future<Result<GameDrawing>> get(String drawingId);

  Future<Result<void>> updateTurn(
    String drawingId,
    List<GamePlayer> players,
    int turn,
  );
  
  Future<Result<void>> updateStep(
    String drawingId,
    GameRound round,
    int step,
  );

  Future<Result<void>> reset(GameDrawing drawing);

  Future<Result<void>> updateSketchList(
    String drawingId,
    List<GameSketch> sketchList,
  );

  Future<Result<Stream<GameDrawing>>> subscribe(String drawingId);
}
