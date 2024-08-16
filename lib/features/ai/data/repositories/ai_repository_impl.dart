import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/ai/data/models/gemini_req.dart';
import 'package:x_pr/features/ai/data/repositories/ai_repository.dart';
import 'package:x_pr/features/ai/data/sources/gemini_source.dart';
import 'package:x_pr/features/ai/domain/entities/image_param.dart';

class AiRepositoryImpl implements AiRepository {
  AiRepositoryImpl({
    required this.geminiSource,
  });
  final GeminiSource geminiSource;

  @override
  Future<Result<String>> getHint({
    required String prompt,
    required ImageParam image,
  }) async {
    const hint = "hint";
    final req = GeminiReq(
      prompt: prompt,
      image: image,
      responseSchema: Schema.object(
        properties: {
          hint: Schema.string(nullable: false),
        },
      ),
    );
    final result = await geminiSource.request(req);
    return switch (result) {
      Success(value: final res) => Success(res[hint]),
      Failure(e: final e) => Failure(e),
      Cancel() => const Cancel(),
    };
  }
}
