import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/domain/usecases/base_usecase.dart';
import 'package:trouble_painter/features/config/data/repositories/config_repository.dart';
import 'package:trouble_painter/features/config/domain/entities/config.dart';

class ClearLocalStorageUsecase
    implements BaseUsecase<void, Future<Result<Config>>> {
  static final $ = Provider.autoDispose<ClearLocalStorageUsecase>((ref) {
    return ClearLocalStorageUsecase(
      configRepository: ref.read(ConfigRepository.$),
    );
  });

  final ConfigRepository configRepository;
  const ClearLocalStorageUsecase({
    required this.configRepository,
  });

  @override
  Future<Result<Config>> call(void param) async {
    final result = await configRepository.clearLocalStorage();
    return result.isSuccess ? Success(Config.init()) : const Failure();
  }
}
