import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/game/v1/data/repository/game_room_repository.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';

class GameResetTurnUsecase
    implements BaseUsecase<GameRoom, Future<Result<void>>> {
  static final $ = AutoDisposeProvider<GameResetTurnUsecase>((ref) {
    return GameResetTurnUsecase(
      gameRoomRepository: ref.read(GameRoomRepository.$),
    );
  });

  final GameRoomRepository gameRoomRepository;
  GameResetTurnUsecase({
    required this.gameRoomRepository,
  });

  @override
  Future<Result<void>> call(GameRoom room) {
    return gameRoomRepository.resetTurn(room);
  }
}
