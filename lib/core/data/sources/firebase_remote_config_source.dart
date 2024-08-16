import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class FirebaseRemoteConfigSource {
  static final $ = AutoDisposeProvider<FirebaseRemoteConfig>((ref) {
    return FirebaseRemoteConfig.instance;
  });
}
