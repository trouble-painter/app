import 'package:flutter/material.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/circular_timer/circular_timer.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class GameResultTimer extends StatelessWidget {
  const GameResultTimer({
    super.key,
    required this.startedAt,
    required this.totalMs,
    required this.isMafiaWin,
  });

  final DateTime startedAt;
  final int totalMs;
  final bool isMafiaWin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.color.hintContainer,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          CircularTimer(
            startedAt: startedAt,
            totalMs: totalMs,
            builder: (secAnimation) {
              return Text(
                S.current.sec(secAnimation.value),
                style: context.typo.header2.copyWith(
                  color: isMafiaWin
                      ? context.color.primary
                      : context.color.secondary,
                ),
              );
            },
          ),
          const SizedBox(height: 4),
          Text(
            S.current.gameResultV2TimerDesc,
            style: context.typo.body2.copyWith(
              color: context.color.subtext4,
            ),
          ),
        ],
      ),
    );
  }
}
