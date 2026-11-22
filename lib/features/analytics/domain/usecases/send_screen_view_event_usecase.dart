import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/usecases/base_usecase.dart';
import 'package:trouble_painter/features/analytics/data/repositories/event_analytics_repository.dart';
import 'package:trouble_painter/features/analytics/domain/entities/app_event/app_event.dart';

class SendScreenViewEventUsecase
    implements BaseUsecase<AppEventScreen, Future<void>> {
  static final $ = Provider.autoDispose<SendScreenViewEventUsecase>((ref) {
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
