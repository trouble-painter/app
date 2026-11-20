import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/theme/components/image/asset_img.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/utils/ext/color_ext.dart';
import 'package:trouble_painter/features/game/domain/entities/game_user.dart';

/// The picture above the title: the mafia got away, or got caught.
/// A speech bubble with the mafia's nickname points at the mafia in the picture.
class GameResultPicture extends StatelessWidget {
  const GameResultPicture({
    super.key,
    required this.isMafiaWin,
    required this.mafia,
    this.onTap,
  });

  final bool isMafiaWin;
  final GameUser mafia;
  final VoidCallback? onTap;

  /// The picture sinks this far into the canvas below, to close the seam.
  static const double _sink = 0;

  /// Where each bubble's tail tip points, in picture pixels, just above the mafia's head
  static const _winPicture = _PictureSpec(
    image: 'result_mafia_win',
    width: 1140,
    tip: Offset(1008, 388),
  );
  static const _losePicture = _PictureSpec(
    image: 'result_mafia_lose',
    width: 1125,
    tip: Offset(612, 280),
  );

  static const EdgeInsets _bubblePadding =
      EdgeInsets.symmetric(horizontal: 8, vertical: 4);
  static const double _bubbleRadius = 14;
  static const double _tailWidth = 12;
  static const double _tailHeight = 8;

  /// Keeps the bubble this far from the screen sides
  static const double _sideMargin = 8;

  @override
  Widget build(BuildContext context) {
    final picture = isMafiaWin ? _winPicture : _losePicture;
    final style = context.typo.caption0;
    final color = mafia.color;
    final textColor = _readableOn(context, color);
    return Transform.translate(
      offset: const Offset(0, _sink),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final scale = constraints.maxWidth / picture.width;
          final tip = picture.tip * scale;

          /// The bubble fits its nickname, and stays on screen.
          final painter = TextPainter(
            text: TextSpan(text: mafia.nickname, style: style),
            textDirection: TextDirection.ltr,
            textScaler: MediaQuery.textScalerOf(context),
            maxLines: 1,
          )..layout(
              maxWidth: constraints.maxWidth -
                  _sideMargin * 2 -
                  _bubblePadding.horizontal,
            );

          /// Rounded up, or a lone character can come out a hair too wide for its box and be cut.
          final width =
              painter.width.ceilToDouble() + _bubblePadding.horizontal;
          final height = painter.height + _bubblePadding.vertical;
          final left = (tip.dx - width / 2).clamp(
            _sideMargin,
            constraints.maxWidth - _sideMargin - width,
          );
          return Stack(
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                onTap: onTap,
                child: AssetImg(
                  picture.image,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),

              /// Mafia nickname bubble
              Positioned(
                left: left,
                top: tip.dy - _tailHeight - height,
                width: width,
                height: height + _tailHeight,
                child: CustomPaint(
                  painter: _BubblePainter(
                    color: color,
                    tailX: (tip.dx - left).clamp(
                      _bubbleRadius + _tailWidth / 2,
                      width - _bubbleRadius - _tailWidth / 2,
                    ),
                    bodyHeight: height,
                  ),
                  child: Padding(
                    padding: _bubblePadding.copyWith(bottom: 4 + _tailHeight),
                    child: Center(
                      child: AutoSizeText(
                        mafia.nickname,
                        maxLines: 1,
                        minFontSize: 6,
                        softWrap: false,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: style.copyWith(color: textColor),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// The text color, or the surface color when the text is too faint on [background]
  static Color _readableOn(BuildContext context, Color background) {
    final text = context.color.text;
    return background.contrastWith(text) < ColorExt.minTextContrast
        ? context.color.surface
        : text;
  }
}

class _PictureSpec {
  const _PictureSpec({
    required this.image,
    required this.width,
    required this.tip,
  });

  final String image;

  /// Pixel width of the image file, which the other numbers are measured in
  final double width;
  final Offset tip;
}

class _BubblePainter extends CustomPainter {
  const _BubblePainter({
    required this.color,
    required this.tailX,
    required this.bodyHeight,
  });

  final Color color;

  /// Where the tail tip is, from the bubble's left
  final double tailX;
  final double bodyHeight;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    canvas.drawRRect(
      RRect.fromLTRBR(
        0,
        0,
        size.width,
        bodyHeight,
        const Radius.circular(GameResultPicture._bubbleRadius),
      ),
      paint,
    );
    canvas.drawPath(
      Path()
        ..moveTo(tailX - GameResultPicture._tailWidth / 2, bodyHeight - 1)
        ..lineTo(tailX, size.height)
        ..lineTo(tailX + GameResultPicture._tailWidth / 2, bodyHeight - 1)
        ..close(),
      paint,
    );
  }

  @override
  bool shouldRepaint(_BubblePainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.tailX != tailX ||
      oldDelegate.bodyHeight != bodyHeight;
}
