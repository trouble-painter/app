import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/theme/res/palette.dart';

class InputColor {
  final Color background;
  final Color hint;
  final Color text;

  InputColor({
    required bool isLight,
  })  : background = isLight ? Palette.black : Palette.gray20,
        hint = isLight ? Palette.black : Palette.gray50,
        text = isLight ? Palette.black : Palette.gray110;
}
