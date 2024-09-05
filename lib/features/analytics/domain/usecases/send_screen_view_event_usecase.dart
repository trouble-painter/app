import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/analytics/data/repositories/event_analytics_repository.dart';
import 'package:x_pr/features/analytics/domain/entities/app_event/app_event.dart';

class SendScreenViewEventUsecase
    implements BaseUsecase<AppEventScreen, Future<void>> {
  static final $ = AutoDisposeProvider<SendScreenViewEventUsecase>((ref) {
    return SendScreenViewEventUsecase(
      eventAnalyticsRepository: ref.read(EventAnalyticsRepository.$),
    );
  });

  SendScreenViewEventUsecase({
    required this.eventAnalyticsRepository,
  });

  final EventAnalyticsRepository eventAnalyticsRepository;

  @override
  Future<void> call(AppEventScreen screen) {
    return eventAnalyticsRepository.logScreenViewEvent(screen);
  }
}
