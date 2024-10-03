part of 'app_theme.dart';

class AppTypoTertiary {
  AppTypoTertiary({
    required this.typo,
    required this.fontColor,
  });

  /// Typo
  final TypoTertiary typo;

  /// Font Weight
  late FontWeight medium = typo.medium;

  /// Font Color
  final Color fontColor;

  /// Header
  late final TextStyle header0 = TextStyle(
    height: 1.4,
    fontSize: 34,
    fontWeight: typo.medium,
    fontFamily: typo.name,
    color: fontColor,
  );
}
