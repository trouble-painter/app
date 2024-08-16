import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/game/v1/data/repository/game_drawing_repository.dart';
import 'package:x_pr/features/game/v1/domain/entities/playing/game_drawing.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';

class GameSubscribeDrawingUsecase
    implements
        BaseUsecase<GameRoom, Future<Result<Stream<List<GameDrawing>>>>> {
  static final $ = AutoDisposeProvider<GameSubscribeDrawingUsecase>((ref) {
    return GameSubscribeDrawingUsecase(
      gameDrawingRepository: ref.read(GameDrawingRepository.$),
    );
  });

  final GameDrawingRepository gameDrawingRepository;
  GameSubscribeDrawingUsecase({
    required this.gameDrawingRepository,
  });

  @override
  Future<Result<Stream<List<GameDrawing>>>> call(GameRoom room) {
    return gameDrawingRepository.subscribeDrawing(room);
  }
}
