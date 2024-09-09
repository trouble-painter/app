import 'package:flutter/material.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/dialogs/confirm_dialog.dart';
import 'package:x_pr/features/notification/domain/entities/notification_quick_start_data.dart';

class QuickStartPushDialog extends StatelessWidget {
  const QuickStartPushDialog({
    super.key,
    required this.data,
    required this.onConfirm,
  });

  final VoidCallback onConfirm;
  final NotificationQuickStartData data;

  @override
  Widget build(BuildContext context) {
    return ConfirmDialog(
      title: data.title,
      content: Text(data.content),
      confirmText: S.current.join,
      onConfirm: onConfirm,
    );
  }
}
