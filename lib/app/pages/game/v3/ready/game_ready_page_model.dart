import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_state/game_state.dart';

abstract class GameReadyPageModel extends BaseViewModel<GameReadyState> {
  GameReadyPageModel(super.buildState);

  /// For test
  void toggleRole() {}

  /// For test
  void goToDrawingStep() {}
}
