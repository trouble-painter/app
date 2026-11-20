import 'dart:math';

import 'package:material_ui/material_ui.dart';

extension ColorExt on Color {
  /// Below this contrast white text turns black (WCAG AA for large or bold text)
  static const double minTextContrast = 2.5;

  /// WCAG contrast ratio with [other], from 1 to 21
  double contrastWith(Color other) {
    final a = computeLuminance();
    final b = other.computeLuminance();
    return (max(a, b) + 0.05) / (min(a, b) + 0.05);
  }

  /// White text on this color, or black when white falls below [minTextContrast]
  Color get readableTextColor => contrastWith(Colors.white) >= minTextContrast
      ? Colors.white
      : Colors.black;
}
