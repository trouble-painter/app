import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/utils/ext/color_ext.dart';
import 'package:trouble_painter/features/game/domain/entities/player_color.dart';

void main() {
  test('contrast ratio follows WCAG', () {
    expect(Colors.black.contrastWith(Colors.white), closeTo(21, 0.01));
    expect(Colors.white.contrastWith(Colors.white), closeTo(1, 0.01));
  });

  test('white text unless its contrast falls below 3', () {
    expect(const Color(0xFF000000).readableTextColor, Colors.white);
    expect(PlayerColor.blue.drawing.readableTextColor, Colors.white);
    expect(PlayerColor.red.drawing.readableTextColor, Colors.white);
    expect(PlayerColor.yellow.drawing.readableTextColor, Colors.black);
  });

  test('every player color gets text with enough contrast', () {
    for (final color in PlayerColor.values) {
      final background = color.drawing;
      expect(
        background.contrastWith(background.readableTextColor),
        greaterThanOrEqualTo(ColorExt.minTextContrast),
        reason: color.name,
      );
    }
  });
}
