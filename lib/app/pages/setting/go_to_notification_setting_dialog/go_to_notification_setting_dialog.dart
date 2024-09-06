import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/dialogs/confirm_dialog.dart';

class GoToNotificationSettingDialog extends StatelessWidget {
  const GoToNotificationSettingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmDialog(
      title: S.current.goToNotificationSettingDialogTitle,
      content: Text(S.current.goToNotificationSettingDialogDesc),
      confirmText: S.current.goToNotificationSettingDialogConfirm,
      onConfirm: () {
        AppSettings.openAppSettings(type: AppSettingsType.notification);
        context.pop();
      },
    );
  }
}
