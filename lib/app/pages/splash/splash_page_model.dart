import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/splash/splash_page_state.dart';
import 'package:x_pr/core/utils/ext/future_ext.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/auth/domain/services/auth_service.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/domain/services/game_service.dart';

class SplashPageModel extends BaseViewModel<SplashPageState> {
  SplashPageModel(super.initState);

  Config get config => ref.read(ConfigService.$);

  Future<void> init({
    required Language platformLanguage,
    required Brightness platformBritness,
  }) async {
    /// Initialize
    await ref.read(AuthService.$.notifier).init();
    await ref
        .read(GameService.$.notifier)
        .checkIsPlayingRoom()
        .waiting(milliseconds: 1600);

    if (_isUpdateRequired()) {
      /// Check minBuildNumber
      state = SplashUpdateState(
        updateDialogData: config.updateDialogData,
      );
      return;
    } else if (_isMaintenance()) {
      /// Check maintenance
      state = SplashMaintenanceState(
        maintenanceDialogData: config.maintenanceDialogData!,
      );
      return;
    } else {
      /// Go to next
      state = SplashLoadedState();
      return;
    }
  }

  bool get goToNickname {
    return config.isFirstRun || config.nickname.trim().isEmpty;
  }

  bool _isUpdateRequired() {
    return config.appInfo.buildNumber <= config.minBuildNumber;
  }

  bool _isMaintenance() {
    return config.maintenanceDialogData?.isMaintenance ?? false;
  }
}
