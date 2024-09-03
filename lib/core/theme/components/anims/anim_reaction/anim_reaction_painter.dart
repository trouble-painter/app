part of 'anim_reaction.dart';

class AnimReactionPainter extends CustomPainter {
  final List<AnimReactionIcon> icons;
  final double opacityStep;
  final double scaleStep;
  final double scaleMax;

  AnimReactionPainter({
    super.repaint,
    required this.icons,
    this.opacityStep = 0.8,
    this.scaleStep = 0.8,
    this.scaleMax = 1.4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < icons.length; i++) {
      final icon = icons[i];
      final (animatedValue, image, index) = (
        icon.animation.value,
        icon.image,
        icon.index,
      );
      final double opacity = animatedValue >= opacityStep
          ? ((animatedValue - 1) / (opacityStep - 1)).clamp(0, 1)
          : 1;
      final double scale = animatedValue >= scaleStep
          ? (scaleMax - 1) / (scaleStep - 1) * (animatedValue - 1) + 1
          : (scaleMax - 0.5) / scaleStep * animatedValue + 0.5;
      final position = Offset(
        image.width / 2 * scale,
        (size.height) * (1 - animatedValue) - image.height,
      );
      final rotation = icon.rotation *
          2 *
          (index.isEven ? cos(animatedValue * 3) : sin(animatedValue * 3));
      canvas.save();
      rotate(canvas, position, rotation);
      paintImage(
        canvas: canvas,
        rect: Rect.fromLTWH(
          position.dx,
          position.dy,
          image.width * scale,
          image.height * scale,
        ),
        opacity: opacity,
        image: image,
      );
      canvas.restore();
    }
  }

  void rotate(Canvas canvas, Offset offset, double radian) {
    canvas.translate(offset.dx, offset.dy);
    canvas.rotate(radian);
    canvas.translate(-offset.dx, -offset.dy);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
