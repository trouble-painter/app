import 'package:x_pr/features/analytics/data/models/firebase_analytice_event.dart';
import 'package:x_pr/features/analytics/data/models/firebase_analytics_screen.dart';
import 'package:x_pr/features/analytics/data/repositories/event_analytics_repository.dart';
import 'package:x_pr/features/analytics/data/sources/firebase_analytics_event_source.dart';
import 'package:x_pr/features/analytics/domain/entities/app_event/app_event.dart';

class EventAnalyticsRepositoryWithFirebase implements EventAnalyticsRepository {
  EventAnalyticsRepositoryWithFirebase({
    required FirebaseAnalyticsEventSource eventSource,
  }) : _eventSource = eventSource;
  final FirebaseAnalyticsEventSource _eventSource;

  @override
  Future<void> logEvent(AppEvent event) {
    final firebaseAnalyticsEvent = FirebaseAnalyticsEvent.fromAppEvent(event);
    return _eventSource.logEvent(firebaseAnalyticsEvent);
  }

  @override
  Future<void> logScreenViewEvent(AppEventScreen screen) {
    final firebaseScreen = FirebaseAnalyticsScreen.fromAppEventScreen(screen);
    return _eventSource.logScreenView(firebaseScreen);
  }
}
