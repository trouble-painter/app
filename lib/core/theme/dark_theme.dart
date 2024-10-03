import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/dialogs/dialog_color.dart';
import 'package:x_pr/core/theme/components/input/input_color.dart';
import 'package:x_pr/core/theme/res/typo_secondary.dart';
import 'package:x_pr/core/theme/res/typo_tertiary.dart';

import 'foundations/app_theme.dart';
import 'res/palette.dart';
import 'res/typo_primary.dart';

class DarkTheme implements AppTheme {
  @override
  Brightness brightness = Brightness.dark;

  @override
  AppColor color = AppColor(
    surface: Palette.gray00,
    surfaceContainer: Palette.gray100,
    dialogSurface: Palette.gray10,
    background: Palette.black.withOpacity(0.7),
    text: Palette.gray110,
    subtext1: Palette.gray90,
    subtext2: Palette.gray80,
    subtext3: Palette.gray70,
    subtext4: Palette.gray60,
    subtext5: Palette.gray50,
    hint: Palette.gray40,
    hintContainer: Palette.gray10,
    onHintContainer: Palette.gray30,
    iconContainer: Palette.gray20,
    toastContainer: Palette.black,
    onToastContainer: Palette.gray110,
    inactive: Palette.gray50,
    inactiveContainer: Palette.gray10,
    onInactiveContainer: Palette.gray50,
    terrain: Palette.gray00,
    primary: Palette.orange,
    onPrimary: Palette.gray00,
    secondary: Palette.mint,
    onSecondary: Palette.gray00,
    warning: Palette.red,
    success: Palette.green,
    info: Palette.yellow,
    dialogColor: DialogColor(isLight: false),
    inputColor: InputColor(isLight: false),
  );

  @override
  late AppTypoPrimary typo = AppTypoPrimary(
    typo: const Pretendard(),
    fontColor: color.text,
  );

  @override
  late AppTypoSecondary typoSecondary = AppTypoSecondary(
    typo: const BlackHanSans(),
    fontColor: color.text,
  );

  @override
  late AppTypoTertiary typoTertiary = AppTypoTertiary(
    typo: const Rubik(),
    fontColor: color.text,
  );

  @override
  late AppDeco deco = AppDeco(
    shadow: [
      BoxShadow(
        color: Palette.black.withOpacity(0.35),
        blurRadius: 35,
      ),
    ],
    highlight: [
      BoxShadow(
        color: color.primary.withOpacity(0.5),
        blurRadius: 20.5,
      ),
    ],
    bgGradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Palette.darkBlack,
        Palette.lightBlack,
      ],
    ),
  );
}
