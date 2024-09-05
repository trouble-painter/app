import 'dart:async';

import 'package:app_links/app_links.dart';
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

class HomePageModel extends BaseViewModel<HomePageState> {
  HomePageModel(super.buildState);

  Config get config => ref.read(ConfigService.$);
  BuildContext get context => ref.read(RoutesSetting.$).context;
  ConfigService get configService => ref.read(ConfigService.$.notifier);
  AuthServiceState get authServiceState => ref.read(AuthService.$);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);
  late GameService gameService = ref.read(GameService.$.notifier);
  late AudioService audioService = ref.read(AudioService.$);
  StreamSubscription? appLinksSubs;

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
          } else {
            analyticsService.sendEvent(HomePageJoinRoomClickEvent());
          }
          return true;
        case Failure(e: final e):
          throw e;
        case Cancel():
          return false;
      }
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

  void init() {
    /// Play bgm
    playBgm();

    /// Show notice
    if (isShowNotice()) {
      showNotice();
    }

    appLinksSubs?.cancel();
    appLinksSubs = AppLinks().uriLinkStream.listen((uri) async {
      if (ref.read(GameService.$) is! GameDisconnectedState) return;

      Logger.d('🔗 AppLink : $uri');
      final roomId = uri.queryParameters["room"];
      if (roomId != null && roomId.isNotEmpty) {
        if (await enter(roomId) && context.mounted) {
          context.pushNamed(Routes.gamePage.name);
        }
      }
    });
  }

  bool isShowNotice() {
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

  void showNotice() {
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

  Future<void> playBgm() async {
    await audioService.init();
    audioService.play(isInGame: false);
  }

  void didChangeAppLifecycleState(AppLifecycleState appState) {
    switch (appState) {
      case AppLifecycleState.detached:
        return;
      case AppLifecycleState.resumed:
        audioService.play();
        return;
      case AppLifecycleState.inactive:
        return;
      case AppLifecycleState.hidden:
        return;
      case AppLifecycleState.paused:
        audioService.pause();
        gameService.exit();
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

  Future<bool> quickStart() async {
    if (config.isUiTestMode) {
      await gameService.debugStep(GameStep.quickStartWaiting);
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
          return true;
        case Failure(e: final e):
          throw e;
        case Cancel():
          return false;
      }
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

  @override
  void dispose() {
    appLinksSubs?.cancel();
    audioService.dispose();
    super.dispose();
  }
}
