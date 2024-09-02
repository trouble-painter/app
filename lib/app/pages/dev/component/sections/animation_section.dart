import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/anims/anim_reaction/anim_reaction.dart';
import 'package:x_pr/core/utils/ext/widget_ext.dart';

class AnimationSection extends StatelessWidget {
  const AnimationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AnimReaction(icon: 'mafia', reactionHeight: 360),
        const AnimReaction(icon: 'citizen', reactionHeight: 200),
        const AnimReaction(icon: 'like', reactionHeight: 360),
        const AnimReaction(icon: 'bad', reactionHeight: 360),
        const AnimReaction(icon: 'good', reactionHeight: 360),
        const AnimReaction(icon: 'question', reactionHeight: 360),
      ].gap(width: 16),
    );
  }
}
