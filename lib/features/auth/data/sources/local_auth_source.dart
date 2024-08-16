import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:x_pr/core/data/sources/secure_storage_source.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/auth/domain/entities/auth_state.dart';

class LocalAuthSource {
  static final $ = AutoDisposeProvider<LocalAuthSource>((ref) {
    return LocalAuthSource(
      secureStorage: ref.read(SecureStorageSource.$),
    );
  });

  final String _key = "authState";
  final FlutterSecureStorage secureStorage;
  const LocalAuthSource({required this.secureStorage});

  Future<AuthState?> read() async {
    try {
      final json = await secureStorage.read(key: _key);
      if (json == null) return null;
      return AuthState.fromJson(jsonDecode(json));
    } catch (e, s) {
      Logger.e("Failed to read", e, s);
      return null;
    }
  }

  Future<Result<AuthState>> write(AuthState authState) async {
    try {
      await secureStorage.write(
        key: _key,
        value: jsonEncode(authState.toJson()),
      );
      return Success(authState);
    } catch (e, s) {
      Logger.e("Failed to write", e, s);
      return Failure(e);
    }
  }

  Future<Result<void>> delete() async {
    try {
      await secureStorage.delete(key: _key);
      return const Success(null);
    } catch (e, s) {
      Logger.e("Failed to delete", e, s);
      return Failure(e);
    }
  }
}
