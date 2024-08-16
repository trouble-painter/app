import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/config/data/repositories/config_repository.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';

class SaveConfigUsecase implements BaseUsecase<Config, Future<Result<Config>>> {
  static final $ = AutoDisposeProvider<SaveConfigUsecase>((ref) {
    return SaveConfigUsecase(
      configRepository: ref.read(ConfigRepository.$),
    );
  });

  final ConfigRepository configRepository;
  SaveConfigUsecase({
    required this.configRepository,
  });

  @override
  Future<Result<Config>> call(Config config) async {
    return configRepository.save(config);
  }
}
