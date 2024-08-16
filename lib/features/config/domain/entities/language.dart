import 'package:flutter/material.dart';

enum Language {
  korean(
    Locale(
      "ko",
      "KR",
    ),
    "한국어",
    "Korean",
    TextDirection.ltr,
  ),
  english(
    Locale(
      "en",
      "US",
    ),
    "English",
    "English",
    TextDirection.ltr,
  );

  const Language(
    this.locale,
    this.nativeName,
    this.englishName,
    this.textDirection,
  );

  /// Material locale
  final Locale locale;

  /// Language native name
  final String nativeName;

  /// Language english name
  final String englishName;

  /// Text direction
  final TextDirection textDirection;

  /// Default language
  static const defaultLanguage = Language.english;

  bool get isKorean => this == korean;

  String toJson() => locale.toString();

  factory Language.fromJson(dynamic v) {
    for (final language in values) {
      if ("$v".toLowerCase() == "${language.locale}".toLowerCase()) {
        return language;
      }
    }
    return defaultLanguage;
  }
}
