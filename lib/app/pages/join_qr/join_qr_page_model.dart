import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:x_pr/app/pages/join_qr/join_qr_page_state.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/app/routes/routes_setting.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/utils/ext/future_ext.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/services/analytics_service.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/domain/entities/game_exception/game_exception.dart';
import 'package:x_pr/features/game/domain/services/game_service.dart';

class JoinQrPageModel extends BaseViewModel<JoinQrPageState> {
  JoinQrPageModel(super.buildState);

  final GlobalKey qrViewKey = GlobalKey(debugLabel: 'QrView');
  late final QRViewController qrController;
  StreamSubscription? qrSubs;

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

  void onQrViewCreated(QRViewController createdQrController) {
    final s = state as JoinQrPageGrantedState;
    qrController = createdQrController;
    qrSubs = qrController.scannedDataStream.listen((scanData) async {
      final String? code = scanData.code;
      if (code != null) {
        /// Get room id
        final roomId = getRoomId(code);
        if (roomId == null) return;
        await qrController.pauseCamera();
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
          await qrController.resumeCamera();
          state = s.copyWith(
            isQrCodeFound: false,
          );
        }
      }
    });
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
    qrController.dispose();
    qrSubs?.cancel();
    super.dispose();
  }
}
