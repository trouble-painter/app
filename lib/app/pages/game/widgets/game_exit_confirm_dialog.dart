import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/dialogs/confirm_dialog.dart';

class GameExitConfirmDialog extends StatelessWidget {
  const GameExitConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmDialog(
      title: S.current.gamePagePopTitle,
      content: TextBalancer(
        S.current.gamePagePopDesc,
        minLines: 2,
      ),
      confirmText: S.current.leave,
      onConfirm: () {
        if (context.mounted) context.pop();
        context.popUntil(Routes.homePage);
      },
    );
  }
}
