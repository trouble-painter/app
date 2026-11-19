import 'dart:async';

import 'package:trouble_painter/core/utils/log/logger.dart';

/// Runs before every test file.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  /// Logger.e records to Crashlytics, which needs Firebase.
  Logger.isEnabled = false;
  await testMain();
}
