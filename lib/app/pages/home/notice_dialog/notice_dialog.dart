import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/home/notice_dialog/notice_dialog_model.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/dialogs/confirm_dialog.dart';
import 'package:trouble_painter/core/view/base_view.dart';
import 'package:trouble_painter/features/config/domain/entities/notice_dialog_data.dart';

class NoticeDialog extends StatelessWidget {
  const NoticeDialog({super.key, required this.noticeData});

  final NoticeDialogData noticeData;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: NoticeDialogModel.new,
      state: (ref, prevState) => noticeData,
      initState: (ref, viewModel) => viewModel.init(),
      builder: (ref, viewModel, state) => ConfirmDialog(
        title: state.title,
        content: state.desc.isEmpty
            ? null
            : Text(
                state.desc,
                textAlign: TextAlign.start,
              ),
        confirmText: state.url == null ? null : S.current.noticeDialogShowUrl,
        cancelText: S.current.close,
        onConfirm: viewModel.showUrl,
      ),
    );
  }
}
