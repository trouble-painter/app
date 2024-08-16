import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v3/widgets/game_exit_button.dart';
import 'package:x_pr/core/theme/components/circular_timer/circular_timer.dart';

class GameReadyAppBar extends StatelessWidget {
  const GameReadyAppBar({
    super.key,
    required this.totalMs,
    required this.startedAt,
  });
  final int totalMs;
  final DateTime startedAt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: Row(
        children: [
          CircularTimer(
            totalMs: totalMs,
            startedAt: startedAt,
          ),
          const Spacer(),
          const GameExitButton(),
        ],
      ),
    );
  }
}
