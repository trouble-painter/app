import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/data/sources/firebase_analytics_source.dart';
import 'package:x_pr/core/utils/env/constant.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/analytics/data/models/firebase_analytice_event.dart';
import 'package:x_pr/features/analytics/data/models/firebase_analytics_screen.dart';

class FirebaseAnalyticsEventSource {
  static final $ = AutoDisposeProvider<FirebaseAnalyticsEventSource>((ref) {
    return FirebaseAnalyticsEventSource(
      analytics: ref.read(FirebaseAnalyticsSource.$),
    );
  });

  FirebaseAnalyticsEventSource({
    required FirebaseAnalytics analytics,
  }) : _analytics = analytics;
  final FirebaseAnalytics _analytics;

  void _log(String message, [bool isShowLog = true]) {
    if (!isShowLog) return;
    Logger.v("${Constant.eData} $message");
  }

  Future<void> logScreenView(FirebaseAnalyticsScreen screen) {
    _log("logScreenView : $screen");
    return _analytics.logScreenView(screenName: screen.name);
  }

  Future<void> logEvent(FirebaseAnalyticsEvent event) {
    final (name, parameters) = (event.name, event.parameters);
    _log("logEvent\n- name : $name\n- parameters : $parameters");
    return _analytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }
}
