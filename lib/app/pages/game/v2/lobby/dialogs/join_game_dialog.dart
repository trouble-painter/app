import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/dialogs/confirm_dialog.dart';
import 'package:x_pr/core/theme/components/input/input.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';

class JoinGameDialog extends StatelessWidget {
  const JoinGameDialog({
    super.key,
    this.roomId,
    required this.onEntered,
  });

  final String? roomId;
  final void Function(String roomId) onEntered;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: roomId);
    return ConfirmDialog(
      title: S.current.joinRoom,
      content: Input(
        controller: controller,
        hint: S.current.inviteCodeRequired,
      ),
      onConfirm: () async {
        final inviteCode = controller.text.trim();
        if (inviteCode.isEmpty) {
          Toast.showText(S.current.inviteCodeRequired);
          return;
        }

        context.pop();
        onEntered(inviteCode);
      },
    );
  }
}
