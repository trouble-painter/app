import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/widgets/game_exit_button.dart';
import 'package:x_pr/core/theme/components/circular_timer/circular_timer.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class GameGuessAppBar extends StatelessWidget {
  const GameGuessAppBar({
    super.key,
    required this.startedAt,
    required this.maxGuessMs,
    required this.isMafia,
    required this.category,
  });

  final DateTime startedAt;
  final int maxGuessMs;
  final bool isMafia;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircularTimer(
            startedAt: startedAt,
            totalMs: maxGuessMs,
          ),
          if (isMafia)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: AutoSizeText(
                category,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: context.typo.header2,
              ),
            ),
          const Spacer(),
          const GameExitButton(),
        ],
      ),
    );
  }
}
