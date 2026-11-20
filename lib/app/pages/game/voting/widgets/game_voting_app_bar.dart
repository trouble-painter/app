import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/voting/widgets/game_voting_suspect.dart';
import 'package:trouble_painter/app/pages/game/widgets/game_exit_button.dart';
import 'package:trouble_painter/core/theme/components/circular_timer/circular_timer.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/features/game/domain/entities/game_user.dart';

class GameVotingAppBar extends StatelessWidget {
  const GameVotingAppBar({
    super.key,
    required this.maxVotingMs,
    required this.votingStartedAt,
    required this.category,
    required this.keyword,
    required this.isMafia,
    required this.topVotedUsers,
    this.onSuspectPressed,
  });

  final int maxVotingMs;
  final DateTime votingStartedAt;
  final String category;

  /// Null for the mafia
  final String? keyword;
  final bool isMafia;
  final List<GameUser> topVotedUsers;
  final VoidCallback? onSuspectPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              CircularTimer(
                startedAt: votingStartedAt,
                totalMs: maxVotingMs,
              ),
              const SizedBox(width: 12),

              /// Suspect, centered between the timer and the exit button
              Expanded(
                /// As tall as the timer, so the text never moves the timer or the
                /// exit button. A zero height would also leave nothing to tap.
                child: SizedBox(
                  height: CircularTimer.size,
                  child: OverflowBox(
                    maxHeight: double.infinity,
                    child: GameVotingSuspect(
                      topVotedUsers: topVotedUsers,
                      onPressed: onSuspectPressed,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const GameExitButton(),
            ],
          ),
          Wrap(
            alignment: WrapAlignment.center,
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
                  keyword ?? '',
                  style: context.typo.header3.copyWith(
                    color: context.color.surface,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
