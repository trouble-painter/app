import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/dialogs/confirm_dialog.dart';
import 'package:x_pr/features/config/domain/entities/maintenance_dialog_data.dart';

class MaintenanceDialog extends StatelessWidget {
  const MaintenanceDialog({
    super.key,
    required this.maintenanceDialogData,
  });

  final MaintenanceDialogData maintenanceDialogData;

  String get duration {
    final dateFormat = DateFormat('yy.MM.dd HH:mm');
    return "${dateFormat.format(maintenanceDialogData.startedAt)} ~ ${dateFormat.format(maintenanceDialogData.endedAt)}";
  }

  @override
  Widget build(BuildContext context) {
    return ConfirmDialog(
      title: maintenanceDialogData.title,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(duration),
          ),
          TextBalancer(
            S.current.maintenanceDialogDesc,
          ),
        ],
      ),
      isCancel: false,
      isAction: false,
    );
  }
}
