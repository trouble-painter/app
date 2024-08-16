import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/game/v1/data/repository/game_room_repository.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';

class GameGetLatestRoom
    implements BaseUsecase<void, Future<Result<GameRoom?>>> {
  static final $ = AutoDisposeProvider<GameGetLatestRoom>((ref) {
    return GameGetLatestRoom(
      gameRoomRepository: ref.read(GameRoomRepository.$),
    );
  });

  final GameRoomRepository gameRoomRepository;
  GameGetLatestRoom({
    required this.gameRoomRepository,
  });

  @override
  Future<Result<GameRoom?>> call(void param) {
    return gameRoomRepository.getLatestRoom();
  }
}
