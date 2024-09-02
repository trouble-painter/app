import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/anims/anim_reaction/anim_reaction.dart';

class AnimationSection extends StatelessWidget {
  const AnimationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 16,
      children: [
        AnimReaction(icon: 'mafia'),
        AnimReaction(icon: 'citizen'),
        AnimReaction(icon: 'like'),
        AnimReaction(icon: 'bad'),
        AnimReaction(icon: 'good'),
        AnimReaction(icon: 'question'),
      ],
    );
  }
}
