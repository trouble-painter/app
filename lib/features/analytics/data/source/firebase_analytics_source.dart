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

  void screenView() async {
    await _analytics.logEvent(
      name: 'screen_view',
      parameters: {
        // 'firebase_screen': screenName,
        // 'firebase_screen_class': screenClass,
      },
    );
  }
}
