import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/notification/data/repositories/notification_repository.dart';

class NotificationRequestPermissionParam {
  final bool alert;
  final bool announcement;
  final bool badge;
  final bool carPlay;
  final bool criticalAlert;
  final bool provisional;
  final bool sound;

  const NotificationRequestPermissionParam({
    this.alert = true,
    this.announcement = false,
    this.badge = true,
    this.carPlay = false,
    this.criticalAlert = false,
    this.provisional = false,
    this.sound = true,
  });
}

class NotificationRequestPermissionUsecase
    implements
        BaseUsecase<NotificationRequestPermissionParam,
            Future<AuthorizationStatus>> {
  static final $ =
      AutoDisposeProvider<NotificationRequestPermissionUsecase>((ref) {
    return NotificationRequestPermissionUsecase(
      notificationRepository: ref.read(NotificationRepository.$),
    );
  });

  NotificationRequestPermissionUsecase({
    required this.notificationRepository,
  });

  final NotificationRepository notificationRepository;

  @override
  Future<AuthorizationStatus> call([
    NotificationRequestPermissionParam param =
        const NotificationRequestPermissionParam(),
  ]) async {
    final notificationSettings = await notificationRepository.requestPermission(
      alert: param.alert,
      announcement: param.announcement,
      badge: param.badge,
      carPlay: param.carPlay,
      criticalAlert: param.criticalAlert,
      provisional: param.provisional,
      sound: param.sound,
    );
    return notificationSettings.authorizationStatus;
  }
}
