import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';

class GameExitButton extends StatelessWidget {
  const GameExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      icon: 'go_out',
      onPressed: () {
        context.pushNamed(Routes.gameExitDialog.name);
        // context.dialog(GameExitConfirmDialog());
      },
    );
  }
}
