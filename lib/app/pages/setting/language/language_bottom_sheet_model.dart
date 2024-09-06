import 'package:flutter/material.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/services/analytics_service.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class LanguageBottomSheetModel extends BaseViewModel<Language> {
  LanguageBottomSheetModel(super.buildState);
  Config get config => ref.read(ConfigService.$);
  ConfigService get configService => ref.read(ConfigService.$.notifier);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);

  Future<bool> onLanguageChanged(Language language) async {
    if (config.language == language) return false;

    final result = await configService.changeLanguage(language);
    if (result.isSuccess) {
      state = language;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Toast.showText(
          S.current.languageBottomSheetChanged,
          type: TextToastType.success,
        );
      });
    }

    /// Send event
    analyticsService.sendEvent(LanguageBottomSheetUpdateEvent(language));
    return result.isSuccess;
  }
}
