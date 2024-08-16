import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v3/widgets/game_exit_button.dart';
import 'package:x_pr/core/theme/components/circular_timer/circular_timer.dart';

class GameResultAppBar extends StatelessWidget {
  const GameResultAppBar({
    super.key,
    required this.startedAt,
    required this.totalMs,
  });

  final DateTime startedAt;
  final int totalMs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircularTimer(
            startedAt: startedAt,
            totalMs: totalMs,
          ),
          const Spacer(),
          const GameExitButton(),
        ],
      ),
    );
  }
}
