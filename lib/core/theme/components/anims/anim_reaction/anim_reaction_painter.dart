part of 'anim_reaction.dart';

class AnimReactionPainter extends CustomPainter {
  final List<AnimReactionIcon> icons;

  AnimReactionPainter({super.repaint, required this.icons});

  @override
  void paint(Canvas canvas, Size size) {
    for (final icon in icons) {
      final animatedValue = icon.animation.value;
      final opacity = 1.0 - animatedValue;
      final position = Offset(
        size.width / 2 + icon.position.dx,
        size.height - 100 - animatedValue * icon.speed,
      );
      final rotation = icon.rotation * (1 - animatedValue);

      canvas.save();
      canvas.translate(position.dx, position.dy);
      canvas.rotate(rotation);
      canvas.scale(0.5, 0.5);

      /// TODO Drawing SVG
      // icon.picture.paint(
      //   canvas,
      //   Rect.fromCenter(center: Offset(0, 0), width: 50, height: 50),
      //   Paint()..color = Colors.red.withOpacity(opacity.clamp(0.0, 1.0)),
      // );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
