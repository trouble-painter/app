part of 'anim_reaction.dart';

class AnimReactionIcon {
  final AnimationController controller;
  final double rotation;
  final double speed;
  final Offset position;
  final SvgPicture picture;

  AnimReactionIcon({
    required this.controller,
    required this.rotation,
    required this.speed,
    required this.position,
    required this.picture,
  });

  Animation<double> get animation => CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      );
}
