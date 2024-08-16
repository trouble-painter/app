import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:x_pr/core/data/sources/shared_prefs_source.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/config/data/models/local_shared_prefs_config.dart';

class LocalSharedPrefsConfigSource {
  static final $ = AutoDisposeProvider<LocalSharedPrefsConfigSource>((ref) {
    return LocalSharedPrefsConfigSource(
      sharedPrefs: ref.read(SharedPrefsSource.$),
    );
  });

  final String _key = "config";
  final SharedPreferences sharedPrefs;
  const LocalSharedPrefsConfigSource({
    required this.sharedPrefs,
  });

  LocalSharedPrefsConfig get() {
    try {
      final json = sharedPrefs.getString(_key);
      return json == null
          ? LocalSharedPrefsConfig.init()
          : LocalSharedPrefsConfig.fromJson(jsonDecode(json));
    } catch (e, s) {
      Logger.e("Failed to read", e, s);
      return LocalSharedPrefsConfig.init();
    }
  }

  Future<bool> write(LocalSharedPrefsConfig config) async {
    try {
      return await sharedPrefs.setString(
        _key,
        jsonEncode(config.toJson()),
      );
    } catch (e, s) {
      Logger.e('Failed to write', e, s);
      return false;
    }
  }

  Future<bool> remove() async {
    try {
      return await sharedPrefs.remove(_key);
    } catch (e, s) {
      Logger.e('Failed to remote $_key', e, s);
      return false;
    }
  }
}
