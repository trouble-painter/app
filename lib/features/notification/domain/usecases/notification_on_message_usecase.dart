import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/core/utils/platform/platform_info.dart';
import 'package:x_pr/features/notification/data/repositories/notification_repository.dart';

class NotificationOnMessageParam {
  void Function(RemoteMessage message) callback;
  NotificationOnMessageParam(this.callback);
}

class NotificationOnMessageUsecase
    implements
        BaseUsecase<NotificationOnMessageParam, Future<StreamSubscription>> {
  static final $ = AutoDisposeProvider<NotificationOnMessageUsecase>((ref) {
    return NotificationOnMessageUsecase(
      notificationRepository: ref.read(NotificationRepository.$),
    );
  });

  NotificationOnMessageUsecase({
    required this.notificationRepository,
  });

  final NotificationRepository notificationRepository;

  @override
  Future<StreamSubscription> call(NotificationOnMessageParam param) async {
    /// iOS foreground notification option
    if (PlatformInfo.isIOS) {
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: false,
        badge: false,
        sound: true,
      );
    }
    return FirebaseMessaging.onMessage.listen(param.callback);
  }
}
