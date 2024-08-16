import 'package:flutter/material.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/dialogs/confirm_dialog.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/utils/env/env.dart';
import 'package:x_pr/core/utils/ext/uri_ext.dart';
import 'package:x_pr/features/config/domain/entities/update_dialog_data.dart';

class UpdateDialog extends StatelessWidget {
  const UpdateDialog({
    super.key,
    required this.updateDialogData,
  });

  final UpdateDialogData updateDialogData;

  @override
  Widget build(BuildContext context) {
    return ConfirmDialog(
      title: updateDialogData.title,
      isCancel: false,
      action: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// Url
          if (updateDialogData.url.toString().isNotEmpty)
            Button(
              text: updateDialogData.button,
              size: ButtonSize.large,
              margin: const EdgeInsets.only(bottom: 8),
              onPressed: () {
                updateDialogData.url.launchBrowser();
              },
            ),

          /// Go to update
          Button(
            text: S.current.updateDialogGoToUpdate,
            size: ButtonSize.large,
            onPressed: () {
              if (Env.FLAVOR.isDev) {
                Toast.showText("Not available in dev flavor");
              } else {
                StoreRedirect.redirect();
              }
            },
          ),
        ],
      ),
    );
  }
}
