import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v3/voting/widgets/game_voting_counter.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:x_pr/core/theme/components/builder/child_builder.dart';
import 'package:x_pr/core/theme/components/icons/asset_icon.dart';
import 'package:x_pr/core/theme/components/profile/profile.dart';
import 'package:x_pr/core/theme/components/profile/profile_citizen.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_user.dart';

class GameVotingUsers extends StatelessWidget {
  const GameVotingUsers({
    super.key,
    required this.userList,
    required this.voteResult,
    required this.myIndex,
    required this.myVoteIndex,
    required this.onPressed,
    required this.animDelayIndex,
  });

  final int animDelayIndex;
  final List<GameUser> userList;
  final List<List<GameUser>> voteResult;
  final int myIndex;
  final int? myVoteIndex;
  final void Function(int index) onPressed;

  @override
  Widget build(BuildContext context) {
    const double minWidth = 377;
    const int maxVisibleVoter = 4;
    const double vouterBorder = 1.5;
    final double screenWidth = context.screen.width;
    final smallWidthDevice = screenWidth < minWidth;
    final paddingDelta = screenWidth - minWidth;
    return Padding(
      padding: EdgeInsets.only(
        top: 24,
        left: smallWidthDevice ? 20 + paddingDelta : 20,
        right: smallWidthDevice ? 20 + paddingDelta : 20,
        bottom: 8,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => SizedBox(
          width: constraints.maxWidth,
          child: Wrap(
            runSpacing: 20,
            children: userList.asMap().entries.map((entry) {
              final (userIndex, user) = (entry.key, entry.value);
              final voterList = voteResult[userIndex];
              final isFirstLine = userIndex < 5;
              final isMe = myIndex == userIndex;
              final isVotedUser = myVoteIndex == userIndex;
              return AnimTransOpacity(
                delayIndex: isFirstLine ? animDelayIndex : animDelayIndex + 1,
                child: SizedBox(
                  width: constraints.maxWidth / 5,
                  height: 96,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () => onPressed(userIndex),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            /// Candidate
                            ProfileCitizen(
                              size: ProfileSize.small,
                              nicknameStyle: context.typo.caption2,
                              badge: isMe ? S.current.me : null,
                              user: user,
                              // Hide disconnected state in voting page
                              isConnect: true,
                            ),

                            /// Check
                            Positioned(
                              top: -12,
                              right: -0.5,
                              child: Opacity(
                                opacity: isVotedUser ? 1 : 0,
                                child: const AssetIcon(
                                  'check',
                                  useIconColor: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6.5),

                      /// Voters
                      Wrap(
                        spacing: -4 - vouterBorder,
                        children: voterList
                            .take(maxVisibleVoter)
                            .toList()
                            .asMap()
                            .entries
                            .map((entry) {
                          final (voterIndex, voter) = (entry.key, entry.value);
                          final isLast = voterIndex == maxVisibleVoter - 1;
                          final isOverflow = voterList.length > maxVisibleVoter;
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: vouterBorder,
                                color: context.color.surface,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: ChildBuilder(
                              builder: (child) {
                                return isOverflow && isLast
                                    ? GameVotingCounter(
                                        text:
                                            "+${voterList.length - maxVisibleVoter}",
                                        child: child,
                                      )
                                    : child;
                              },
                              child: ProfileCitizen(
                                // Hide disconnected state in voting page
                                isConnect: true,
                                user: voter,
                                size: ProfileSize.icon,
                                showNickname: false,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
