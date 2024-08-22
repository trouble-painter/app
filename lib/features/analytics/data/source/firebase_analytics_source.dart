import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseAnalyticsSource {
  static final $ = AutoDisposeProvider<FirebaseAnalyticsSource>((ref) {
    return FirebaseAnalyticsSource();
  });

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getObserver() {
    return FirebaseAnalyticsObserver(
      analytics: _analytics,
    );
  }
}
