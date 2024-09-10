import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:x_pr/app/pages/join_qr/join_qr_page_state.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/app/routes/routes_setting.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/core/utils/ext/future_ext.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/services/analytics_service.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/domain/entities/game_exception/game_exception.dart';
import 'package:x_pr/features/game/domain/services/game_service.dart';

class JoinQrPageModel extends BaseViewModel<JoinQrPageState> {
  JoinQrPageModel(super.buildState);

  final controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  Duration foundAnimDuration = const Duration(milliseconds: 333);
  BuildContext get context => ref.read(RoutesSetting.$).context;
  GameService get gameService => ref.read(GameService.$.notifier);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);

  String? getRoomId(String? qrValue) {
    try {
      return Uri.parse(qrValue!).queryParameters['room'];
    } catch (e) {
      Toast.showText(
        S.current.joinQrPageFailure,
        type: TextToastType.warning,
      );
      return null;
    }
  }

  Future<void> init() async {
    switch (await Permission.camera.request()) {
      case PermissionStatus.granted:
        analyticsService.sendEvent(JoinQrPageCameraPermissionGrantedEvent());
        state = JoinQrPageGrantedState(
          isBusy: false,
          isQrCodeFound: false,
          isUiTestMode: ref.read(ConfigService.$).isUiTestMode,
        );
        return;
      default:
        analyticsService.sendEvent(JoinQrPageCameraPermissionDeniedEvent());
        state = JoinQrPageDeniedState();
        return;
    }
  }

  void onPopPressed() {
    analyticsService.sendEvent(JoinQrPageBackClickEvent());
  }

  void goToJoinPage() {
    analyticsService.sendEvent(JoinQrPageGoToJoinPageClickEvent());
    context.pushReplacementNamed(Routes.joinPage.name);
  }

  void goToSettings() {
    analyticsService.sendEvent(JoinQrPageGoToSettingClickEvent());
    AppSettings.openAppSettings(type: AppSettingsType.settings);
  }

  bool inInFocus(Size captureSize, List<Offset> corners) {
    final s = state as JoinQrPageGrantedState;
    if (corners.length != 4) {
      state = s.copyWith(
        corners: const [],
        isQrCodeFound: false,
      );
      return false;
    }
    final (w, h) = (context.screen.width, context.screen.height);
    final (cw, ch) = (captureSize.width, captureSize.height);
    final double d = s.dimension;
    final double pb = s.focusPaddingBottom;
    final tl = Offset((w - d) / 2, (h - d) / 2 - pb);
    final br = Offset(tl.dx + d, tl.dy + d);
    final List<Offset> syncedCorners = [];
    for (final offset in corners) {
      final (x, y) = (offset.dx / cw * w, offset.dy / ch * h);
      if (x < tl.dx || y < tl.dy || x > br.dx || y > br.dy) {
        state = s.copyWith(
          corners: const [],
          isQrCodeFound: false,
        );
        return false;
      } else {
        syncedCorners.add(Offset(x, y));
      }
    }
    state = s.copyWith(
      corners: syncedCorners,
      isQrCodeFound: true,
    );
    return true;
  }

  Future<bool> joinRoom(String roomId) async {
    if (state is! JoinQrPageGrantedState) return false;
    final s = state as JoinQrPageGrantedState;
    try {
      final result = await gameService.enter(roomId: roomId).waiting(
        callback: (isBusy) {
          state = s.copyWith(isBusy: isBusy);
        },
      );
      final isSuccess = switch (result) {
        Success() => true,
        Failure(e: final e) => throw e,
        Cancel() => false,
      };
      if (isSuccess) {
        analyticsService.sendEvent(JoinQrPageJoinRoomEvent());
      }
      return isSuccess;
    } catch (e) {
      if (e == GameException.ongoingGame) {
        final roomId = await gameService.checkIsPlayingRoom().waiting(
          callback: (isBusy) {
            state = s.copyWith(isBusy: isBusy);
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
