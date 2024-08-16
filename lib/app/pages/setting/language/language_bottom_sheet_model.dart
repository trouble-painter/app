import 'package:flutter/material.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class LanguageBottomSheetModel extends BaseViewModel<Language> {
  LanguageBottomSheetModel(super.buildState);

  Future<bool> onLanguageChanged(Language language) async {
    final configService = ref.read(ConfigService.$.notifier);
    final result = await configService.changeLanguage(language);
    if (result.isSuccess) {
      state = language;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Toast.showText(S.current.languageBottomSheetChanged);
      });
    }
    return result.isSuccess;
  }
}
