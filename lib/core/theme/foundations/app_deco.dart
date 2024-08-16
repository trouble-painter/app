part of 'app_theme.dart';

class AppDeco {
  AppDeco({
    required this.shadow,
    required this.highlight,
    required this.bgGradient,
  });

  /// Shadow
  final List<BoxShadow> shadow;

  /// Highlight
  final List<BoxShadow> highlight;

  /// Background gradient
  final Gradient bgGradient;
}
