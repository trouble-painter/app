import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class FirebaseRemoteConfigSource {
  static final $ = Provider.autoDispose<FirebaseRemoteConfig>((ref) {
    return FirebaseRemoteConfig.instance;
  });
}
