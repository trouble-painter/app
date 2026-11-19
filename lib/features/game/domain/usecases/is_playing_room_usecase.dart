import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/domain/usecases/base_usecase.dart';
import 'package:trouble_painter/features/auth/domain/entities/jwt.dart';
import 'package:trouble_painter/features/game/data/repositories/game_repository.dart';

class GetPlayingRoomIdUsecase
    implements BaseUsecase<Jwt, Future<Result<String?>>> {
  static final $ = Provider.autoDispose<GetPlayingRoomIdUsecase>((ref) {
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
