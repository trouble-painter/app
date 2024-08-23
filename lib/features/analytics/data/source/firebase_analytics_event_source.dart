import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/data/sources/firebase_analytics_source.dart';
import 'package:x_pr/core/utils/env/constant.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/analytics/data/model/firebase_analytice_event.dart';

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

  Future<void> logScreenView(String screenName) {
    Logger.d("${Constant.emojiData} logScreenView : $screenName");
    return _analytics.logScreenView(screenName: screenName);
  }

  Future<void> logEvent(FirebaseAnalyticsEvent event) {
    Logger.d("${Constant.emojiData} logEvent : $event");
    return _analytics.logEvent(
      name: event.name,
      parameters: event.parameters,
    );
  }
}
