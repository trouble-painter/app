import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:x_pr/core/data/sources/secure_storage_source.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/config/data/models/local_secure_storage_config.dart';

/// Remains even if you reinstall the app
class LocalSecureStorageConfigSource {
  static final $ = AutoDisposeProvider<LocalSecureStorageConfigSource>((ref) {
    return LocalSecureStorageConfigSource(
      secureStorage: ref.read(SecureStorageSource.$),
    );
  });

  final String _key = "config";
  final FlutterSecureStorage secureStorage;
  const LocalSecureStorageConfigSource({required this.secureStorage});

  Future<LocalSecureStorageConfig> read() async {
    try {
      final json = await secureStorage.read(key: _key);
      if (json == null) {
        return LocalSecureStorageConfig();
      } else {
        return LocalSecureStorageConfig.fromJson(jsonDecode(json));
      }
    } catch (e, s) {
      Logger.e('Failed to read', e, s);
      return LocalSecureStorageConfig();
    }
  }

  Future<bool> write(LocalSecureStorageConfig config) async {
    try {
      await secureStorage.write(key: _key, value: jsonEncode(config.toJson()));
      return true;
    } catch (e, s) {
      Logger.e('Failed to write', e, s);
      return false;
    }
  }

  Future<bool> deleteAll() async {
    try {
      await secureStorage.deleteAll();
      return true;
    } catch (e, s) {
      Logger.e('Failed to deleteAll', e, s);
      return false;
    }
  }
}
