import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/features/ai/data/repositories/ai_repository_impl.dart';
import 'package:trouble_painter/features/ai/data/sources/gemini_source.dart';
import 'package:trouble_painter/features/ai/domain/entities/image_param.dart';

abstract class AiRepository {
  static final $ = Provider.autoDispose<AiRepository>((ref) {
    return AiRepositoryImpl(
      geminiSource: ref.read(GeminiSource.$),
    );
  });
  Future<Result<String>> getHint({
    required String prompt,
    required ImageParam image,
  });
}
