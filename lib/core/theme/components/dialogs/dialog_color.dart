import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/res/palette.dart';

class DialogColor {
  final Color background;
  final Color title;
  final Color content;
  final Color cancelButtonBackground;
  final Color cancelButtonText;

  DialogColor({
    required bool isLight,
  })  : background = isLight ? Palette.gray110 : Palette.gray10,
        title = isLight ? Palette.gray00 : Palette.gray110,
        content = isLight ? Palette.gray60 : Palette.gray60,
        cancelButtonBackground = isLight ? Palette.gray20 : Palette.gray20,
        cancelButtonText = isLight ? Palette.gray110 : Palette.gray110;
}
