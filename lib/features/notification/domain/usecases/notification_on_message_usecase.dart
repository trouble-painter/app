import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/usecases/base_usecase.dart';
import 'package:trouble_painter/core/utils/platform/platform_info.dart';
import 'package:trouble_painter/features/notification/data/repositories/notification_repository.dart';

class NotificationOnMessageParam {
  void Function(RemoteMessage message) callback;
  NotificationOnMessageParam(this.callback);
}

class NotificationOnMessageUsecase
    implements
        BaseUsecase<NotificationOnMessageParam, Future<StreamSubscription>> {
  static final $ = Provider.autoDispose<NotificationOnMessageUsecase>((ref) {
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
    /// iOS foreground notification option.
    /// Nothing is shown or played while the app is open: the game-start push is for the background only.
    if (PlatformInfo.isIOS) {
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: false,
        badge: false,
        sound: false,
      );
    }
    return FirebaseMessaging.onMessage.listen(param.callback);
  }
}
