import 'package:flutter/foundation.dart';
import 'package:x_pr/core/utils/log/platform/logger_mobile.dart';
import 'package:x_pr/core/utils/log/platform/logger_platform.dart';
import 'package:x_pr/core/utils/log/platform/logger_web.dart';
import 'package:x_pr/core/utils/platform/platform_info.dart';

abstract class Logger {
  static final LoggerPlatform loggerPlatform =
      PlatformInfo.isWeb ? LoggerWeb() : LoggerMobile();
  static bool isEnabled = kDebugMode;

  /// Log debug
  static void d(dynamic msg, [Object? error, StackTrace? stackTrace]) {
    if (!isEnabled) return;
    loggerPlatform.d(msg, error, stackTrace);
  }

  /// Log error
  static void e(dynamic msg, [Object? error, StackTrace? stackTrace]) {
    if (!isEnabled) return;
    loggerPlatform.e(msg, error, stackTrace);
  }

  /// Log warning
  static void w(dynamic msg, [Object? error, StackTrace? stackTrace]) {
    if (!isEnabled) return;
    loggerPlatform.w(msg, error, stackTrace);
  }

  /// Log info
  static void i(dynamic msg, [Object? error, StackTrace? stackTrace]) {
    if (!isEnabled) return;
    loggerPlatform.i(msg, error, stackTrace);
  }

  /// Log state
  static void s(dynamic msg, [Object? error, StackTrace? stackTrace]) {
    if (!isEnabled) return;
    loggerPlatform.s(msg, error, stackTrace);
  }
}
