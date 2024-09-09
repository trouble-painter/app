import 'package:flutter/material.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/dialogs/confirm_dialog.dart';

class QuickStartNotiPermissionDialog extends StatelessWidget {
  const QuickStartNotiPermissionDialog({
    super.key,
    required this.onConfirm,
  });

  final Future<void> Function() onConfirm;

  @override
  Widget build(BuildContext context) {
    return ConfirmDialog(
      title: S.current.quickStartNotiPermissionTitle,
      content: TextBalancer(
        S.current.quickStartNotiPermissionContent,
      ),
      confirmText: S.current.quickStartNotiPermissionConfirm,
      onConfirm: onConfirm,
    );
  }
}
