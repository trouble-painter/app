import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/home/home_page_state.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/app/routes/routes_setting.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/utils/ext/future_ext.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/services/analytics_service.dart';
import 'package:x_pr/features/audio/domain/services/audio_service.dart';
import 'package:x_pr/features/auth/domain/services/auth_service.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/entities/notice_dialog_history.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/domain/entities/game_exception/game_exception.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/entities/game_step.dart';
import 'package:x_pr/features/game/domain/services/game_service.dart';
import 'package:x_pr/features/notification/domain/entities/notification_quick_start_data.dart';
import 'package:x_pr/features/notification/domain/services/notification_service.dart';

class HomePageModel extends BaseViewModel<HomePageState> {
  HomePageModel(super.buildState);

  Config get config => ref.read(ConfigService.$);
  BuildContext get context => ref.read(RoutesSetting.$).context;
  AuthServiceState get authServiceState => ref.read(AuthService.$);
  ConfigService get configService => ref.read(ConfigService.$.notifier);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);
  GameService get gameService => ref.read(GameService.$.notifier);
  AudioService get audioService => ref.read(AudioService.$);
  NotificationService get notificationService => ref.read(
        NotificationService.$.notifier,
      );
  StreamSubscription? appLinksSubs;
  StreamSubscription? notificationSubs;
  StreamSubscription? notificationBgSubs;
  Timer? gameExitTimer;

  Future<bool> enter([String? roomId]) async {
    if (config.isUiTestMode) {
      await gameService.debugStep(GameStep.waiting);
      return true;
    }

    try {
      final result = await gameService.enter(roomId: roomId).waiting(
        callback: (isBusy) {
          state = state.copyWith(isBusy: isBusy);
        },
      );
      switch (result) {
        case Success():

          /// Send event
          final bool isCreateRoom = roomId == null;
          if (isCreateRoom) {
            analyticsService.sendEvent(HomePageCreateRoomClickEvent());
          }
          return true;
        case Failure(e: final e):
          throw e;
        case Cancel():
          return false;
      }
    } on GameException catch (e) {
      if (e == GameException.ongoingGame) {
        gameService.checkIsPlayingRoom().waiting(
          callback: (isBusy) {
            state = state.copyWith(isBusy: isBusy);
          },
        );
      }
      Toast.showText(e.toast, type: TextToastType.warning);
      return false;
    } catch (e, s) {
      Logger.e("Failed to enter", e, s);
      Toast.showText(S.current.tryAgain, type: TextToastType.warning);
      return false;
    }
  }

  Future<void> init() async {
    if (!config.notificationSetting.disableQuickStartNoti) {
      /// Notification
      _initNotification();
    }

    /// Play bgm
    _playBgm();

    /// Show notice
    if (_isShowNotice) {
      _showNotice();
    }

    /// Init app link
    _initAppLink();
  }

  Future<void> _initAppLink() async {
    appLinksSubs?.cancel();
    appLinksSubs = AppLinks().uriLinkStream.listen((uri) async {
      if (ref.read(GameService.$) is! GameDisconnectedState) return;

      Logger.d('🔗 AppLink : $uri');
      final roomId = uri.queryParameters["room"];
      if (roomId != null && roomId.isNotEmpty) {
        if (await enter(roomId) && context.mounted) {
          /// Send event
          analyticsService.sendEvent(HomePageJoinRoomByAppLinkEvent());
          context.pushNamed(Routes.gamePage.name);
        }
      }
    });
  }

  Future<void> _initNotification() async {
    /// Clear badge
    notificationService.clearBadge();

    /// Get terminated notification message
    final bgMessage = await notificationService.getInitMessage();
    if (bgMessage != null) {
      /// Send event
      analyticsService.sendEvent(
        HomePageQuickStartNotificationClickEvent(
          QuickStartNotificationState.terminated,
        ),
      );
      _onQuickStartNotificationMessage(
        bgMessage,
        isShowDialog: false,
      );
    }

    /// Listen foreground notification message
    notificationSubs = await notificationService.listenMessage(
      (message) {
        /// Send event
        analyticsService.sendEvent(
          HomePageQuickStartNotificationClickEvent(
            QuickStartNotificationState.foreground,
          ),
        );
        return _onQuickStartNotificationMessage(
          message,
          isShowDialog: true,
        );
      },
    );

    /// Listen background notification message
    notificationBgSubs = await notificationService.listenBgMessage(
      (message) {
        /// Send event
        analyticsService.sendEvent(
          HomePageQuickStartNotificationClickEvent(
            QuickStartNotificationState.background,
          ),
        );
        return _onQuickStartNotificationMessage(
          message,
          isShowDialog: false,
        );
      },
    );
  }

  Future<void> _onQuickStartNotificationMessage(
    RemoteMessage message, {
    required bool isShowDialog,
  }) async {
    try {
      Logger.d("💌 onMessage : ${message.toMap()}");
      if (gameService.isHome) {
        final data = NotificationQuickStartData.fromJson(message.data);
        if (data.title.isEmpty || data.content.isEmpty) return;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (isShowDialog) {
            context.pushNamed(
              Routes.quickStartPushDialog.name,
              extra: {
                "data": data,
                "onConfirm": () {
                  context.popUntil(Routes.homePage);
                  quickStartPressed();
                },
              },
            );
          } else {
            quickStartPressed();
          }
        });
      }
    } catch (e, s) {
      Logger.e("Failed to onQuickStartNotificationMessage", e, s);
    }
  }

  bool get _isShowNotice {
    final (noticeData, noticeHistory) = (
      config.noticeDialogData,
      config.noticeDialogHistory,
    );
    final result = noticeData == null
        ? false
        : noticeData.isShowNotice(
            noticeHistory,
          );
    Logger.d("📣 isShowNotice : $result");
    return result;
  }

  void _showNotice() {
    final noticeData = config.noticeDialogData;
    if (noticeData == null) return;
    state = state.copyWith(noticeDialogData: noticeData);
    final noticeHistory = NoticeDialogHistory(
      version: noticeData.version,
      exposedAt: NetworkTime.now,
    );

    /// Save notice dialog history
    configService.saveNoticeDialogHistory(noticeHistory);
  }

  Future<void> _playBgm() async {
    await audioService.init();
    audioService.play(isInGame: false);
  }

  void didChangeAppLifecycleState(AppLifecycleState appState) {
    switch (appState) {
      case AppLifecycleState.detached:
        return;
      case AppLifecycleState.resumed:
        Logger.d("📱 App Resumed");
        gameExitTimer?.cancel();
        audioService.play();
        return;
      case AppLifecycleState.inactive:
        return;
      case AppLifecycleState.hidden:
        return;
      case AppLifecycleState.paused:
        Logger.d("📱 App Paused");
        audioService.pause();
        gameExitTimer = Timer.periodic(
          Duration(
            seconds: gameService.isWaiting
                ? config.waitingBgSocketTimeOut
                : config.playingBgSocketTimeOut,
          ),
          (timer) {
            gameService.exit();
            timer.cancel();
          },
        );
        return;
    }
  }

  void settingPressed() {
    context.pushNamed(Routes.settingPage.name);

    /// Send event
    analyticsService.sendEvent(HomePageSettingClickEvent());
  }

  void joinPressed() {
    context.pushNamed(Routes.joinBottomSheet.name);

    /// Send event
    analyticsService.sendEvent(HomePageJoinRoomClickEvent());
  }

  void rejoinPressed() async {
    if (state.playingRoomId == null) return;
    final isSuccess = await enter(state.playingRoomId);
    if (isSuccess && context.mounted) {
      context.pushNamed(Routes.gamePage.name);

      /// Send event
      analyticsService.sendEvent(HomePageRejoinRoomClickEvent());
    }
  }

  Future<void> _requestQuickStartNotiPermission() async {
    if (context.mounted) context.popUntil(Routes.homePage);

    /// Check Permission
    final authorizationStatus =
        await notificationService.requestPermission().waiting(
              callback: (isBusy) => state = state.copyWith(isBusy: isBusy),
            );
    if (authorizationStatus != AuthorizationStatus.authorized) {
      /// Unauthorized
      analyticsService.sendEvent(HomePageQuickStartPermissionDeniedEvent());
      Toast.showText(
        S.current.quickStartNotiPermissionUnauthorized,
        type: TextToastType.warning,
      );
    } else {
      /// Authorized
      analyticsService.sendEvent(HomePageQuickStartPermissionGrantedEvent());
      final isSuccess =
          await notificationService.subscribeQuickStartNotification().waiting(
                callback: (isBusy) => state = state.copyWith(isBusy: isBusy),
              );
      if (!isSuccess) {
        Toast.showText(
          S.current.quickStartNotiPermissionFailure,
          type: TextToastType.warning,
        );
      }
    }
    quickStartPressed();
  }

  Future<bool> quickStartPressed() async {
    if (!config.notificationSetting.disableQuickStartNoti &&
        !config.notificationSetting.receiveQuickStartNoti &&
        config.isQuickStartFirstRun) {
      /// Update isQuickStartFirstRun
      configService.updateIsQuickStartFirstRun();

      /// Request quick startup notification permission on first attempt
      if (context.mounted) {
        context.pushNamed(
          Routes.quickStartNotiPermissionDialog.name,
          extra: {
            'onConfirm': _requestQuickStartNotiPermission,
          },
        );
      }
      return false;
    }

    if (config.isUiTestMode) {
      await gameService.debugStep(GameStep.quickStartWaiting);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) context.pushNamed(Routes.gamePage.name);
      });
      return true;
    }

    try {
      final result = await gameService.quickStart().waiting(
        callback: (isBusy) {
          state = state.copyWith(isBusy: isBusy);
        },
      );
      switch (result) {
        case Success():

          /// Send event
          analyticsService.sendEvent(HomePageQuickStartClickEvent());
          if (context.mounted) context.pushNamed(Routes.gamePage.name);
          return true;
        case Failure(e: final e):
          throw e;
        case Cancel():
          return false;
      }
    } on GameException catch (e) {
      if (e == GameException.ongoingGame) {
        gameService.checkIsPlayingRoom().waiting(
          callback: (isBusy) {
            state = state.copyWith(isBusy: isBusy);
          },
        );
      }
      Toast.showText(e.toast, type: TextToastType.warning);
      return false;
    } catch (e, s) {
      Logger.e("Failed to quickStart", e, s);
      Toast.showText(S.current.tryAgain, type: TextToastType.warning);
      return false;
    }
  }

  @override
  void dispose() {
    notificationBgSubs?.cancel();
    notificationSubs?.cancel();
    gameExitTimer?.cancel();
    appLinksSubs?.cancel();
    audioService.dispose();
    super.dispose();
  }
}
