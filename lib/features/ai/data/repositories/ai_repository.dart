import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/ai/data/repositories/ai_repository_impl.dart';
import 'package:x_pr/features/ai/data/sources/gemini_source.dart';
import 'package:x_pr/features/ai/domain/entities/image_param.dart';

abstract class AiRepository {
  static final $ = AutoDisposeProvider<AiRepository>((ref) {
    return AiRepositoryImpl(
      geminiSource: ref.read(GeminiSource.$),
    );
  });
  Future<Result<String>> getHint({
    required String prompt,
    required ImageParam image,
  });
}
