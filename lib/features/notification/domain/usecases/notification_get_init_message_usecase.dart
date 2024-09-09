import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/notification/data/repositories/notification_repository.dart';

class NotificationGetInitMessageParam {
  NotificationGetInitMessageParam();
}

class NotificationGetInitMessageUsecase
    implements
        BaseUsecase<NotificationGetInitMessageParam, Future<RemoteMessage?>> {
  static final $ =
      AutoDisposeProvider<NotificationGetInitMessageUsecase>((ref) {
    return NotificationGetInitMessageUsecase(
      notificationRepository: ref.read(NotificationRepository.$),
    );
  });

  NotificationGetInitMessageUsecase({
    required this.notificationRepository,
  });

  final NotificationRepository notificationRepository;

  @override
  Future<RemoteMessage?> call([NotificationGetInitMessageParam? param]) async {
    return FirebaseMessaging.instance.getInitialMessage();
  }
}
