import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/data/sources/firebase_analytics_source.dart';

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
    return _analytics.logScreenView(screenName: screenName);
  }

  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
    AnalyticsCallOptions? callOptions,
  }) {
    return _analytics.logEvent(
      name: name,
      parameters: parameters,
      callOptions: callOptions,
    );
  }
}
