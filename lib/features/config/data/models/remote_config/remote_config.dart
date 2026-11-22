import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trouble_painter/features/config/data/models/remote_config/remote_config_lang.dart';
import 'package:trouble_painter/features/config/data/models/remote_config/remote_config_maintenance_dialog_data.dart';
import 'package:trouble_painter/features/config/data/models/remote_config/remote_config_min_build_number.dart';
import 'package:trouble_painter/features/config/data/models/remote_config/remote_config_notice_dialog_data.dart';
import 'package:trouble_painter/features/config/data/models/remote_config/remote_config_update_dialog_data.dart';
import 'package:trouble_painter/features/config/domain/entities/language.dart';

part 'remote_config.freezed.dart';
part 'remote_config.g.dart';

@freezed
abstract class RemoteConfig with _$RemoteConfig {
  factory RemoteConfig({
    /// App
    required String aosAppId,
    required String iosAppId,

    /// Urls
    required RemoteConfigLang privacyPolicyUrl,
    required RemoteConfigLang termsOfServiceUrl,
    required RemoteConfigLang noticeUrl,
    required String baseUrl,
    required String baseSocketUrl,
    required String inviteUrl,

    /// Settings
    required double drawOptimizeEpsilion,
    required bool isReactionDisabled,

    /// Bgm
    required String bgmUrl,
    required String gameBgmUrl,
    required String winBgmUrl,
    required String loseBgmUrl,
    required bool isBgmDisabled,
    required bool isGameBgmDisabled,
    required RemoteConfigLang bgmLicenseUrl,

    /// Operation
    required RemoteConfigMinBuildNumber minBuildNumber,
    required RemoteConfigUpdateDialogData updateDialogData,
    required String contactUsEmail,
    RemoteConfigNoticeDialogData? noticeDialogData,
    RemoteConfigMaintenanceDialogData? maintenanceDialogData,

    /// Notification
    required bool disableQuickStartNoti,
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
