import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/domain/usecases/base_usecase.dart';
import 'package:trouble_painter/features/notification/data/repositories/notification_repository.dart';

class NotificationOnBgMessageParam {
  void Function(RemoteMessage message) callback;
  NotificationOnBgMessageParam(this.callback);
}

class NotificationOnBgMessageUsecase
    implements
        BaseUsecase<NotificationOnBgMessageParam, Future<StreamSubscription>> {
  static final $ = Provider.autoDispose<NotificationOnBgMessageUsecase>((ref) {
    return NotificationOnBgMessageUsecase(
      notificationRepository: ref.read(NotificationRepository.$),
    );
  });

  NotificationOnBgMessageUsecase({
    required this.notificationRepository,
  });

  final NotificationRepository notificationRepository;

  @override
  Future<StreamSubscription> call(NotificationOnBgMessageParam param) async {
    return FirebaseMessaging.onMessageOpenedApp.listen(param.callback);
  }
}
