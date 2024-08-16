import 'package:flutter/material.dart';

extension CanvasExt on Offset {
  static const Offset clearPoint = Offset(-1, -1);
  bool get isClearPoint => dx == clearPoint.dx && dy == clearPoint.dy;
}
