import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v3/widgets/game_exit_confirm_dialog.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';

class GameExitButton extends StatelessWidget {
  const GameExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      icon: 'go_out',
      onPressed: () {
        context.dialog(GameExitConfirmDialog(context));
      },
    );
  }
}
