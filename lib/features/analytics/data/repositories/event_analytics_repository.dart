import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/features/analytics/data/repositories/event_analytics_repository_with_firebase.dart';
import 'package:x_pr/features/analytics/data/sources/firebase_analytics_event_source.dart';
import 'package:x_pr/features/analytics/domain/entities/app_event/app_event.dart';

abstract interface class EventAnalyticsRepository {
  static final $ = AutoDisposeProvider<EventAnalyticsRepository>((ref) {
    return EventAnalyticsRepositoryWithFirebase(
      eventSource: ref.read(FirebaseAnalyticsEventSource.$),
    );
  });

  Future<void> logEvent(AppEvent event);

  Future<void> logScreenViewEvent(AppEventScreen screen);
}
