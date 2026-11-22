import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/dialogs/confirm_dialog.dart';

class GameKickDialog extends StatelessWidget {
  const GameKickDialog({
    super.key,
    required this.nickname,
    required this.onConfirm,
  });

  final String nickname;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return ConfirmDialog(
      title: S.current.gameKickTitle(nickname),
      confirmText: S.current.gameKick,
      onConfirm: onConfirm,
    );
  }
}
