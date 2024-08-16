import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/game/v1/data/repository/game_room_repository.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_player.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';

class GamePlayUsecaseParam {
  final GameRoom room;
  final GamePlayer player;

  GamePlayUsecaseParam({required this.room, required this.player});
}

class GamePlayUsecase
    implements BaseUsecase<GamePlayUsecaseParam, Future<Result<void>>> {
  static final $ = AutoDisposeProvider<GamePlayUsecase>((ref) {
    return GamePlayUsecase(
      gameRoomRepository: ref.read(GameRoomRepository.$),
    );
  });

  final GameRoomRepository gameRoomRepository;
  GamePlayUsecase({
    required this.gameRoomRepository,
  });

  @override
  Future<Result<void>> call(GamePlayUsecaseParam param) {
    final (room, player) = (param.room, param.player);
    assert(room.host == player.id);
    return gameRoomRepository.play(room);
  }
}
