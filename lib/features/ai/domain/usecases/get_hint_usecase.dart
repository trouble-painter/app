import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/ai/data/repositories/ai_repository.dart';
import 'package:x_pr/features/ai/domain/entities/image_param.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class GetHintParam {
  final String keyword;
  final ImageParam image;

  GetHintParam({required this.keyword, required this.image});
}

class GetHintUsecase
    implements BaseUsecase<GetHintParam, Future<Result<String>>> {
  static final $ = AutoDisposeProvider<GetHintUsecase>((ref) {
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
    final prompt = config.geminiHintPrompt.replaceAll(
      RegExp(r'{k}', caseSensitive: false),
      param.keyword,
    );
    Logger.d("🤖 Hint Prompt : $prompt");
    return aiRepository.getHint(
      prompt: prompt,
      image: param.image,
    );
  }
}
