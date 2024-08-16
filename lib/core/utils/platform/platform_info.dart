import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';

class PlatformInfo {
  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;
  static bool get isWeb => kIsWeb;

  static final $ = AutoDisposeProvider<PlatformInfo>((ref) {
    return PlatformInfo();
  });

  /// Platform language
  Language get language {
    final defaultLangCode = locale.languageCode.toLowerCase();
    for (final language in Language.values) {
      if (defaultLangCode == language.locale.languageCode.toLowerCase()) {
        return language;
      }
    }
    return Language.defaultLanguage;
  }

  /// Platform local
  Locale get locale {
    try {
      // - a language (e.g., "en"), or
      // - a language and country code (e.g. "en_US", "de_AT"), or
      // - a language, country code and character set (e.g. "en_US.UTF-8").
      final systemLocale = Platform.localeName;
      final regex = RegExp(r"([^_^.]*)(?:_([^_^.]*))?(?:.([^_^.]*))?");
      final match = regex.firstMatch(systemLocale);
      final languageCode = match!.group(1)!;
      final countryCode = match.group(2);
      return Locale(languageCode, countryCode);
    } catch (e) {
      return Language.english.locale;
    }
  }
}
