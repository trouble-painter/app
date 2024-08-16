import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/game/v1/data/repository/game_room_repository.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_step.dart';

class GameEndTurnUsecase
    implements BaseUsecase<GameRoom, Future<Result<void>>> {
  static final $ = AutoDisposeProvider<GameEndTurnUsecase>((ref) {
    return GameEndTurnUsecase(
      gameRoomRepository: ref.read(GameRoomRepository.$),
    );
  });

  final GameRoomRepository gameRoomRepository;
  GameEndTurnUsecase({
    required this.gameRoomRepository,
  });

  @override
  Future<Result<void>> call(GameRoom room) {
    assert(room.state == GameRoomState.playing);
    return gameRoomRepository.endTurn(room);
  }
}
