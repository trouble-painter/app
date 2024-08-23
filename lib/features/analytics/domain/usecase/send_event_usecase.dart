import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/analytics/data/repository/event_analytics_repository.dart';
import 'package:x_pr/features/analytics/domain/entity/app_event/app_event.dart';

class SendEventUsecase implements BaseUsecase<AppEvent, Future<void>> {
  static final $ = AutoDisposeProvider<SendEventUsecase>((ref) {
    return SendEventUsecase(
      eventAnalyticsRepository: ref.read(EventAnalyticsRepository.$),
    );
  });

  SendEventUsecase({
    required this.eventAnalyticsRepository,
  });

  final EventAnalyticsRepository eventAnalyticsRepository;

  @override
  Future<void> call(AppEvent event) {
    return eventAnalyticsRepository.logEvent(event);
  }
}
