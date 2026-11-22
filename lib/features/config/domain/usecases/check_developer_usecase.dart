import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/domain/usecases/base_usecase.dart';
import 'package:trouble_painter/features/config/data/repositories/config_repository.dart';

class CheckDeveloperParam {
  const CheckDeveloperParam({required this.baseUrl, required this.uuid});
  final Uri baseUrl;
  final String uuid;
}

class CheckDeveloperUsecase
    implements BaseUsecase<CheckDeveloperParam, Future<Result<bool>>> {
  static final $ = Provider.autoDispose<CheckDeveloperUsecase>((ref) {
    return CheckDeveloperUsecase(
      configRepository: ref.read(ConfigRepository.$),
    );
  });

  CheckDeveloperUsecase({required ConfigRepository configRepository})
      : _configRepository = configRepository;
  final ConfigRepository _configRepository;

  @override
  Future<Result<bool>> call(CheckDeveloperParam param) {
    return _configRepository.checkDeveloper(
      baseUrl: param.baseUrl,
      uuid: param.uuid,
    );
  }
}
