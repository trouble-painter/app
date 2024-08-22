import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/features/analytics/data/repository/event_analytics_repository_with_firebase.dart';

abstract interface class EventAnalyticsRepository {
  static final firebase = AutoDisposeProvider<EventAnalyticsRepository>((ref) {
    return EventAnalyticsRepositoryWithFirebase();
  });
}
