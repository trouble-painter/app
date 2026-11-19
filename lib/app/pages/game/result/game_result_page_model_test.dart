import 'package:trouble_painter/app/pages/game/result/enums/game_result_type.dart';
import 'package:trouble_painter/app/pages/game/result/game_result_page_model.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/game/domain/entities/game_role.dart';
import 'package:trouble_painter/features/game/domain/entities/game_step.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

class GameResultPageModelTest extends GameResultPageModel {
  GameResultPageModelTest(super.buildState);

  @override
  void changeResultType() {
    ref.read(GameService.$.notifier).emit(
          switch (resultType) {
            GameResultType.citizensWin => state.copyWith(
                winner: GameRole.mafia,
                mafiaGuess: state.keyword,
              ),
            _ => state.copyWith(
                winner: GameRole.citizen,
                mafiaGuess: ref.read(ConfigService.$).language.isKorean
                    ? "코카콜라"
                    : "cat",
              ),
          },
        );
  }

  @override
  void playAgain() {
    ref.read(GameService.$.notifier).debugStep(
          state.isQuickStartGame
              ? GameStep.quickStartWaiting
              : GameStep.waiting,
        );
  }
}
