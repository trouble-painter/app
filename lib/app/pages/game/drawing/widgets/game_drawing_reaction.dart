import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/anims/anim_reaction/anim_reaction.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/features/game/domain/entities/game_reaction.dart';

class GameDrawingReaction extends StatelessWidget {
  const GameDrawingReaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: context.color.hintContainer,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: GameReaction.values.map((reaction) {
          return AnimReaction(
            icon: reaction.name,
            reactionHeight: context.screen.height * 0.45,
          );
        }).toList(),
      ),
    );
  }
}
