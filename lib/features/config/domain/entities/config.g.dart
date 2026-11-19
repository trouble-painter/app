// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Config _$ConfigFromJson(Map<String, dynamic> json) => _Config(
      uuid: json['uuid'] as String,
      nickname: json['nickname'] as String,
      bgmUrl: json['bgmUrl'] as String,
      gameBgmUrl: json['gameBgmUrl'] as String,
      contactUsEmail: json['contactUsEmail'] as String,
      bgmLicenseUrl: Uri.parse(json['bgmLicenseUrl'] as String),
      baseUrl: Uri.parse(json['baseUrl'] as String),
      baseSocketUrl: Uri.parse(json['baseSocketUrl'] as String),
      inviteUrl: Uri.parse(json['inviteUrl'] as String),
      noticeUrl: Uri.parse(json['noticeUrl'] as String),
      suggestKeywordsUrl: Uri.parse(json['suggestKeywordsUrl'] as String),
      devUuidList: (json['devUuidList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isUiTestMode: json['isUiTestMode'] as bool,
      isUiTestModeMark: json['isUiTestModeMark'] as bool,
      isFirstRun: json['isFirstRun'] as bool,
      isQuickStartFirstRun: json['isQuickStartFirstRun'] as bool,
      isLightTheme: json['isLightTheme'] as bool,
      isBgmDisabled: json['isBgmDisabled'] as bool,
      isBgmMute: json['isBgmMute'] as bool,
      isGameBgmDisabled: json['isGameBgmDisabled'] as bool,
      isReactionDisabled: json['isReactionDisabled'] as bool,
      language: Language.fromJson(json['language']),
      appId: AppId.fromJson(json['appId'] as Map<String, dynamic>),
      appInfo: AppInfo.fromJson(json['appInfo'] as Map<String, dynamic>),
      termsOfServiceUrl: Uri.parse(json['termsOfServiceUrl'] as String),
      privacyPolicyUrl: Uri.parse(json['privacyPolicyUrl'] as String),
      minBuildNumber: (json['minBuildNumber'] as num).toInt(),
      drawOptimizeEpsilion: (json['drawOptimizeEpsilion'] as num).toDouble(),
      updateDialogData: UpdateDialogData.fromJson(
          json['updateDialogData'] as Map<String, dynamic>),
      admob: Admob.fromJson(json['admob'] as Map<String, dynamic>),
      notificationSetting: NotificationSetting.fromJson(
          json['notificationSetting'] as Map<String, dynamic>),
      noticeDialogData: json['noticeDialogData'] == null
          ? null
          : NoticeDialogData.fromJson(
              json['noticeDialogData'] as Map<String, dynamic>),
      noticeDialogHistory: json['noticeDialogHistory'] == null
          ? null
          : NoticeDialogHistory.fromJson(
              json['noticeDialogHistory'] as Map<String, dynamic>),
      maintenanceDialogData: json['maintenanceDialogData'] == null
          ? null
          : MaintenanceDialogData.fromJson(
              json['maintenanceDialogData'] as Map<String, dynamic>),
      installedAt:
          const TimeSerializer().fromJson(json['installedAt'] as String),
    );

Map<String, dynamic> _$ConfigToJson(_Config instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'nickname': instance.nickname,
      'bgmUrl': instance.bgmUrl,
      'gameBgmUrl': instance.gameBgmUrl,
      'contactUsEmail': instance.contactUsEmail,
      'bgmLicenseUrl': instance.bgmLicenseUrl.toString(),
      'baseUrl': instance.baseUrl.toString(),
      'baseSocketUrl': instance.baseSocketUrl.toString(),
      'inviteUrl': instance.inviteUrl.toString(),
      'noticeUrl': instance.noticeUrl.toString(),
      'suggestKeywordsUrl': instance.suggestKeywordsUrl.toString(),
      'devUuidList': instance.devUuidList,
      'isUiTestMode': instance.isUiTestMode,
      'isUiTestModeMark': instance.isUiTestModeMark,
      'isFirstRun': instance.isFirstRun,
      'isQuickStartFirstRun': instance.isQuickStartFirstRun,
      'isLightTheme': instance.isLightTheme,
      'isBgmDisabled': instance.isBgmDisabled,
      'isBgmMute': instance.isBgmMute,
      'isGameBgmDisabled': instance.isGameBgmDisabled,
      'isReactionDisabled': instance.isReactionDisabled,
      'language': instance.language,
      'appId': instance.appId,
      'appInfo': instance.appInfo,
      'termsOfServiceUrl': instance.termsOfServiceUrl.toString(),
      'privacyPolicyUrl': instance.privacyPolicyUrl.toString(),
      'minBuildNumber': instance.minBuildNumber,
      'drawOptimizeEpsilion': instance.drawOptimizeEpsilion,
      'updateDialogData': instance.updateDialogData,
      'admob': instance.admob,
      'notificationSetting': instance.notificationSetting,
      'noticeDialogData': instance.noticeDialogData,
      'noticeDialogHistory': instance.noticeDialogHistory,
      'maintenanceDialogData': instance.maintenanceDialogData,
      'installedAt': const TimeSerializer().toJson(instance.installedAt),
    };
