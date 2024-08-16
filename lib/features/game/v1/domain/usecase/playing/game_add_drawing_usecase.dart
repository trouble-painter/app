import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/game/v1/data/repository/game_drawing_repository.dart';
import 'package:x_pr/features/game/v1/domain/entities/playing/game_drawing.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';

class GameAddDrawingUsecaseParam {
  final GameRoom room;
  final GameDrawing drawing;

  GameAddDrawingUsecaseParam(this.room, this.drawing);
}

class GameAddDrawingUsecase
    implements BaseUsecase<GameAddDrawingUsecaseParam, Future<Result<void>>> {
  static final $ = AutoDisposeProvider<GameAddDrawingUsecase>((ref) {
    return GameAddDrawingUsecase(
      gameDrawingRepository: ref.read(GameDrawingRepository.$),
    );
  });

  final GameDrawingRepository gameDrawingRepository;
  GameAddDrawingUsecase({
    required this.gameDrawingRepository,
  });

  @override
  Future<Result<void>> call(GameAddDrawingUsecaseParam param) {
    final (room, drawing) = (param.room, param.drawing);
    return gameDrawingRepository.addDrawing(room, drawing);
  }
}
