import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/dialogs/confirm_dialog.dart';

class GameExitConfirmDialog extends StatelessWidget {
  const GameExitConfirmDialog(this.context, {super.key});

  final BuildContext context;

  @override
  Widget build(BuildContext dialogContext) {
    return ConfirmDialog(
      title: S.current.gamePagePopTitle,
      content: TextBalancer(
        S.current.gamePagePopDesc,
        minLines: 2,
      ),
      confirmText: S.current.leave,
      onConfirm: () {
        if (dialogContext.mounted) dialogContext.pop();
        context.pop();
      },
    );
  }
}
