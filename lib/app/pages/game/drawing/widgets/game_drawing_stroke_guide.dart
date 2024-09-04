import 'package:flutter/material.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/icons/asset_lottie.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class GameDrawingStrokeGuide extends StatefulWidget {
  const GameDrawingStrokeGuide({
    super.key,
    required this.isShowStrokeGuide,
    required this.maxStroke,
  });

  final bool isShowStrokeGuide;
  final int maxStroke;

  @override
  State<GameDrawingStrokeGuide> createState() => _GameDrawingStrokeGuideState();
}

class _GameDrawingStrokeGuideState extends State<GameDrawingStrokeGuide> {
  late AnimationController? controller;

  @override
  void didUpdateWidget(GameDrawingStrokeGuide oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isShowStrokeGuide != widget.isShowStrokeGuide) {
      if (widget.isShowStrokeGuide) {
        controller?.reset();
        controller?.repeat();
      } else {
        controller?.stop();
      }
    }
  }

  void onLottieLoaded(AnimationController animCtrl) {
    controller = animCtrl;
    if (widget.isShowStrokeGuide) {
      controller?.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AssetLottie(
          'stroke_guide',
          onLoaded: onLottieLoaded,
        ),
        if (widget.maxStroke == 1)
          Text(
            S.current.gameDrawingSingleStrokeGuide,
            style: context.typo.subHeader1.copyWith(
              color: context.color.primary,
            ),
          ),
      ],
    );
  }
}
