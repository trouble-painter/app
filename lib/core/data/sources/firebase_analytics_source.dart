import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseAnalyticsSource {
  static final $ = Provider.autoDispose<FirebaseAnalytics>((ref) {
    return FirebaseAnalytics.instance;
  });
}
