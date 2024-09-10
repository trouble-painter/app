import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:x_pr/core/theme/components/icons/asset_icon.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/core/theme/res/palette.dart';

class JoinQrFocus extends StatefulWidget {
  const JoinQrFocus({
    super.key,
    required this.dimension,
    required this.focusPaddingBottom,
    required this.isQrCodeFound,
    required this.fondAnimDuration,
  });

  final double dimension;
  final double focusPaddingBottom;
  final bool isQrCodeFound;
  final Duration fondAnimDuration;

  @override
  State<JoinQrFocus> createState() => _JoinQrFocusState();
}

class _JoinQrFocusState extends State<JoinQrFocus>
    with SingleTickerProviderStateMixin {
  late final AnimationController animCtrl;
  late final Animation<double> scaleAnimation;
  final double checkRadius = 40;

  @override
  void initState() {
    super.initState();
    animCtrl = AnimationController(
      vsync: this,
      duration: widget.fondAnimDuration,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animCtrl.reset();
        }
      });
    scaleAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.08).chain(
          CurveTween(curve: Curves.fastOutSlowIn),
        ),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.08, end: 1.0).chain(
          CurveTween(curve: Curves.fastOutSlowIn),
        ),
        weight: 1,
      ),
    ]).animate(animCtrl);
  }

  @override
  void didUpdateWidget(JoinQrFocus oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isQrCodeFound &&
        oldWidget.isQrCodeFound != widget.isQrCodeFound) {
      animCtrl.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Focus
        Positioned.fill(
          child: AnimatedBuilder(
            animation: scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: scaleAnimation.value,
                child: child,
              );
            },
            child: CustomPaint(
              painter: JoinQrFocusPainter(
                focusDimension: widget.dimension,
                focusPaddingBottom: widget.focusPaddingBottom,
                backgroundColor: Palette.black.withOpacity(0.8),
                focusColor: context.color.primary,
              ),
            ),
          ),
        ),

        /// Check
        Positioned(
          top: context.screen.height / 2 -
              checkRadius -
              widget.focusPaddingBottom,
          left: 0,
          right: 0,
          child: Center(
            child: AnimTransOpacity(
              isReverse: !widget.isQrCodeFound,
              child: CircleAvatar(
                radius: checkRadius,
                backgroundColor: context.color.primary,
                child: const AssetIcon('check2'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class JoinQrFocusPainter extends CustomPainter {
  JoinQrFocusPainter({
    super.repaint,
    required this.focusColor,
    required this.backgroundColor,
    required this.focusDimension,
    required this.focusPaddingBottom,
  });
  final Color backgroundColor;
  final Color focusColor;
  final double focusDimension;
  final double focusLength = 32;
  final double focusRadius = 6;
  final double focusPaddingBottom;

  @override
  void paint(Canvas canvas, Size size) {
    final (w, h) = (size.width, size.height);

    /// Draw background
    drawBackground(canvas, w, h);

    /// Draw focus
    canvas.save();
    canvas.translate(
      (w - focusDimension) / 2,
      (h - focusDimension) / 2 - focusPaddingBottom,
    );
    drawFocus(canvas, focusDimension, focusDimension);
    canvas.restore();
  }

  void drawBackground(Canvas canvas, double w, double h) {
    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    final Path path = Path()
      ..addRect(Rect.fromLTWH(0, 0, w, h))
      ..addRRect(
        RRect.fromLTRBR(
          (w - focusDimension) / 2,
          (h - focusDimension) / 2 - focusPaddingBottom,
          (w + focusDimension) / 2,
          (h + focusDimension) / 2 - focusPaddingBottom,
          Radius.circular(focusRadius),
        ),
      )
      ..fillType = PathFillType.evenOdd;
    canvas.drawPath(path, paint);
  }

  void drawFocus(Canvas canvas, double w, double h) {
    final paint = Paint()
      ..color = focusColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final Path path = Path()

      /// ┌
      ..moveTo(0, focusLength)
      ..lineTo(0, focusRadius)
      ..arcToPoint(
        Offset(focusRadius, 0),
        radius: Radius.circular(focusRadius),
      )
      ..lineTo(focusLength, 0)

      /// ┐
      ..moveTo(w - focusLength, 0)
      ..lineTo(w - focusRadius, 0)
      ..arcToPoint(
        Offset(w, focusRadius),
        radius: Radius.circular(focusRadius),
      )
      ..lineTo(w, focusLength)

      /// └
      ..moveTo(0, h - focusLength)
      ..lineTo(0, h - focusRadius)
      ..arcToPoint(
        Offset(focusRadius, h),
        radius: Radius.circular(focusRadius),
        clockwise: false,
      )
      ..lineTo(focusLength, h)

      /// ┘
      ..moveTo(w - focusLength, h)
      ..lineTo(w - focusRadius, h)
      ..arcToPoint(
        Offset(w, h - focusRadius),
        radius: Radius.circular(focusRadius),
        clockwise: false,
      )
      ..lineTo(w, h - focusLength);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
