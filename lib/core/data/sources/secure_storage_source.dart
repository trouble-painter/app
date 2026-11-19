import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageSource {
  static final $ = Provider.autoDispose<FlutterSecureStorage>((ref) {
    return const FlutterSecureStorage();
  });
}
