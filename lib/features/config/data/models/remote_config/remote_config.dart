import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_pr/features/config/data/models/remote_config/remote_config_admob_id.dart';
import 'package:x_pr/features/config/data/models/remote_config/remote_config_lang.dart';
import 'package:x_pr/features/config/data/models/remote_config/remote_config_maintenance_dialog_data.dart';
import 'package:x_pr/features/config/data/models/remote_config/remote_config_min_build_number.dart';
import 'package:x_pr/features/config/data/models/remote_config/remote_config_notice_dialog_data.dart';
import 'package:x_pr/features/config/data/models/remote_config/remote_config_update_dialog_data.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';

part 'remote_config.freezed.dart';
part 'remote_config.g.dart';

@freezed
class RemoteConfig with _$RemoteConfig {
  factory RemoteConfig({
    /// App
    required String aosAppId,
    required String iosAppId,

    /// Urls
    required RemoteConfigLang privacyPolicyUrl,
    required RemoteConfigLang termsOfServiceUrl,
    required RemoteConfigLang noticeUrl,
    required RemoteConfigLang suggestKeywordsUrl,
    required String baseUrl,
    required String baseSocketUrl,
    required String inviteUrl,
    required String instagramUrl,
    required String discordUrl,

    /// Webhooks
    required String errorWebHookUrl,
    required String quickStartWebHookUrl,
    required int quickStartWebHookWaitingSec,
    required bool isQuickStartWebHook,

    /// Settings
    required int maxDrawingPoints,
    required int drawingThrottleMs,
    required int maxGuessLength,
    required int waitingBgSocketTimeOut,
    required int playingBgSocketTimeOut,
    required double drawOptimizeEpsilion,

    /// Gemini
    required String geminiApiKey,
    required String geminiModel,
    required bool isGeminiHint,
    required RemoteConfigLang geminiHintPrompt,

    /// Bgm
    required String bgmUrl,
    required String gameBgmUrl,
    required bool isBgmDisabled,
    required bool isGameBgmDisabled,
    required RemoteConfigLang bgmLicenseUrl,

    /// Operation
    required RemoteConfigMinBuildNumber minBuildNumber,
    required RemoteConfigUpdateDialogData updateDialogData,
    required String contactUsEmail,
    RemoteConfigNoticeDialogData? noticeDialogData,
    RemoteConfigMaintenanceDialogData? maintenanceDialogData,

    /// Admob
    required RemoteConfigAdmobId admobAppId,
    required RemoteConfigAdmobId admobQuickStartRewardId,

    /// Notification
    required bool disableQuickStartNoti,

    /// Developers
    required List<String> devUuidList,
  }) = _RemoteConfig;

  RemoteConfig._();

  factory RemoteConfig.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigFromJson(json);

  Uri termsOfServiceUri(Language language) {
    return Uri.parse(termsOfServiceUrl.fromLang(language));
  }

  Uri privacyPolicyUri(Language language) {
    return Uri.parse(privacyPolicyUrl.fromLang(language));
  }

  Uri bgmLicenseUri(Language language) {
    return Uri.parse(bgmLicenseUrl.fromLang(language));
  }
}
