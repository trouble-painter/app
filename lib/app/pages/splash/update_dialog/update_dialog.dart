import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/splash/update_dialog/update_dialog_model.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/dialogs/confirm_dialog.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/entities/update_dialog_data.dart';

class UpdateDialog extends StatelessWidget {
  const UpdateDialog({
    super.key,
    required this.updateDialogData,
  });

  final UpdateDialogData updateDialogData;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: UpdateDialogModel.new,
      state: (ref, prevState) => updateDialogData,
      initState: (ref, viewModel) => viewModel.init(),
      builder: (ref, viewModel, state) => ConfirmDialog(
        title: state.title,
        isCancel: false,
        action: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Show url
            if (state.url.toString().isNotEmpty)
              Button(
                text: state.button,
                size: ButtonSize.large,
                margin: const EdgeInsets.only(bottom: 8),
                onPressed: viewModel.showUrl,
              ),

            /// Go to update
            Button(
              text: S.current.updateDialogGoToUpdate,
              size: ButtonSize.large,
              onPressed: viewModel.goToUpdate,
            ),
          ],
        ),
      ),
    );
  }
}
