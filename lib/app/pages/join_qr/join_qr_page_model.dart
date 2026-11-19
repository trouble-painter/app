import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:trouble_painter/app/pages/join_qr/join_qr_page_state.dart';
import 'package:trouble_painter/app/routes/routes.dart';
import 'package:trouble_painter/app/routes/routes_setting.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/toast/toast.dart';
import 'package:trouble_painter/core/utils/ext/future_ext.dart';
import 'package:trouble_painter/core/view/base_view_model.dart';
import 'package:trouble_painter/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:trouble_painter/features/analytics/domain/services/analytics_service.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/game/domain/entities/game_exception/game_exception.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

class JoinQrPageModel extends BaseViewModel<JoinQrPageState> {
  JoinQrPageModel(super.buildState);

  final MobileScannerController qrController = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
  );

  /// Ignores detections while a found code is being handled.
  bool _isHandlingQrCode = false;

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

  Future<void> onDetect(BarcodeCapture capture) async {
    if (_isHandlingQrCode) return;
    final s = state as JoinQrPageGrantedState;
    final String? code = capture.barcodes.firstOrNull?.rawValue;
    if (code == null) return;

    /// Get room id
    final roomId = getRoomId(code);
    if (roomId == null) return;
    _isHandlingQrCode = true;
    await qrController.stop();
    state = s.copyWith(
      isQrCodeFound: true,
    );

    /// Join
    final isJoinSuccess = await joinRoom(roomId).waiting(
      milliseconds: foundAnimDuration.inMilliseconds * 3,
      callback: (isBusy) => state = s.copyWith(isBusy: isBusy),
    );

    if (isJoinSuccess && context.mounted) {
      context.pushReplacementNamed(Routes.gamePage.name);
    } else {
      await qrController.start();
      state = s.copyWith(
        isQrCodeFound: false,
      );
      _isHandlingQrCode = false;
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

  @override
  void dispose() {
    unawaited(qrController.dispose());
    super.dispose();
  }
}
