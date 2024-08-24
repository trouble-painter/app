import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/game_exit_confirm_dialog/game_exit_confirm_dialog_model.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/dialogs/confirm_dialog.dart';
import 'package:x_pr/core/view/base_view.dart';

class GameExitConfirmDialog extends StatelessWidget {
  const GameExitConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<GameExitConfirmDialogModel, void>(
      viewModel: GameExitConfirmDialogModel.new,
      state: (ref, prevState) {},
      initState: (ref, viewModel) => viewModel.init(),
      builder: (ref, viewModel, state) => ConfirmDialog(
        title: S.current.gamePagePopTitle,
        confirmText: S.current.leave,
        onConfirm: viewModel.onConfirm,
      ),
    );
  }
}
