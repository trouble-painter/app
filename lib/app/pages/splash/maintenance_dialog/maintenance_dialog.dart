import 'package:flutter/material.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:x_pr/app/pages/splash/maintenance_dialog/maintenance_dialog_model.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/dialogs/confirm_dialog.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/entities/maintenance_dialog_data.dart';

class MaintenanceDialog extends StatelessWidget {
  const MaintenanceDialog({
    super.key,
    required this.maintenanceDialogData,
  });

  final MaintenanceDialogData maintenanceDialogData;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: MaintenanceDialogModel.new,
      state: (ref, prevState) => maintenanceDialogData,
      initState: (ref, viewModel) => viewModel.init(),
      builder: (ref, viewModel, state) => ConfirmDialog(
        title: state.title,
        content: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(viewModel.duration),
            ),
            TextBalancer(
              S.current.maintenanceDialogDesc,
            ),
          ],
        ),
        isCancel: false,
        isAction: false,
      ),
    );
  }
}
