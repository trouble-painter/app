import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/usecases/base_usecase.dart';
import 'package:trouble_painter/features/notification/data/repositories/notification_repository.dart';

/// The device's FCM token now, then every new one
class NotificationPushTokenUsecase
    implements BaseUsecase<VoidParam, Stream<String>> {
  static final $ = Provider.autoDispose<NotificationPushTokenUsecase>((ref) {
    return NotificationPushTokenUsecase(
      notificationRepository: ref.read(NotificationRepository.$),
    );
  });

  NotificationPushTokenUsecase({
    required this.notificationRepository,
  });

  final NotificationRepository notificationRepository;

  @override
  Stream<String> call([VoidParam param]) async* {
    final token = await notificationRepository.getToken();
    if (token != null) yield token;
    yield* notificationRepository.onTokenRefresh;
  }
}
