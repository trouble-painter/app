import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/game/v1/data/repository/game_room_repository.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_step.dart';

class GameChangeStepUsecaseParam {
  final GameRoom room;
  final GameRoomState step;

  GameChangeStepUsecaseParam({required this.room, required this.step});
}

class GameChangeStepUsecase
    implements BaseUsecase<GameChangeStepUsecaseParam, Future<Result<void>>> {
  static final $ = AutoDisposeProvider<GameChangeStepUsecase>((ref) {
    return GameChangeStepUsecase(
      gameRoomRepository: ref.read(GameRoomRepository.$),
    );
  });

  final GameRoomRepository gameRoomRepository;
  GameChangeStepUsecase({
    required this.gameRoomRepository,
  });

  @override
  Future<Result<void>> call(GameChangeStepUsecaseParam param) {
    final (room, step) = (param.room, param.step);
    return gameRoomRepository.changeStep(room, step);
  }
}
