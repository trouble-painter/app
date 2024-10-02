import 'package:x_pr/app/pages/game/result/enums/game_result_type.dart';
import 'package:x_pr/app/pages/game/result/game_result_page_model.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/domain/entities/game_step.dart';
import 'package:x_pr/features/game/domain/services/game_service.dart';

class GameResultPageModelTest extends GameResultPageModel {
  GameResultPageModelTest(super.buildState);

  @override
  void changeResultType() {
    ref.read(GameService.$.notifier).emit(
          switch (resultType) {
            GameResultType.citizensWin => state.copyWith(
                isMafiaWin: true,
                mafiaAnswer: state.keyword,
              ),
            _ => state.copyWith(
                isMafiaWin: false,
                mafiaAnswer: ref.read(ConfigService.$).language.isKorean
                    ? "코카콜라"
                    : "cat",
              ),
          },
        );
  }

  @override
  void restart() {
    ref.read(GameService.$.notifier).debugStep(GameStep.waiting);
  }
}
