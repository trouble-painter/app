import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/dialogs/confirm_dialog.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class ResetConfigConfirmDialog extends StatelessWidget {
  const ResetConfigConfirmDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => ConfirmDialog(
        title: S.current.resetConfigConfirmDialogTitle,
        onConfirm: () async {
          final configService = ref.read(ConfigService.$.notifier);
          switch (await configService.clearLocalStorage()) {
            case Success():
              context.pop();
              Toast.showText(S.current.resetConfigSuccess);
              break;
            case Failure():
              break;
            case Cancel():
              break;
          }
        },
      ),
    );
  }
}
