import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/usecases/base_usecase.dart';
import 'package:trouble_painter/features/config/data/repositories/config_repository.dart';
import 'package:trouble_painter/features/config/domain/entities/config.dart';
import 'package:trouble_painter/features/config/domain/entities/language.dart';

class ChangeLanguageUsecaseParam {
  final Language language;

  ChangeLanguageUsecaseParam(this.language);
}

class ChangeLanguageUsecase
    implements BaseUsecase<ChangeLanguageUsecaseParam, Future<Config>> {
  static final $ = Provider.autoDispose<ChangeLanguageUsecase>((ref) {
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
