import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/game/v1/data/repository/game_room_repository.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';

class GameSubscribeUsecase
    implements BaseUsecase<String, Future<Result<Stream<GameRoom>>>> {
  static final $ = AutoDisposeProvider<GameSubscribeUsecase>((ref) {
    return GameSubscribeUsecase(
        gameRoomRepository: ref.read(GameRoomRepository.$),);
  });

  final GameRoomRepository gameRoomRepository;
  GameSubscribeUsecase({required this.gameRoomRepository});

  @override
  Future<Result<Stream<GameRoom>>> call(String roomId) {
    return gameRoomRepository.subscribe(roomId);
  }
}
