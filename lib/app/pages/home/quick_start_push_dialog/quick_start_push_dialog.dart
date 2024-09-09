import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/dialogs/confirm_dialog.dart';

class QuickStartPushDialog extends StatelessWidget {
  const QuickStartPushDialog({
    super.key,
    required this.title,
    required this.desc,
    required this.onConfirm,
  });

  final String title;
  final String desc;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return ConfirmDialog(
      title: title,
      content: Text(desc),
      onConfirm: onConfirm,
    );
  }
}
