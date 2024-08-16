import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/game/v1/data/repository/game_room_repository.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_player.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';

class GameRemovePlayerUsecaseParam {
  final GameRoom room;
  final GamePlayer player;

  GameRemovePlayerUsecaseParam({required this.room, required this.player});
}

class GameRemovePlayerUsecase
    implements BaseUsecase<GameRemovePlayerUsecaseParam, Future<Result<void>>> {
  static final $ = AutoDisposeProvider<GameRemovePlayerUsecase>((ref) {
    return GameRemovePlayerUsecase(
      gameRoomRepository: ref.read(GameRoomRepository.$),
    );
  });

  final GameRoomRepository gameRoomRepository;
  GameRemovePlayerUsecase({
    required this.gameRoomRepository,
  });

  @override
  Future<Result<void>> call(GameRemovePlayerUsecaseParam param) {
    final (room, player) = (param.room, param.player);
    return gameRoomRepository.removePlay(room, player);
  }
}
