import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/config/data/repositories/config_repository.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';

class ChangeLanguageUsecaseParam {
  final Language language;

  ChangeLanguageUsecaseParam(this.language);
}

class ChangeLanguageUsecase
    implements BaseUsecase<ChangeLanguageUsecaseParam, Future<Config>> {
  static final $ = AutoDisposeProvider<ChangeLanguageUsecase>((ref) {
    return ChangeLanguageUsecase(
      configRepository: ref.read(ConfigRepository.$),
    );
  });

  ChangeLanguageUsecase({
    required this.configRepository,
  });

  final ConfigRepository configRepository;

  @override
  Future<Config> call(ChangeLanguageUsecaseParam param) async {
    return configRepository.changeLanguage(param.language);
  }
}
