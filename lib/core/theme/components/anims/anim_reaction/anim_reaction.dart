import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';

part 'anim_reaction_icon.dart';
part 'anim_reaction_painter.dart';

class AnimReaction extends StatefulWidget {
  const AnimReaction({super.key});

  @override
  State<AnimReaction> createState() => _AnimReactionState();
}

class _AnimReactionState extends State<AnimReaction>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late SvgPicture svgImage;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    svgImage = SvgPicture.asset('assets/icons/mafia.svg');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void reaction() {
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Button(
          icon: 'mafia',
          useIconColor: true,
          onPressed: () {},
        ),
      ],
    );
  }
}
