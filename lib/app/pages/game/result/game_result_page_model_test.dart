import 'package:trouble_painter/app/pages/game/result/game_result_page_model.dart';
import 'package:trouble_painter/features/audio/domain/services/audio_service.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/game/domain/entities/game_role.dart';
import 'package:trouble_painter/features/game/domain/entities/game_step.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

class GameResultPageModelTest extends GameResultPageModel {
  GameResultPageModelTest(super.buildState);

  /// Cycles mafia win, mafia lose, citizen win and citizen lose, from my side.
  @override
  void changeResultType() {
    final current = (state.isMeMafia ? 0 : 2) + (state.isMeWin ? 0 : 1);
    final next = (current + 1) % 4;
    final isMeMafia = next < 2;
    final isMeWin = next.isEven;
    final isMafiaWin = isMeMafia == isMeWin;
    final citizen = state.userList.firstWhere((u) => u.id != state.mafiaId);
    ref.read(GameService.$.notifier).emit(
          state.copyWith(
            myId: isMeMafia ? state.mafiaId : citizen.id,
            winner: isMafiaWin ? GameRole.mafia : GameRole.citizen,
            mafiaGuess: isMafiaWin
                ? state.keyword
                : ref.read(ConfigService.$).language.isKorean
                    ? "가나다라마바사아자차카타파하가나다라마바" // 20 chars, the max answer length
                    : "abcdefghijklmnopqrst",
          ),
        );

    /// The state type stays the same, so the game page does not play it.
    ref.read(AudioService.$).playResult(isWin: isMeWin);
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
