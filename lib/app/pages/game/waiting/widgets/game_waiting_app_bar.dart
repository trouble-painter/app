import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/widgets/game_exit_button.dart';

class GameRoomAppBar extends StatelessWidget {
  const GameRoomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Spacer(),
          GameExitButton(),
        ],
      ),
    );
  }
}
