import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:x_pr/features/ai/domain/entities/image_param.dart';

class GeminiReq {
  final String prompt;
  final ImageParam? image;
  final Schema responseSchema;

  const GeminiReq({
    required this.prompt,
    required this.image,
    required this.responseSchema,
  });
}
