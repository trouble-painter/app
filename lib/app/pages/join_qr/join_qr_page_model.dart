import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:x_pr/app/pages/join_qr/join_qr_page_state.dart';
import 'package:x_pr/app/routes/routes_setting.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/utils/ext/future_ext.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/game/domain/entities/game_exception/game_exception.dart';
import 'package:x_pr/features/game/domain/service/game_service.dart';

class JoinQrPageModel extends BaseViewModel<JoinQrPageState> {
  JoinQrPageModel(super.buildState);

  final controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
  );
  BuildContext get context => ref.read(RoutesSetting.$).context;
  GameService get gameService => ref.read(GameService.$.notifier);

  String? getRoomId(String? qrValue) {
    try {
      return Uri.parse(qrValue!).queryParameters['room'];
    } catch (e) {
      return null;
    }
  }

  Future<bool> joinRoom(String roomId) async {
    try {
      final result = await gameService.enter(roomId: roomId).waiting(
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
        if (roomId != null && context.mounted) {
          context.pop();
        }
      }
      Toast.showText(
        (e is GameException) ? e.toast : S.current.tryAgain,
        type: TextToastType.warning,
      );
      return false;
    }
  }
}
