import 'package:x_pr/app/pages/game/result/enums/game_result_type.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';

abstract class GameResultPageModel extends BaseViewModel<GameResultState> {
  GameResultPageModel(super.buildState);

  GameResultType get resultType {
    if (state.isMafiaWin && state.isMafiaCorrect) {
      return GameResultType.mafiaWindByCorrect;
    } else if (state.isMafiaWin && !state.isMafiaCorrect) {
      return GameResultType.mafiaWind;
    } else {
      return GameResultType.citizenWind;
    }
  }

  void restart();

  /// For test
  void changeResultType() {}
}
