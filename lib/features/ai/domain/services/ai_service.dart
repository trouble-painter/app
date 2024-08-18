import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/ai/domain/entities/image_param.dart';
import 'package:x_pr/features/ai/domain/usecases/get_hint_usecase.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class AiService extends Notifier<void> {
  static final $ = NotifierProvider<AiService, void>(AiService.new);

  Config get config => ref.read(ConfigService.$);

  @override
  void build() {
    return;
  }

  Future<Result<String>> getHint({
    required ImageParam image,
    required String keyword,
    required String category,
  }) {
    final param = GetHintParam(
      image: image,
      keyword: keyword,
      category: category,
    );
    return ref.read(GetHintUsecase.$).call(param);
  }
}
