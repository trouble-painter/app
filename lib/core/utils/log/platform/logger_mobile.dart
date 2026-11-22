import 'dart:io';

import 'package:talker_flutter/talker_flutter.dart';
import 'package:trouble_painter/core/utils/log/platform/logger_platform.dart';

class LoggerMobile implements LoggerPlatform {
  late final Talker talker = TalkerFlutter.init(
    logger: TalkerLogger(
      settings: TalkerLoggerSettings(
        maxLineWidth: 80,
      ),
    ),
    settings: TalkerSettings(
      enabled: !Platform.environment.containsKey('FLUTTER_TEST'),
      useHistory: true,
      maxHistoryItems: 5000,
      useConsoleLogs: true,
      titles: {
        TalkerKey.debug: "debug",
        TalkerKey.info: "info",
        TalkerKey.verbose: "verb",
        TalkerKey.warning: "warning",
        TalkerKey.error: "error",
      },
      colors: {
        TalkerKey.debug: AnsiPen()..white(),
        TalkerKey.info: AnsiPen()..yellow(),
        TalkerKey.verbose: AnsiPen()..blue(),
        TalkerKey.warning: AnsiPen()..magenta(),
        TalkerKey.error: AnsiPen()..red(),
      },
    ),
  );

  @override
  void d(msg, [Object? error, StackTrace? stackTrace]) {
    talker.debug(msg, error, stackTrace);
  }

  @override
  void v(msg, [Object? error, StackTrace? stackTrace]) {
    talker.verbose(msg, error, stackTrace);
  }

  @override
  void e(msg, [Object? error, StackTrace? stackTrace]) {
    talker.error(msg, error, stackTrace);
  }

  @override
  void i(msg, [Object? error, StackTrace? stackTrace]) {
    talker.info(msg, error, stackTrace);
  }

  @override
  void w(msg, [Object? error, StackTrace? stackTrace]) {
    talker.warning(msg, error, stackTrace);
  }
}
