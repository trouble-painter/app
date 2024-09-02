part of 'anim_reaction.dart';

class AnimReactionPainter extends CustomPainter {
  final List<AnimReactionIcon> icons;

  AnimReactionPainter({super.repaint, required this.icons});

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < icons.length; i++) {
      final icon = icons[i];
      final (animatedValue, image, index) = (
        icon.animation.value,
        icon.image,
        icon.index,
      );
      final opacity = 1.0 - animatedValue;
      final scale = 0.5 * (1 + animatedValue);
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
    return true;
  }
}
