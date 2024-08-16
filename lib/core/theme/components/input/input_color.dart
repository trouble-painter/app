import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/res/palette.dart';

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
