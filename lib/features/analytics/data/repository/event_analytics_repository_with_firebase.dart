import 'package:x_pr/features/analytics/data/model/firebase_analytice_event.dart';
import 'package:x_pr/features/analytics/data/repository/event_analytics_repository.dart';
import 'package:x_pr/features/analytics/data/source/firebase_analytics_event_source.dart';
import 'package:x_pr/features/analytics/domain/entity/app_event/app_event.dart';

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
}
