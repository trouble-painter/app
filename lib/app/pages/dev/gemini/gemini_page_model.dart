import 'package:flutter/services.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:x_pr/app/pages/dev/gemini/gemini_page_state.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/ai/data/models/gemini_req.dart';
import 'package:x_pr/features/ai/data/sources/gemini_source.dart';
import 'package:x_pr/features/ai/domain/entities/image_param.dart';

class GeminiPageModel extends BaseViewModel<GeminiPageState> {
  GeminiPageModel(super.buildState);

  late GeminiSource geminiSource = ref.read(GeminiSource.$);

  void call() async {
    final imageData = await rootBundle.load('assets/images/mafia.png');
    const score = "score";
    final req = GeminiReq(
      prompt: "다음 그림을 보고 점수를 score를 0에서 100점 사이의 값으로 반환해줘. 점수 기준은 얼마나 귀여운지야.",
      image: ImageParam(
        type: ImageType.png,
        data: imageData.buffer.asUint8List(),
      ),
      responseSchema: Schema.object(
        properties: {
          score: Schema.string(description: "Image score"),
        },
        requiredProperties: [score],
      ),
    );
    final result = await geminiSource.request(req);
    switch (result) {
      case Success(value: final res):
        state = GeminiLoadedState(
          req: req,
          res: res[score],
        );
        return;
      case Failure():
        return;
      case Cancel():
        return;
    }
  }
}
