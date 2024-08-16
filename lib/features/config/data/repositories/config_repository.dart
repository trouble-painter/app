import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/data/sources/package_info_source.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/config/data/repositories/config_repository_impl.dart';
import 'package:x_pr/features/config/data/sources/local_shared_prefs_config_source.dart';
import 'package:x_pr/features/config/data/sources/remote_config_source.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';

abstract interface class ConfigRepository {
  static final $ = AutoDisposeProvider<ConfigRepository>((ref) {
    return ConfigRepositoryImpl(
      localSharedPrefsConfigSource: ref.read(LocalSharedPrefsConfigSource.$),
      remoteConfigSource: ref.read(RemoteConfigSource.$),
      packageInfoSource: ref.read(PackageInfoSource.$),
    );
  });
  const ConfigRepository();

  Future<Config> init({
    required bool defaultisLightTheme,
    required Language defaultLanguage,
  });

  Future<Config> changeLanguage(Language language);

  Future<Result<Config>> save(Config config);

  Future<Result> clearLocalStorage();

  Stream<Config> onUpdated();
}
