import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AssetLottie extends StatefulWidget {
  const AssetLottie(
    this.lottie, {
    required this.onLoaded,
    super.key,
    this.width,
    this.height,
  });

  final String lottie;
  final double? width;
  final double? height;
  final void Function(AnimationController animCtrl) onLoaded;

  @override
  State<AssetLottie> createState() => _AssetLottieState();
}

class _AssetLottieState extends State<AssetLottie>
    with TickerProviderStateMixin {
  late final AnimationController animCtrl;

  @override
  void initState() {
    super.initState();
    animCtrl = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    animCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lotties/${widget.lottie}.json',
      controller: animCtrl,
      frameRate: FrameRate.max,
      onLoaded: (composition) {
        animCtrl.duration = composition.duration;
        widget.onLoaded(animCtrl);
      },
    );
  }
}
