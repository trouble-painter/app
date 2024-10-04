part of 'app_theme.dart';

class AppTypoPrimary {
  AppTypoPrimary({
    required this.typo,
    required this.fontColor,
  });

  /// Typo
  final TypoPrimary typo;

  /// Font Weight
  late FontWeight light = typo.bold;
  late FontWeight regular = typo.regular;
  late FontWeight bold = typo.semiBold;

  /// Font Color
  final Color fontColor;

  /// Header
  late final TextStyle header0 = TextStyle(
    height: 1.4,
    fontSize: 32,
    fontWeight: typo.bold,
    fontFamily: typo.name,
    color: fontColor,
  );
  late final TextStyle header1 = TextStyle(
    height: 1.4,
    fontSize: 24,
    fontWeight: typo.bold,
    fontFamily: typo.name,
    color: fontColor,
  );
  late final TextStyle header2 = TextStyle(
    height: 1.4,
    fontSize: 20,
    fontWeight: typo.bold,
    fontFamily: typo.name,
    color: fontColor,
  );
  late final TextStyle header3 = TextStyle(
    height: 1.4,
    fontSize: 18,
    fontWeight: typo.bold,
    fontFamily: typo.name,
    color: fontColor,
  );

  /// Sub Header
  late final TextStyle subHeader0 = TextStyle(
    height: 1.4,
    fontSize: 18,
    fontWeight: typo.semiBold,
    fontFamily: typo.name,
    color: fontColor,
  );
  late final TextStyle subHeader1 = TextStyle(
    height: 1.4,
    fontSize: 16,
    fontWeight: typo.semiBold,
    fontFamily: typo.name,
    color: fontColor,
  );
  late final TextStyle subHeader2 = TextStyle(
    height: 1.4,
    fontSize: 14,
    fontWeight: typo.semiBold,
    fontFamily: typo.name,
    color: fontColor,
  );

  /// Body
  late final TextStyle body0 = TextStyle(
    height: 1.5,
    fontSize: 18,
    fontWeight: typo.regular,
    fontFamily: typo.name,
    color: fontColor,
  );
  late final TextStyle body1 = TextStyle(
    height: 1.5,
    fontSize: 16,
    fontWeight: typo.regular,
    fontFamily: typo.name,
    color: fontColor,
  );
  late final TextStyle body2 = TextStyle(
    height: 1.5,
    fontSize: 14,
    fontWeight: typo.regular,
    fontFamily: typo.name,
    color: fontColor,
  );

  /// Caption
  late final TextStyle caption0 = TextStyle(
    height: 1.5,
    fontSize: 14,
    fontWeight: typo.bold,
    fontFamily: typo.name,
    color: fontColor,
  );
  late final TextStyle caption1 = TextStyle(
    height: 1.5,
    fontSize: 12,
    fontWeight: typo.semiBold,
    fontFamily: typo.name,
    color: fontColor,
  );
  late final TextStyle caption2 = TextStyle(
    height: 1.3,
    fontSize: 10,
    fontWeight: typo.semiBold,
    fontFamily: typo.name,
    color: fontColor,
  );
}
