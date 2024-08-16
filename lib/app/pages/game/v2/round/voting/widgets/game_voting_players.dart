import 'package:flutter/material.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/features/game/v2/domain/entities/common/game_player.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round.dart';

class GameVotingPlayers extends StatelessWidget {
  const GameVotingPlayers({
    super.key,
    required this.round,
    required this.me,
    required this.myTurn,
    required this.onVoted,
  });

  final GameRound round;
  final GamePlayer me;
  final int myTurn;
  final void Function(int target) onVoted;
  GamePlayer? get iVotedPlayer {
    return round.voting[myTurn] == -1
        ? null
        : round.players[round.voting[myTurn]!];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const double spacing = 16;
        return Wrap(
          alignment: WrapAlignment.start,
          runSpacing: 16,
          spacing: spacing,
          children: round.players.asMap().entries.map((entry) {
            final turn = entry.key;
            final player = entry.value;
            final width = constraints.maxWidth / 2 - spacing;
            final votedPlayers = round.voting.entries
                .where((entry) => entry.value == turn)
                .map((entry) => round.players[entry.key])
                .toList();
            final isMe = me.id == player.id;
            final isIVoted = iVotedPlayer?.id == player.id;
            return GestureDetector(
              onTap: () {
                if (isMe) {
                  Toast.showText(S.current.cannotVoteSelf);
                } else {
                  onVoted(turn);
                }
              },
              child: SizedBox(
                width: width,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 222),
                  decoration: BoxDecoration(
                      color: context.color.hint.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isIVoted
                            ? context.color.primary
                            : Colors.transparent,
                        width: 3,
                      ),),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      /// Player
                      SizedBox(
                        width: 60,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /// Color
                            CircleAvatar(
                              backgroundColor: player.color,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  isMe ? S.current.me : "${turn + 1}",
                                  style: context.typo.caption0.copyWith(
                                    color: Colors.white,
                                    fontWeight: context.typo.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),

                            /// Nickname
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                player.nickname,
                                style: context.typo.caption0.copyWith(
                                  fontWeight: context.typo.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// Voted players
                      Expanded(
                        child: Center(
                          child: Text(
                            "${votedPlayers.length}",
                            style: context.typo.subHeader1.copyWith(
                              fontWeight: context.typo.bold,
                              color: isIVoted
                                  ? context.color.primary
                                  : context.color.text,
                            ),
                          ),
                        ),
                      ),
                      // Expanded(
                      //   child: Stack(
                      //     alignment: Alignment.centerRight,
                      //     children: [
                      //       ...votedPlayers.asMap().entries.map((entry) {
                      //         final index = entry.key;
                      //         final player = entry.value;
                      //         final playerTurn = round.players.indexWhere((p) {
                      //           return p.id == player.id;
                      //         });

                      //         return Container(
                      //           margin: EdgeInsets.only(
                      //             right: 8.0 * index,
                      //           ),
                      //           width: 30,
                      //           child: Padding(
                      //             padding: const EdgeInsets.symmetric(
                      //               horizontal: 2,
                      //             ),
                      //             child: CircleAvatar(
                      //               backgroundColor: player.color,
                      //               child: Padding(
                      //                 padding: const EdgeInsets.all(6),
                      //                 child: FittedBox(
                      //                   fit: BoxFit.scaleDown,
                      //                   child: Text(
                      //                     "${playerTurn + 1}",
                      //                     style: const TextStyle(
                      //                       color: Colors.white,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         );
                      //       })
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
