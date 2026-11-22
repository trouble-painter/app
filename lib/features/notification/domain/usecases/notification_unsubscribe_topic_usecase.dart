import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/usecases/base_usecase.dart';
import 'package:trouble_painter/features/notification/data/repositories/notification_repository.dart';
import 'package:trouble_painter/features/notification/domain/entities/notification_topic.dart';

class NotificationUnsubscribeTopicUsecaseUsecase
    implements BaseUsecase<NotificationTopic, Future<bool>> {
  static final $ =
      Provider.autoDispose<NotificationUnsubscribeTopicUsecaseUsecase>((ref) {
    return NotificationUnsubscribeTopicUsecaseUsecase(
      notificationRepository: ref.read(NotificationRepository.$),
    );
  });

  NotificationUnsubscribeTopicUsecaseUsecase({
    required this.notificationRepository,
  });
  final NotificationRepository notificationRepository;

  @override
  Future<bool> call(NotificationTopic topic) {
    return notificationRepository.unsubscribeToTopic(topic);
  }
}
