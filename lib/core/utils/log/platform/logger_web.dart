import 'dart:developer';

import 'package:x_pr/core/utils/log/platform/logger_platform.dart';

class LoggerWeb implements LoggerPlatform {
  @override
  void d(msg, [Object? error, StackTrace? stackTrace]) {
    log('[debug] $msg', error: error, stackTrace: stackTrace);
  }

  @override
  void e(msg, [Object? error, StackTrace? stackTrace]) {
    log('[error] $msg', error: error, stackTrace: stackTrace);
  }

  @override
  void i(msg, [Object? error, StackTrace? stackTrace]) {
    log('[verbose] $msg', error: error, stackTrace: stackTrace);
  }

  @override
  void s(msg, [Object? error, StackTrace? stackTrace]) {
    log('[info] $msg', error: error, stackTrace: stackTrace);
  }

  @override
  void w(msg, [Object? error, StackTrace? stackTrace]) {
    log('[warning] $msg', error: error, stackTrace: stackTrace);
  }
}
