import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/dialogs/confirm_dialog.dart';

class GameKickedDialog extends StatelessWidget {
  const GameKickedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmDialog(
      title: S.current.gameKickedTitle,
      isCancel: false,
    );
  }
}
