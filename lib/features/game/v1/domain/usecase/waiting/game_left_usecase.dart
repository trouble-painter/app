import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/game/v1/data/repository/game_room_repository.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_player.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';

class GameLeftUsecaseParam {
  final GameRoom room;
  final GamePlayer player;

  GameLeftUsecaseParam(this.room, this.player);
}

class GameLeftUsecase
    implements BaseUsecase<GameLeftUsecaseParam, Future<Result<void>>> {
  static final $ = AutoDisposeProvider<GameLeftUsecase>((ref) {
    return GameLeftUsecase(gameRoomRepository: ref.read(GameRoomRepository.$));
  });

  final GameRoomRepository gameRoomRepository;
  GameLeftUsecase({required this.gameRoomRepository});

  @override
  Future<Result<void>> call(GameLeftUsecaseParam param) {
    return gameRoomRepository.left(
      room: param.room,
      player: param.player,
    );
  }
}
