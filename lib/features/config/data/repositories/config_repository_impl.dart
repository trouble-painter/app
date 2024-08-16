import 'dart:async';

import 'package:uuid/uuid.dart';
import 'package:x_pr/core/data/sources/package_info_source.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/config/data/models/local_shared_prefs_config.dart';
import 'package:x_pr/features/config/data/models/remote_config/remote_config.dart';
import 'package:x_pr/features/config/data/repositories/config_repository.dart';
import 'package:x_pr/features/config/data/sources/local_shared_prefs_config_source.dart';
import 'package:x_pr/features/config/data/sources/remote_config_source.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';

class ConfigRepositoryImpl implements ConfigRepository {
  final LocalSharedPrefsConfigSource localSharedPrefsConfigSource;
  final RemoteConfigSource remoteConfigSource;
  final PackageInfoSource packageInfoSource;

  const ConfigRepositoryImpl({
    required this.localSharedPrefsConfigSource,
    required this.remoteConfigSource,
    required this.packageInfoSource,
  });

  @override
  Future<Config> init({
    required bool defaultisLightTheme,
    required Language defaultLanguage,
  }) async {
    await remoteConfigSource.init();
    return _get(
      defaultIsLightTheme: defaultisLightTheme,
      defaultLanguage: defaultLanguage,
    );
  }

  @override
  Future<Config> changeLanguage(Language language) async {
    final config = _get(baseLanguage: language);
    await save(config);
    return config;
  }

  @override
  Future<Result<Config>> save(Config config) async {
    final isSuccessList = await Future.wait([
      localSharedPrefsConfigSource.write(
        LocalSharedPrefsConfig.fromConfig(config),
      ),
    ]);
    return !isSuccessList.contains(false) ? Success(config) : const Failure();
  }

  @override
  Future<Result<void>> clearLocalStorage() async {
    final results = await Future.wait([
      localSharedPrefsConfigSource.remove(),
    ]);
    return !results.contains(false) ? const Success(null) : const Failure();
  }

  @override
  Stream<Config> onUpdated() {
    return remoteConfigSource.onUpdate().transform(
      StreamTransformer.fromHandlers(
        handleData: (remoteConfig, sink) async {
          sink.add(_get(baseRemoteConfig: remoteConfig));
        },
      ),
    );
  }

  Config _get({
    RemoteConfig? baseRemoteConfig,
    Language? baseLanguage,
    Language? defaultLanguage,
    bool? defaultIsLightTheme,
  }) {
    final localSharedConfig = localSharedPrefsConfigSource.get();
    final remoteConfig = baseRemoteConfig ?? remoteConfigSource.get();
    final language = baseLanguage ??
        localSharedConfig.language ??
        defaultLanguage ??
        Language.korean;
    final isLightTheme =
        localSharedConfig.isLightTheme ?? defaultIsLightTheme ?? false;
    return Config(
      appInfo: packageInfoSource.getInfo(),

      /// From local
      language: language,
      isLightTheme: isLightTheme,
      uuid: localSharedConfig.uuid ?? const Uuid().v1(),
      isGameDevMode: localSharedConfig.isGameDevMode ?? false,
      isUiTestMode: localSharedConfig.isUiTestMode ?? false,
      isFirstRun: localSharedConfig.isFirstRun,
      nickname: localSharedConfig.nickname ?? "",
      installedAt: localSharedConfig.installedAt,
      isBgmMute: localSharedConfig.isBgmMute ?? false,
      noticeDialogHistory: localSharedConfig.noticeDialogHistory,

      /// From remote
      termsOfServiceUrl: remoteConfig.termsOfServiceUri(language),
      drawingThrottleMs: remoteConfig.drawingThrottleMs,
      drawOptimizeEpsilion: remoteConfig.drawOptimizeEpsilion,
      baseUrl: Uri.parse(remoteConfig.baseUrl),
      baseSocketUrl: Uri.parse(remoteConfig.baseSocketUrl),
      discordWebHookUrl: Uri.parse(remoteConfig.discordWebHookUrl),
      maxDrawingPoints: remoteConfig.maxDrawingPoints,
      privacyPolicyUrl: remoteConfig.privacyPolicyUri(language),
      inviteUrl: Uri.parse(remoteConfig.inviteUrl),
      devUuidList: remoteConfig.devUuidList,
      maxGuessLength: remoteConfig.maxGuessLength,
      geminiApiKey: remoteConfig.geminiApiKey,
      geminiModel: remoteConfig.geminiModel,
      geminiHintPrompt: remoteConfig.geminiHintPrompt.fromLang(language),
      isGeminiHint: remoteConfig.isGeminiHint,
      bgmUrl: remoteConfig.bgmUrl,
      bgmLicenseUrl: remoteConfig.bgmLicenseUri(language),
      isBgmDisabled: remoteConfig.isBgmDisabled,
      minBuildNumber: remoteConfig.minBuildNumber.platform,
      updateDialogData: remoteConfig.updateDialogData.fromLanguage(language),
      noticeDialogData: remoteConfig.noticeDialogData?.fromLanguage(language),
      contactUsEmail: remoteConfig.contactUsEmail,
      maintenanceDialogData: remoteConfig.maintenanceDialogData?.fromLanguage(
        language,
      ),
    );
  }
}
