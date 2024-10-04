import 'dart:math';

import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/res/layout.dart';

class HomePageCitizen extends StatefulWidget {
  const HomePageCitizen({super.key, required this.bottom});

  final double bottom;

  @override
  State<HomePageCitizen> createState() => _HomePageCitizenState();
}

class _HomePageCitizenState extends State<HomePageCitizen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
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
          right: 30.dw + 5.dw * sin(controller.value * 2 * pi),
          child: child!,
        );
      },
      child: AssetImg(
        'home_citizen',
        width: 93.dw,
      ),
    );
  }
}
