import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:trouble_painter/core/utils/log/logger.dart';
import 'package:trouble_painter/features/notification/data/repositories/notification_repository.dart';
import 'package:trouble_painter/features/notification/domain/entities/notification_topic.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  NotificationRepositoryImpl({
    required this.firebaseMessaging,
  });

  final FirebaseMessaging firebaseMessaging;

  @override
  Future<String?> getToken({String? vapidKey}) {
    // register()/onRegistered return an installation ID (FID), not the FCM
    // registration token, so they are not a drop-in replacement.
    // ignore: deprecated_member_use
    return firebaseMessaging.getToken(vapidKey: vapidKey);
  }

  @override
  Future<bool> subscribeToTopic(NotificationTopic topic) async {
    try {
      await firebaseMessaging.subscribeToTopic(topic.topic);
      return true;
    } catch (e, s) {
      Logger.e('Failed to subscribeToTopic', e, s);
      return false;
    }
  }

  @override
  Future<bool> unsubscribeToTopic(NotificationTopic topic) async {
    try {
      await firebaseMessaging.unsubscribeFromTopic(topic.topic);
      return true;
    } catch (e, s) {
      Logger.e('Failed to unsubscribeToTopic', e, s);
      return false;
    }
  }

  @override
  Future<NotificationSettings> requestPermission({
    bool alert = true,
    bool announcement = false,
    bool badge = true,
    bool carPlay = false,
    bool criticalAlert = false,
    bool provisional = false,
    bool sound = true,
  }) async {
    return firebaseMessaging.requestPermission(
      alert: alert,
      announcement: announcement,
      badge: badge,
      carPlay: carPlay,
      criticalAlert: criticalAlert,
      provisional: provisional,
      sound: sound,
    );
  }
}
