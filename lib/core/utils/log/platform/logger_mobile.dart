import 'dart:io';

import 'package:talker_flutter/talker_flutter.dart';
import 'package:x_pr/core/utils/log/platform/logger_platform.dart';

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
      maxHistoryItems: 500,
      useConsoleLogs: true,
      titles: {
        TalkerLogType.debug: "debug",
        TalkerLogType.info: "info",
        TalkerLogType.verbose: "verb",
        TalkerLogType.warning: "warning",
        TalkerLogType.error: "error",
      },
      colors: {
        TalkerLogType.debug: AnsiPen()..white(),
        TalkerLogType.info: AnsiPen()..yellow(),
        TalkerLogType.verbose: AnsiPen()..blue(),
        TalkerLogType.warning: AnsiPen()..magenta(),
        TalkerLogType.error: AnsiPen()..red(),
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
