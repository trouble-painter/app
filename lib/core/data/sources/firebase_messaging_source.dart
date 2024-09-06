import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseMessagingSource {
  static final $ = AutoDisposeProvider<FirebaseMessaging>((ref) {
    return FirebaseMessaging.instance;
  });
}
