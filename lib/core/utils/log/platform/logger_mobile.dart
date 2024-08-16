import 'dart:io';

import 'package:talker_flutter/talker_flutter.dart';
import 'package:x_pr/core/utils/log/platform/logger_platform.dart';

class LoggerMobile implements LoggerPlatform {
  late final Talker talker = TalkerFlutter.init(
    settings: TalkerSettings(
      enabled: !Platform.environment.containsKey('FLUTTER_TEST'),
      useHistory: true,
      maxHistoryItems: 500,
      useConsoleLogs: true,
      titles: {
        TalkerLogType.verbose: "State",
      },
    ),
  );

  @override
  void d(msg, [Object? error, StackTrace? stackTrace]) {
    talker.debug(msg, error, stackTrace);
  }

  @override
  void e(msg, [Object? error, StackTrace? stackTrace]) {
    talker.error(msg, error, stackTrace);
  }

  @override
  void i(msg, [Object? error, StackTrace? stackTrace]) {
    talker.verbose(msg, error, stackTrace);
  }

  @override
  void s(msg, [Object? error, StackTrace? stackTrace]) {
    talker.info(msg, error, stackTrace);
  }

  @override
  void w(msg, [Object? error, StackTrace? stackTrace]) {
    talker.warning(msg, error, stackTrace);
  }
}
