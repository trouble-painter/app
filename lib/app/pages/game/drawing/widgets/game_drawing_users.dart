import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:x_pr/app/pages/game/drawing/widgets/game_drawing_turn_bubble.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:x_pr/core/theme/components/profile/profile_citizen.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/features/game/domain/entities/game_user.dart';

class GameDrawingUsers extends StatelessWidget {
  const GameDrawingUsers({
    super.key,
    required this.userList,
    required this.currentTurn,
    required this.isMafia,
    required this.myTurn,
    required this.scrollController,
    required this.isShowCurrentTurn,
  });

  final AutoScrollController scrollController;
  final List<GameUser> userList;
  final int currentTurn;
  final int myTurn;
  final bool isMafia;
  final bool isShowCurrentTurn;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          final isCurrentTurn = currentTurn == index;
          final isMyTurn = currentTurn == myTurn;
          final isMe = myTurn == index;
          final roleColor =
              isMafia ? context.color.primary : context.color.secondary;
          return AutoScrollTag(
            controller: scrollController,
            index: index,
            key: ValueKey(index),
            child: SizedBox(
              width: 82,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  /// Profile
                  Positioned.fill(
                    bottom: 18,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 333),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 9,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1.5,
                          color: isShowCurrentTurn && isCurrentTurn
                              ? isMyTurn
                                  ? roleColor
                                  : context.color.onHintContainer
                              : Colors.transparent,
                        ),
                      ),
                      child: ProfileCitizen(
                        user: user,
                        nicknameStyle: context.typo.caption2,
                        badge: "${index + 1}",
                      ),
                    ),
                  ),

                  /// Drawing bubble
                  if (isCurrentTurn && isShowCurrentTurn)
                    Positioned(
                      top: -26,
                      child: AnimTransOpacity(
                        offsetDelta: 12,
                        child: GameDrawingTurnBubble(
                          textColor: isMyTurn
                              ? context.color.surface
                              : context.color.text,
                          color: isMyTurn
                              ? roleColor
                              : context.color.onHintContainer,
                          text: isMyTurn
                              ? S.current.gameDrawingMyTurn
                              : S.current.gameDrawingOtherTurn,
                        ),
                      ),
                    ),

                  /// Me
                  if (isMe)
                    Positioned(
                      bottom: 9,
                      child: Container(
                        decoration: BoxDecoration(
                          color: roleColor,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 3,
                        ),
                        child: Text(
                          S.current.me,
                          style: context.typo.caption2.copyWith(
                            color: context.color.surface,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
