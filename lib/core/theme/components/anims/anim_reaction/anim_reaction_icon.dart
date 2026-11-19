part of 'anim_reaction.dart';

class AnimReactionIcon {
  final AnimationController controller;
  final double rotation;
  final double speed;
  final Offset position;
  final ui.Image image;
  final int index;
  final AnimReactionLabel? label;

  AnimReactionIcon({
    required this.controller,
    required this.rotation,
    required this.speed,
    required this.position,
    required this.image,
    required this.index,
    this.label,
  });

  Animation<double> get animation => CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      );
}

/// A text badge beside a flying icon, laid out once
class AnimReactionLabel {
  static const double _paddingH = 6;
  static const double _paddingV = 2;
  static const double _gap = 2;

  AnimReactionLabel({required String text, Color? color})
      : this._(text: text, background: color ?? Colors.black);

  AnimReactionLabel._({required String text, required Color background})
      : _background = Paint()..color = background,
        _text = TextPainter(
          text: TextSpan(
            text: text,
            style: TextStyle(
              color: background.readableTextColor,
              fontSize: 8.8,
              fontWeight: FontWeight.w700,
            ),
          ),
          maxLines: 1,
          ellipsis: '…',
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: 80);

  final Paint _background;
  final TextPainter _text;

  /// Paints the badge to the right of [iconRect], centered on it.
  void paint(Canvas canvas, Rect iconRect) {
    final size = Size(
      _text.width + _paddingH * 2,
      _text.height + _paddingV * 2,
    );
    final rect = Offset(
          iconRect.right + _gap,
          iconRect.center.dy - size.height / 2,
        ) &
        size;
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(size.height / 2)),
      _background,
    );
    _text.paint(canvas, rect.topLeft + const Offset(_paddingH, _paddingV));
  }
}
