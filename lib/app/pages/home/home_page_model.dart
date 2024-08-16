import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/home/home_page_state.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/audio/domain/services/audio_service.dart';
import 'package:x_pr/features/auth/domain/services/auth_service.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/entities/notice_dialog_history.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/v3/domain/service/game_service.dart';

abstract class HomePageModel extends BaseViewModel<HomePageState> {
  HomePageModel(super.buildState);

  Config get config => ref.read(ConfigService.$);
  ConfigService get configService => ref.read(ConfigService.$.notifier);
  AuthServiceState get authServiceState => ref.read(AuthService.$);
  late GameService gameService = ref.read(GameService.$.notifier);
  late AudioService audioService = ref.read(AudioService.$);
  StreamSubscription? appLinksSubs;

  void setBusy(bool isBusy) {
    state = state.copyWith(isBusy: isBusy);
  }

  Future<bool> enter([String? roomId]);

  void init() {
    /// Play bgm
    playBgm();

    /// Show notice
    if (isShowNotice()) {
      showNotice();
    }

    appLinksSubs = AppLinks().uriLinkStream.listen((uri) async {
      if (ref.read(GameService.$) is! GameDisconnectedState) return;

      Logger.d('🔗 AppLink : $uri');
      final roomId = uri.queryParameters["room"];
      if (roomId != null && roomId.isNotEmpty) {
        if (await enter(roomId) && Routes.context.mounted) {
          Routes.context.pushNamed(Routes.game.name);
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

  void playBgm() {
    audioService
      ..init()
      ..play();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
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
        return;
    }
  }

  @override
  void dispose() {
    appLinksSubs?.cancel();
    audioService.dispose();
    super.dispose();
  }
}
