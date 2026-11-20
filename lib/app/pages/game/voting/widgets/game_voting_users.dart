import 'dart:ui';

import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/voting/widgets/game_voting_counter.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:trouble_painter/core/theme/components/builder/child_builder.dart';
import 'package:trouble_painter/core/theme/components/icons/asset_icon.dart';
import 'package:trouble_painter/core/theme/components/profile/profile.dart';
import 'package:trouble_painter/core/theme/components/profile/profile_citizen.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/theme/res/layout.dart';
import 'package:trouble_painter/core/theme/res/palette.dart';
import 'package:trouble_painter/features/game/domain/entities/game_user.dart';

class GameVotingUsers extends StatelessWidget {
  const GameVotingUsers({
    super.key,
    required this.userList,
    required this.topVotedUsers,
    required this.voteResult,
    required this.myIndex,
    required this.myVoteIndex,
    required this.onPressed,
    required this.animDelayIndex,
  });

  final int animDelayIndex;
  final List<GameUser> userList;

  /// Users with the most votes, several on a tie
  final List<GameUser> topVotedUsers;
  final List<List<GameUser>> voteResult;
  final int myIndex;
  final int? myVoteIndex;
  final void Function(int index) onPressed;

  static const double _stickerSize = 34;
  static const double _stickerAngle = 0.4;

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
              final isTopVoted = topVotedUsers.contains(user);
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

                            /// Anchored to the circle, not to the nickname that may be wider
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: SizedBox.square(
                                  dimension: ProfileSize.small.diameter,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      /// Check
                                      Positioned(
                                        top: -12,
                                        right: -0.5,
                                        child: Opacity(
                                          opacity: isVotedUser ? 1 : 0,
                                          child: const _ShadowedIcon(
                                            'check',
                                            color: Palette.white,
                                          ),
                                        ),
                                      ),

                                      /// Mafia sticker on the top-voted
                                      if (isTopVoted)
                                        Positioned(
                                          top: -10,
                                          left: -10,
                                          child: Transform.rotate(
                                            angle: -_stickerAngle,
                                            child: const _ShadowedIcon(
                                              'mafia',
                                              size: _stickerSize,
                                              useIconColor: true,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
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

/// An icon with a soft drop shadow
class _ShadowedIcon extends StatelessWidget {
  const _ShadowedIcon(
    this.icon, {
    this.size,
    this.color,
    this.useIconColor = false,
  });

  final String icon;
  final double? size;
  final Color? color;
  final bool useIconColor;

  static const Offset _shadowOffset = Offset(1, 2);
  static const double _shadowBlur = 1.5;
  static const double _shadowAlpha = 0.4;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: _shadowOffset,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: _shadowBlur,
              sigmaY: _shadowBlur,
            ),
            child: AssetIcon(
              icon,
              size: size,
              color: Palette.black.withValues(alpha: _shadowAlpha),
            ),
          ),
        ),
        AssetIcon(
          icon,
          size: size,
          color: color,
          useIconColor: useIconColor,
        ),
      ],
    );
  }
}
