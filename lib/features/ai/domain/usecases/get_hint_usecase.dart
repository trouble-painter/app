import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/domain/usecases/base_usecase.dart';
import 'package:trouble_painter/core/utils/log/logger.dart';
import 'package:trouble_painter/features/ai/data/repositories/ai_repository.dart';
import 'package:trouble_painter/features/ai/domain/entities/image_param.dart';
import 'package:trouble_painter/features/config/domain/entities/config.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';

class GetHintParam {
  final String category;
  final String keyword;
  final ImageParam image;

  GetHintParam({
    required this.category,
    required this.keyword,
    required this.image,
  });
}

class GetHintUsecase
    implements BaseUsecase<GetHintParam, Future<Result<String>>> {
  static final $ = Provider.autoDispose<GetHintUsecase>((ref) {
    return GetHintUsecase(
      aiRepository: ref.read(AiRepository.$),
      config: ref.read(ConfigService.$),
    );
  });

  const GetHintUsecase({
    required this.aiRepository,
    required this.config,
  });

  final AiRepository aiRepository;
  final Config config;

  @override
  Future<Result<String>> call(GetHintParam param) async {
    final prompt = config.geminiHintPrompt
        .replaceAll(
          RegExp(r'{k}', caseSensitive: false),
          param.keyword,
        )
        .replaceAll(
          RegExp(r'{c}', caseSensitive: false),
          param.category,
        );
    Logger.d("🤖 Hint Prompt : $prompt");
    return aiRepository.getHint(
      prompt: prompt,
      image: param.image,
    );
  }
}
