import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/entities/game_user.dart';

abstract class GameWaitingViewModel extends BaseViewModel<GameWaitingState> {
  GameWaitingViewModel(super.buildState);

  void onStateChanged(GameWaitingState oldState) {
    if (!oldState.isHost && state.isHost) {
      /// Be host
      Toast.showText(S.current.gameWaitingYouAreHost);
    }
  }

  void start();
  Future<void> invite();

  /// For test
  void kick(GameUser kickUser) {}

  /// For test
  void toggleHost() {}
}
