import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:trouble_painter/core/theme/components/icons/asset_lottie.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';

class GameDrawingStrokeGuide extends StatefulWidget {
  const GameDrawingStrokeGuide({
    super.key,
    required this.isShowStrokeGuide,
    required this.maxStroke,
  });

  final bool isShowStrokeGuide;

  /// Null means no limit
  final int? maxStroke;

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
    return AnimTransOpacity(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 196,
            height: 160,
            child: AssetLottie(
              'stroke_guide',
              onLoaded: onLottieLoaded,
            ),
          ),
          Text(
            switch (widget.maxStroke) {
              null => S.current.gameDrawingUnlimitedStrokeGuide,
              1 => S.current.gameDrawingSingleStrokeGuide,
              final n => S.current.gameDrawingMultiStrokeGuide(n),
            },
            style: context.typo.subHeader1.copyWith(
              color: context.color.primary,
            ),
          ),
        ],
      ),
    );
  }
}
