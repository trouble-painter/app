import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/domain/usecases/base_usecase.dart';
import 'package:trouble_painter/features/game/data/repositories/game_repository.dart';

class GetRoomCodeLengthUsecase
    implements BaseUsecase<VoidParam, Future<Result<int>>> {
  static final $ = Provider.autoDispose<GetRoomCodeLengthUsecase>((ref) {
    return GetRoomCodeLengthUsecase(
      gameRepository: ref.read(GameRepository.$),
    );
  });

  GetRoomCodeLengthUsecase({
    required GameRepository gameRepository,
  }) : _gameRepository = gameRepository;
  final GameRepository _gameRepository;

  @override
  Future<Result<int>> call(VoidParam param) {
    return _gameRepository.getRoomCodeLength();
  }
}
