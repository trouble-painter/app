import 'package:x_pr/app/pages/join/join_page_model.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/utils/ext/future_ext.dart';
import 'package:x_pr/features/game/domain/entities/game_exception/game_exception.dart';
import 'package:x_pr/features/game/domain/entities/game_step.dart';

class JoinPageModelImpl extends JoinPageModel {
  JoinPageModelImpl(super.buildState);

  @override
  Future<bool> joinRoom() async {
    if (state.roomId.length != state.invitationCodeLength) {
      Toast.showText(S.current.joinCheckRoomId);
      focus();
      return false;
    }

    if (config.isUiTestMode) {
      await gameService.debugStep(GameStep.waiting);
      return true;
    } else {
      try {
        final result = await gameService.enter(roomId: state.roomId).waiting(
              callback: (isBusy) => state = state.copyWith(isBusy: isBusy),
            );
        return switch (result) {
          Success() => true,
          Failure(e: final e) => throw e,
          Cancel() => false,
        };
      } catch (e) {
        if (e == GameException.ongoingGame) {
          final roomId = await gameService.checkIsPlayingRoom().waiting(
            callback: (isBusy) {
              state = state.copyWith(isBusy: isBusy);
            },
          );
          if (roomId != null) {
            state.controller.clear();
            state.controller.text = roomId;
          }
        }
        Toast.showText(
          (e is GameException) ? e.toast : S.current.tryAgain,
        );
        return false;
      }
    }
  }
}
