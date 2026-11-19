import 'dart:async';

import 'package:trouble_painter/core/data/sources/package_info_source.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/features/config/data/models/local_shared_prefs_config/local_shared_prefs_config.dart';
import 'package:trouble_painter/features/config/data/models/remote_config/remote_config.dart';
import 'package:trouble_painter/features/config/data/repositories/config_repository.dart';
import 'package:trouble_painter/features/config/data/sources/local_shared_prefs_config_source.dart';
import 'package:trouble_painter/features/config/data/sources/remote_config_source.dart';
import 'package:trouble_painter/features/config/domain/entities/admob.dart';
import 'package:trouble_painter/features/config/domain/entities/app_id.dart';
import 'package:trouble_painter/features/config/domain/entities/config.dart';
import 'package:trouble_painter/features/config/domain/entities/language.dart';
import 'package:trouble_painter/features/config/domain/entities/notification_setting.dart';

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
    return Config(
      appInfo: packageInfoSource.getInfo(),

      /// From local
      language: language,
      isLightTheme: localSharedConfig.isLightTheme,
      uuid: localSharedConfig.uuid,
      isFirstRun: localSharedConfig.isFirstRun,
      isQuickStartFirstRun: localSharedConfig.isQuickStartFirstRun,
      isUiTestMode: localSharedConfig.isUiTestMode,
      isUiTestModeMark: localSharedConfig.isUiTestModeMark,
      nickname: localSharedConfig.nickname,
      installedAt: localSharedConfig.installedAt,
      isBgmMute: localSharedConfig.isBgmMute,
      noticeDialogHistory: localSharedConfig.noticeDialogHistory,

      /// Local & Remote
      notificationSetting: NotificationSetting(
        receiveQuickStartNoti: localSharedConfig.receiveQuickStartNoti,
        disableQuickStartNoti: remoteConfig.disableQuickStartNoti,
      ),

      /// From remote
      termsOfServiceUrl: remoteConfig.termsOfServiceUri(language),
      drawOptimizeEpsilion: remoteConfig.drawOptimizeEpsilion,
      baseUrl: Uri.parse(remoteConfig.baseUrl),
      baseSocketUrl: Uri.parse(remoteConfig.baseSocketUrl),
      privacyPolicyUrl: remoteConfig.privacyPolicyUri(language),
      inviteUrl: Uri.parse(remoteConfig.inviteUrl),
      devUuidList: remoteConfig.devUuidList,
      bgmUrl: remoteConfig.bgmUrl,
      gameBgmUrl: remoteConfig.gameBgmUrl,
      bgmLicenseUrl: remoteConfig.bgmLicenseUri(language),
      isBgmDisabled: remoteConfig.isBgmDisabled,
      isGameBgmDisabled: remoteConfig.isGameBgmDisabled,
      minBuildNumber: remoteConfig.minBuildNumber.platform,
      updateDialogData: remoteConfig.updateDialogData.fromLanguage(language),
      noticeDialogData: remoteConfig.noticeDialogData?.fromLanguage(language),
      contactUsEmail: remoteConfig.contactUsEmail,
      maintenanceDialogData: remoteConfig.maintenanceDialogData?.fromLanguage(
        language,
      ),
      appId: AppId(
        aos: remoteConfig.aosAppId,
        ios: remoteConfig.iosAppId,
      ),
      instagramUrl: Uri.parse(remoteConfig.instagramUrl),
      discordUrl: Uri.parse(remoteConfig.discordUrl),
      noticeUrl: Uri.parse(
        remoteConfig.noticeUrl.fromLang(language),
      ),
      suggestKeywordsUrl: Uri.parse(
        remoteConfig.suggestKeywordsUrl.fromLang(language),
      ),
      admob: Admob(
        appId: remoteConfig.admobAppId.id,
        quickStartRewardId: remoteConfig.admobQuickStartRewardId.id,
      ),
      isReactionDisabled: remoteConfig.isReactionDisabled,
    );
  }
}
