import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/usecases/base_usecase.dart';
import 'package:trouble_painter/features/notification/data/repositories/notification_repository.dart';

class NotificationGetInitMessageParam {
  NotificationGetInitMessageParam();
}

class NotificationGetInitMessageUsecase
    implements
        BaseUsecase<NotificationGetInitMessageParam, Future<RemoteMessage?>> {
  static final $ =
      Provider.autoDispose<NotificationGetInitMessageUsecase>((ref) {
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
