part of 'app_theme.dart';

class AppColor {
  const AppColor({
    required this.surface,
    required this.surfaceContainer,
    required this.dialogSurface,
    required this.background,
    required this.text,
    required this.subtext1,
    required this.subtext2,
    required this.subtext3,
    required this.subtext4,
    required this.subtext5,
    required this.hint,
    required this.hintContainer,
    required this.onHintContainer,
    required this.iconContainer,
    required this.toastContainer,
    required this.onToastContainer,
    required this.inactive,
    required this.inactiveContainer,
    required this.onInactiveContainer,
    required this.terrain,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.warning,
    required this.success,
    required this.info,
    required this.dialogColor,
    required this.inputColor,
  });

  /// Surface
  final Color surface;
  final Color surfaceContainer;
  final Color dialogSurface;
  final Color background;

  /// Toast
  final Color toastContainer;
  final Color onToastContainer;

  /// Text
  final Color text;
  final Color subtext1;
  final Color subtext2;
  final Color subtext3;
  final Color subtext4;
  final Color subtext5;

  /// Hint
  final Color hint;
  final Color hintContainer;
  final Color onHintContainer;

  /// Icon
  final Color iconContainer;

  /// Inactive
  final Color inactive;
  final Color inactiveContainer;
  final Color onInactiveContainer;

  /// Graphy
  final Color terrain;

  /// Primary
  final Color primary;
  final Color onPrimary;

  /// Secondary
  final Color secondary;
  final Color onSecondary;

  /// Semantic
  final Color warning;
  final Color success;
  final Color info;

  /// Dialog
  final DialogColor dialogColor;

  /// Input
  final InputColor inputColor;
}
