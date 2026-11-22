import 'package:trouble_painter/app/pages/game/result/game_result_page_model.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/toast/toast.dart';
import 'package:trouble_painter/features/game/domain/entities/game_exception/game_exception.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

class GameResultPageModelImpl extends GameResultPageModel {
  GameResultPageModelImpl(super.buildState);

  GameService get gameService => ref.read(GameService.$.notifier);
  bool _isBusy = false;

  /// The game page follows the new state, so only failures are handled here.
  @override
  Future<void> playAgain() async {
    if (_isBusy) return;
    _isBusy = true;
    Toast.showSpinner();
    try {
      if (state.isQuickStartGame) {
        _toastFailure(await gameService.quickStart());
        return;
      }
      final rejoined = await gameService.enter(roomId: state.roomId);
      final reason = switch (rejoined) {
        Failure(:final e) => _newRoomReason(e),
        _ => null,
      };
      if (reason == null) {
        _toastFailure(rejoined);
        return;
      }
      final created = await gameService.enter();
      if (created is Success) {
        Toast.showText(reason);
      } else {
        _toastFailure(created);
      }
    } finally {
      Toast.dismiss(ToastType.spinner);
      _isBusy = false;
    }
  }

  /// Why the finished game's room cannot be joined again; null when a new room would not help.
  static String? _newRoomReason(Object e) => switch (e) {
        GameException.roomInGame => S.current.gameResultNewRoomInGame,
        GameException.roomFull => S.current.gameResultNewRoomFull,
        GameException.roomNotFound => S.current.gameResultNewRoomNotFound,
        _ => null,
      };

  static void _toastFailure(Result<void> result) {
    if (result is! Failure<void>) return;
    final e = result.e;
    Toast.showText(
      e is GameException ? e.toast : S.current.tryAgain,
      type: TextToastType.warning,
    );
  }
}
