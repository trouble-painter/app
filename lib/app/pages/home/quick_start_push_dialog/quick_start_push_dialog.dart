import 'package:material_ui/material_ui.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/dialogs/confirm_dialog.dart';
import 'package:trouble_painter/features/notification/domain/entities/notification_quick_start_data.dart';

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
      content: TextBalancer(data.content),
      confirmText: S.current.join,
      onConfirm: onConfirm,
    );
  }
}
