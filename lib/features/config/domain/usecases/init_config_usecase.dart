import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/config/data/repositories/config_repository.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';

class InitConfigParam {
  final bool defaultisLightTheme;
  final Language defaultLanguage;

  const InitConfigParam({
    required this.defaultisLightTheme,
    required this.defaultLanguage,
  });
}

class InitConfigReturn {
  final Config config;
  final Stream<Config> stream;

  InitConfigReturn(this.config, this.stream);
}

class InitConfigUsecase
    implements BaseUsecase<InitConfigParam, Future<InitConfigReturn>> {
  static final $ = AutoDisposeProvider<InitConfigUsecase>((ref) {
    return InitConfigUsecase(
      configRepository: ref.read(ConfigRepository.$),
    );
  });

  final ConfigRepository configRepository;
  const InitConfigUsecase({
    required this.configRepository,
  });

  @override
  Future<InitConfigReturn> call(InitConfigParam param) async {
    final config = await configRepository.init(
      defaultisLightTheme: param.defaultisLightTheme,
      defaultLanguage: param.defaultLanguage,
    );
    if (config.isFirstRun) {
      Logger.d('👋 First Run');
    }
    return InitConfigReturn(config, configRepository.onUpdated());
  }
}
