import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/login/dialogs/logout_dialog_model.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/dialogs/confirm_dialog.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/core/view/base_view_state.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: LogoutDialogModel.new,
      state: (ref, prevState) => BaseViewState.init,
      onStateChanged: (ref, viewModel, state, oldState) {
        switch (state) {
          case BaseViewState.success:
            context.pop();
            Toast.showText(S.current.logoutSuccess);
            break;
          case BaseViewState.failure:
            Toast.showText(S.current.logoutFailure);
            break;
          default:
            break;
        }
      },
      builder: (ref, viewModel, state) => ConfirmDialog(
        title: S.current.logoutDialogTitle,
        confirmButton: Button(
          text: S.current.logout,
          type: ButtonType.flat,
          size: ButtonSize.large,
          onPressed: viewModel.logout,
        ),
      ),
    );
  }
}
