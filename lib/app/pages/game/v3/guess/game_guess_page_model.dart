import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v3/guess/ai_hint/ai_hint.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/utils/ext/future_ext.dart';
import 'package:x_pr/core/utils/ext/key_ext.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/ai/domain/entities/image_param.dart';
import 'package:x_pr/features/ai/domain/services/ai_service.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/v3/domain/service/game_service.dart';

abstract class GameGuessPageModel extends BaseViewModel<GameGuessState> {
  GameGuessPageModel(super.buildState);

  final GlobalKey repaintBoundaryKey = GlobalKey();
  late GameService gameService = ref.read(GameService.$.notifier);
  late AiService aiService = ref.read(AiService.$.notifier);
  final ValueNotifier<AiHint> aiHintNotifier = ValueNotifier(AiHint());
  AiHint get aiHint => aiHintNotifier.value;
  Config get config => ref.read(ConfigService.$);

  void onAnswerChanged(String keyword);
  void submitAnswer(String keyword);

  Future<void> onAiHintPressed() async {
    if (aiHint.isHint) {
      /// Return cache
      aiHintNotifier.value = aiHint.copyWith(
        isShow: !aiHint.isShow,
      );
    } else {
      /// Request
      try {
        final image = await repaintBoundaryKey.getImage(imageWidth: 100);
        final imageParam = ImageParam(type: ImageType.png, data: image);
        final (keyword, category) = (state.keyword, state.category);
        final result = await (config.isUiTestMode
                ? Future.delayed(const Duration(seconds: 1), () {
                    return const Success("This is test");
                  })
                : aiService.getHint(
                    image: imageParam,
                    keyword: keyword,
                    category: category,
                  ))
            .waiting(
          callback: (isBusy) {
            aiHintNotifier.value = aiHint.copyWith(
              isBusy: isBusy,
              isShow: true,
            );
          },
        );
        switch (result) {
          case Success(value: final hint):
            aiHintNotifier.value = aiHint.copyWith(
              hint: hint.replaceAll(
                RegExp(keyword, caseSensitive: false),
                "*" * keyword.length,
              ),
            );
            return;
          case Failure(e: final e):
            throw e;
          case Cancel():
            return;
        }
      } catch (e, s) {
        Logger.e("Failed to getHint", e, s);
        Toast.showText(S.current.tryAgain);
      }
    }
  }

  /// For test
  void toggleIsMafia() {}
}
