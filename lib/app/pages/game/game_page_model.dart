import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/service/game_service.dart';

class GamePageModel extends BaseViewModel<GameState> {
  GamePageModel(super.buildState);

  bool get isUiTestMode => ref.read(ConfigService.$).isUiTestMode;
  GameService get gameService => ref.read(GameService.$.notifier);

  void init() {
    WakelockPlus.enable();
  }

  @override
  void dispose() {
    WakelockPlus.disable();
    if (!isUiTestMode) {
      gameService.exit();
    }
    super.dispose();
  }
}
