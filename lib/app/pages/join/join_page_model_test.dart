import 'package:x_pr/app/pages/join/join_page_model.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/utils/ext/future_ext.dart';
import 'package:x_pr/features/game/domain/entities/game_step.dart';

class JoinPageModelTest extends JoinPageModel {
  JoinPageModelTest(super.buildState);

  @override
  Future<bool> joinRoom() async {
    if (state.roomId.length != state.invitationCodeLength) {
      Toast.showText(S.current.joinCheckRoomId);
      focus();
      return false;
    }

    await gameService.debugStep(GameStep.waiting).waiting(
          callback: (isBusy) => state = state.copyWith(isBusy: isBusy),
        );
    return true;
  }
}
