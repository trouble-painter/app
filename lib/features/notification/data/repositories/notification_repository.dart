import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/data/sources/firebase_messaging_source.dart';
import 'package:x_pr/features/notification/data/repositories/notification_repository_impl.dart';
import 'package:x_pr/features/notification/domain/entities/notification_topic.dart';

abstract interface class NotificationRepository {
  static final $ = AutoDisposeProvider<NotificationRepository>((ref) {
    return NotificationRepositoryImpl(
      firebaseMessaging: ref.read(FirebaseMessagingSource.$),
    );
  });

  /// https://firebase.flutter.dev/docs/messaging/permissions/
  /// - alert : Sets whether notifications can be displayed to the user on the device.
  /// - announcement : If enabled, Siri will read the notification content out when devices are connected to AirPods.
  /// - badge : Sets whether a notification dot will appear next to the app icon on the device when there are unread notifications.
  /// - carPlay : Sets whether notifications will appear when the device is connected to CarPlay.
  /// - provisional : Sets whether provisional permissions are granted. See Provisional authorization for more information.
  /// - sound : Sets whether a sound will be played when a notification is displayed on the device.
  Future<NotificationSettings> requestPermission({
    bool alert = true,
    bool announcement = false,
    bool badge = true,
    bool carPlay = false,
    bool criticalAlert = false,
    bool provisional = false,
    bool sound = true,
  });

  /// Returns the default FCM token for this device.
  /// On web, a [vapidKey] is required.
  Future<String?> getToken({String? vapidKey});

  Future<bool> subscribeToTopic(NotificationTopic topic);

  Future<bool> unsubscribeToTopic(NotificationTopic topic);
}
