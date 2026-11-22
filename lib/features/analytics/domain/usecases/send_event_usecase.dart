import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/usecases/base_usecase.dart';
import 'package:trouble_painter/features/analytics/data/repositories/event_analytics_repository.dart';
import 'package:trouble_painter/features/analytics/domain/entities/app_event/app_event.dart';

class SendEventUsecase implements BaseUsecase<AppEvent, Future<void>> {
  static final $ = Provider.autoDispose<SendEventUsecase>((ref) {
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
