import 'package:device_preview/device_preview.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:x_pr/app/app.dart';
import 'package:x_pr/core/data/sources/package_info_source.dart';
import 'package:x_pr/core/data/sources/shared_prefs_source.dart';
import 'package:x_pr/core/utils/log/riverpod_logger.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';

void main() async {
  timeDilation = 1.0;
  WidgetsFlutterBinding.ensureInitialized();

  /// Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  /// Sync network time protocol
  await NetworkTime.init();

  /// SharedPreferences
  final sharedPrefs = await SharedPreferences.getInstance();

  /// PackageInfo
  final packageInfoSource = PackageInfoSource(
    packageInfo: await PackageInfo.fromPlatform(),
  );

  runApp(
    ProviderScope(
      observers: [
        RiverpodLogger(enabled: true),
      ],
      overrides: [
        SharedPrefsSource.$.overrideWithValue(sharedPrefs),
        PackageInfoSource.$.overrideWithValue(packageInfoSource),
      ],
      child: DevicePreview(
        enabled: false,
        builder: (context) => const App(),
      ),
    ),
  );
}
