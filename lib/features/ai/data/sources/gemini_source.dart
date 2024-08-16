import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/ai/data/models/gemini_req.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class GeminiSource {
  static final $ = AutoDisposeProvider<GeminiSource>((ref) {
    return GeminiSource(
      getConfig: () => ref.read(ConfigService.$),
    );
  });

  GeminiSource({
    required Config Function() getConfig,
  }) : _getConfig = getConfig;

  final Config Function() _getConfig;
  late final _model = GenerativeModel(
    model: _getConfig().geminiModel,
    apiKey: _getConfig().geminiApiKey,
  );

  Future<Result<Map<String, dynamic>>> request(GeminiReq req) async {
    try {
      final content = [
        Content.multi([
          /// Prompt
          TextPart(req.prompt),

          /// Image
          if (req.image != null)
            DataPart(
              req.image!.type.mimeType,
              req.image!.data,
            ),
        ]),
      ];
      final response = await _model.generateContent(
        content,
        generationConfig: GenerationConfig(
          responseMimeType: 'application/json',
          responseSchema: req.responseSchema,
        ),
      );
      Logger.d("🤖 Gemini response : ${response.text}");
      return Success(jsonDecode(response.text!));
    } catch (e, s) {
      Logger.e("Failed to request", e, s);
      return Failure(e);
    }
  }
}
