import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/theme/res/palette.dart';

/// Palette key the server assigns to each player. The app owns the actual colors.
enum PlayerColor {
  red(Palette.drawingRed, Palette.hatRed),
  orange(Palette.drawingOrange, Palette.hatOrange),
  yellow(Palette.drawingYellow, Palette.hatYello),
  lightGreen(Palette.drawingLightGreen, Palette.hatLightGreen),
  green(Palette.drawingGreen, Palette.hatGreen),
  lightBlue(Palette.drawingLightBlue, Palette.hatLightBlue),
  blue(Palette.drawingBlue, Palette.hatBlue),
  purple(Palette.drawingPurple, Palette.hatPurple),
  pink(Palette.drawingPink, Palette.hatPink),
  gray(Palette.drawingGray, Palette.hatGray);

  const PlayerColor(this.drawing, this.hat);

  final Color drawing;
  final Color hat;
}
