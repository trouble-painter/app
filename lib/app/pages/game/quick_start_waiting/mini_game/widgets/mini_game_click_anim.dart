import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class MiniGameClickAnim {
  final AnimationController controller;
  final double rotation;
  final double speed;
  final Offset position;
  final ui.Image image;
  final int index;

  MiniGameClickAnim({
    required this.controller,
    required this.rotation,
    required this.speed,
    required this.position,
    required this.image,
    required this.index,
  });

  Animation<double> get animation => CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      );
}
