import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/widgets/game_exit_button.dart';
import 'package:x_pr/core/theme/components/circular_timer/circular_timer.dart';

class GameDrawingAppBar extends StatelessWidget {
  const GameDrawingAppBar({
    super.key,
    required this.startedAt,
    required this.turnMaxMs,
    required this.startTimer,
  });

  final DateTime startedAt;
  final int turnMaxMs;
  final bool startTimer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 18,
      ),
      child: Row(
        children: [
          CircularTimer(
            startedAt: startedAt,
            totalMs: turnMaxMs,
            startTimer: startTimer,
          ),
          const Spacer(),
          const GameExitButton(),
        ],
      ),
    );
  }
}
