import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/widgets/game_exit_button.dart';
import 'package:x_pr/core/theme/components/circular_timer/circular_timer.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class GameVotingAppBar extends StatelessWidget {
  const GameVotingAppBar({
    super.key,
    required this.maxVotingMs,
    required this.votingStartedAt,
    required this.category,
    required this.keyword,
    required this.isMafia,
  });

  final int maxVotingMs;
  final DateTime votingStartedAt;
  final String category;
  final String keyword;
  final bool isMafia;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircularTimer(
            startedAt: votingStartedAt,
            totalMs: maxVotingMs,
            color: context.color.surface,
            trackColor: context.color.surfaceContainer,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Wrap(
              runAlignment: WrapAlignment.center,
              children: [
                Text(
                  category,
                  style: context.typo.header3.copyWith(
                    color: context.color.surface,
                  ),
                ),
                if (!isMafia) ...[
                  Container(
                    width: 4,
                    height: 4,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: context.color.surface,
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                  Text(
                    keyword,
                    style: context.typo.header3.copyWith(
                      color: context.color.surface,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const GameExitButton(),
        ],
      ),
    );
  }
}
