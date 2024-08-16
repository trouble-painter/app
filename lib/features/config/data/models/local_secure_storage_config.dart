import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_secure_storage_config.freezed.dart';
part 'local_secure_storage_config.g.dart';

@freezed
class LocalSecureStorageConfig with _$LocalSecureStorageConfig {
  factory LocalSecureStorageConfig() = _LocalSecureStorageConfig;

  factory LocalSecureStorageConfig.fromJson(Map<String, dynamic> json) =>
      _$LocalSecureStorageConfigFromJson(json);
}
