import 'package:material_ui/material_ui.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/dialogs/confirm_dialog.dart';

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
