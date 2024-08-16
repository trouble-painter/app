import 'package:x_pr/app/pages/home/home_page_model.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/utils/ext/future_ext.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_exception/game_exception.dart';

class HomePageModelImpl extends HomePageModel {
  HomePageModelImpl(super.initState);

  @override
  Future<bool> enter([String? roomId]) async {
    try {
      return switch (await gameService.enter(roomId: roomId).waiting(
        callback: (isBusy) {
          state = state.copyWith(isBusy: isBusy);
        },
      )) {
        Success() => true,
        Failure(e: final e) => throw e,
        Cancel() => false,
      };
    } catch (e) {
      if (e == GameException.ongoingGame) {
        gameService.checkIsPlayingRoom().waiting(
          callback: (isBusy) {
            state = state.copyWith(isBusy: isBusy);
          },
        );
      }
      Toast.showText(
        (e is GameException) ? e.toast : S.current.tryAgain,
        type: TextToastType.warning,
      );
      return false;
    }
  }
}
