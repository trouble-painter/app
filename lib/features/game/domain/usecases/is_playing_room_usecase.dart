import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/auth/domain/entities/jwt.dart';
import 'package:x_pr/features/game/data/repositories/game_repository.dart';

class GetPlayingRoomIdUsecase
    implements BaseUsecase<Jwt, Future<Result<String?>>> {
  static final $ = AutoDisposeProvider<GetPlayingRoomIdUsecase>((ref) {
    return GetPlayingRoomIdUsecase(
      gameRepository: ref.read(GameRepository.$),
    );
  });

  GetPlayingRoomIdUsecase({
    required GameRepository gameRepository,
  }) : _gameRepository = gameRepository;
  final GameRepository _gameRepository;

  @override
  Future<Result<String?>> call(Jwt jwt) {
    return _gameRepository.getPlayingRoomId(jwt: jwt);
  }
}
