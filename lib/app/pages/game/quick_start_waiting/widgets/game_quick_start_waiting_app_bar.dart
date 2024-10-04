import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/widgets/game_exit_button.dart';

class GameQuickStartWaitingAppBar extends StatelessWidget {
  const GameQuickStartWaitingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 12,
        left: 16,
        right: 16,
        bottom: 8,
      ),
      child: Row(
        children: [
          Spacer(),
          GameExitButton(),
        ],
      ),
    );
  }
}
