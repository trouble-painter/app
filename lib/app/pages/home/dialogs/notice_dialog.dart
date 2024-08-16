import 'package:flutter/material.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/dialogs/confirm_dialog.dart';
import 'package:x_pr/core/utils/ext/uri_ext.dart';
import 'package:x_pr/features/config/domain/entities/notice_dialog_data.dart';

class NoticeDialog extends StatelessWidget {
  const NoticeDialog({super.key, required this.noticeData});

  final NoticeDialogData noticeData;

  @override
  Widget build(BuildContext context) {
    return ConfirmDialog(
      title: noticeData.title,
      content: noticeData.desc.isEmpty
          ? null
          : Text(
              noticeData.desc,
              textAlign: TextAlign.start,
            ),
      confirmText:
          noticeData.url == null ? null : S.current.noticeDialogShowUrl,
      isCancel: false,
      onConfirm: () {
        noticeData.url?.launchBrowser();
      },
    );
  }
}
