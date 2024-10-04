import 'dart:math';

import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/res/layout.dart';

class HomePageMafia extends StatefulWidget {
  const HomePageMafia({super.key, required this.bottom});

  final double bottom;

  @override
  State<HomePageMafia> createState() => _HomePageMafiaState();
}

class _HomePageMafiaState extends State<HomePageMafia>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Positioned(
          bottom: widget.bottom,
          left: 46.dw,
          child: Stack(
            children: [
              Positioned(
                left: 3.dw,
                child: Transform.rotate(
                  angle: 5 * pi / 180 * sin(controller.value * pi * 2),
                  alignment: Alignment.bottomRight,
                  child: AssetImg(
                    'home_mafia_paint',
                    width: 45.dw,
                  ),
                ),
              ),
              child!,
            ],
          ),
        );
      },
      child: AssetImg(
        'home_mafia',
        width: 135.dw,
      ),
    );
  }
}
