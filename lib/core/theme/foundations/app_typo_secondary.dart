part of 'app_theme.dart';

class AppTypoSecondary {
  AppTypoSecondary({
    required this.typo,
    required this.fontColor,
  });

  /// Typo
  final TypoSecondary typo;

  /// Font Weight
  late FontWeight regular = typo.regular;

  /// Font Color
  final Color fontColor;

  /// Header
  late final TextStyle header0 = TextStyle(
    height: 1.4,
    fontSize: 34,
    fontWeight: typo.regular,
    fontFamily: typo.name,
    color: fontColor,
  );
  late final TextStyle header1 = TextStyle(
    height: 1.4,
    fontSize: 28,
    fontWeight: typo.regular,
    fontFamily: typo.name,
    color: fontColor,
  );
  late final TextStyle header2 = TextStyle(
    height: 1.4,
    fontSize: 24,
    fontWeight: typo.regular,
    fontFamily: typo.name,
    color: fontColor,
  );
}