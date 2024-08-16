import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/dialogs/confirm_dialog.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';

class EditNicknameDialog extends StatelessWidget {
  const EditNicknameDialog(
      {super.key, required this.nickname, required this.onEdited,});

  final String nickname;
  final void Function(String nickname) onEdited;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: nickname);
    return ConfirmDialog(
      title: S.current.editNickname,
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: S.current.nicknameRequired,
        ),
      ),
      onConfirm: () {
        if (controller.text.trim().isEmpty) {
          Toast.showText(S.current.nicknameRequired);
          return;
        }

        onEdited(controller.text);
        context.pop();
      },
    );
  }
}
