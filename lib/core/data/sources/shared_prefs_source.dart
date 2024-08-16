import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefsSource {
  static final $ = AutoDisposeProvider<SharedPreferences>((ref) {
    throw Exception('Will be overrided in main.dart');
  });
}
