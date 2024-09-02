part of 'anim_reaction.dart';

class AnimReactionIcon {
  final AnimationController controller;
  final double rotation;
  final double speed;
  final Offset position;
  final ui.Image image;
  final int index;

  AnimReactionIcon({
    required this.controller,
    required this.rotation,
    required this.speed,
    required this.position,
    required this.image,
    required this.index,
  });

  Animation<double> get animation => CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      );
}
