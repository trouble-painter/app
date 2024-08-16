import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/game/v2/data/repository/drawing/game_drawing_repository.dart';
import 'package:x_pr/features/game/v2/data/source/game_drawing_firestore_source.dart';
import 'package:x_pr/features/game/v2/domain/entities/common/game_player.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_drawing.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_sketch.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round.dart';

class GameDrawingRepositoryImpl implements GameDrawingRepository {
  GameDrawingRepositoryImpl({required this.gameDrawingFirestoreSource});
  final GameDrawingFirestoreSource gameDrawingFirestoreSource;

  @override
  Future<Result<GameDrawing>> create(GameDrawing drawing) {
    return gameDrawingFirestoreSource.create(drawing);
  }

  @override
  Future<Result<GameDrawing>> get(String drawingId) {
    return gameDrawingFirestoreSource.get(drawingId);
  }

  @override
  Future<Result<void>> updateTurn(
    String drawingId,
    List<GamePlayer> players,
    int turn,
  ) async {
    if (turn >= players.length) {
      return Failure(
        'Turn($turn) must be less than the number of players(${players.length}).',
      );
    } else {
      return gameDrawingFirestoreSource.updateTurn(drawingId, turn);
    }
  }

  @override
  Future<Result<Stream<GameDrawing>>> subscribe(String drawingId) {
    return gameDrawingFirestoreSource.subscribe(drawingId);
  }

  @override
  Future<Result<void>> updateSketchList(
    String drawingId,
    List<GameSketch> sketchList,
  ) {
    return gameDrawingFirestoreSource.updateSketchList(drawingId, sketchList);
  }

  @override
  Future<Result<void>> reset(GameDrawing drawing) {
    return gameDrawingFirestoreSource.reset(drawing);
  }

  @override
  Future<Result<void>> updateStep(
    String drawingId,
    GameRound round,
    int step,
  ) async {
    if (step > round.setting.stepLimit) {
      return Failure(
        'Step($step) must be less than the stepLimit(${round.setting.stepLimit}).',
      );
    } else {
      return gameDrawingFirestoreSource.updateStep(drawingId, step);
    }
  }
}
