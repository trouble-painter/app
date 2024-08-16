// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigImpl _$$ConfigImplFromJson(Map<String, dynamic> json) => _$ConfigImpl(
      uuid: json['uuid'] as String,
      nickname: json['nickname'] as String,
      geminiApiKey: json['geminiApiKey'] as String,
      geminiModel: json['geminiModel'] as String,
      geminiHintPrompt: json['geminiHintPrompt'] as String,
      bgmUrl: json['bgmUrl'] as String,
      contactUsEmail: json['contactUsEmail'] as String,
      bgmLicenseUrl: Uri.parse(json['bgmLicenseUrl'] as String),
      baseUrl: Uri.parse(json['baseUrl'] as String),
      baseSocketUrl: Uri.parse(json['baseSocketUrl'] as String),
      discordWebHookUrl: Uri.parse(json['discordWebHookUrl'] as String),
      inviteUrl: Uri.parse(json['inviteUrl'] as String),
      devUuidList: (json['devUuidList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isGameDevMode: json['isGameDevMode'] as bool,
      isUiTestMode: json['isUiTestMode'] as bool,
      isFirstRun: json['isFirstRun'] as bool,
      isLightTheme: json['isLightTheme'] as bool,
      isGeminiHint: json['isGeminiHint'] as bool,
      isBgmDisabled: json['isBgmDisabled'] as bool,
      isBgmMute: json['isBgmMute'] as bool,
      language: Language.fromJson(json['language']),
      appInfo: AppInfo.fromJson(json['appInfo'] as Map<String, dynamic>),
      termsOfServiceUrl: Uri.parse(json['termsOfServiceUrl'] as String),
      privacyPolicyUrl: Uri.parse(json['privacyPolicyUrl'] as String),
      drawingThrottleMs: (json['drawingThrottleMs'] as num).toInt(),
      maxDrawingPoints: (json['maxDrawingPoints'] as num).toInt(),
      maxGuessLength: (json['maxGuessLength'] as num).toInt(),
      minBuildNumber: (json['minBuildNumber'] as num).toInt(),
      drawOptimizeEpsilion: (json['drawOptimizeEpsilion'] as num).toDouble(),
      updateDialogData: UpdateDialogData.fromJson(
          json['updateDialogData'] as Map<String, dynamic>),
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

Map<String, dynamic> _$$ConfigImplToJson(_$ConfigImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'nickname': instance.nickname,
      'geminiApiKey': instance.geminiApiKey,
      'geminiModel': instance.geminiModel,
      'geminiHintPrompt': instance.geminiHintPrompt,
      'bgmUrl': instance.bgmUrl,
      'contactUsEmail': instance.contactUsEmail,
      'bgmLicenseUrl': instance.bgmLicenseUrl.toString(),
      'baseUrl': instance.baseUrl.toString(),
      'baseSocketUrl': instance.baseSocketUrl.toString(),
      'discordWebHookUrl': instance.discordWebHookUrl.toString(),
      'inviteUrl': instance.inviteUrl.toString(),
      'devUuidList': instance.devUuidList,
      'isGameDevMode': instance.isGameDevMode,
      'isUiTestMode': instance.isUiTestMode,
      'isFirstRun': instance.isFirstRun,
      'isLightTheme': instance.isLightTheme,
      'isGeminiHint': instance.isGeminiHint,
      'isBgmDisabled': instance.isBgmDisabled,
      'isBgmMute': instance.isBgmMute,
      'language': instance.language,
      'appInfo': instance.appInfo,
      'termsOfServiceUrl': instance.termsOfServiceUrl.toString(),
      'privacyPolicyUrl': instance.privacyPolicyUrl.toString(),
      'drawingThrottleMs': instance.drawingThrottleMs,
      'maxDrawingPoints': instance.maxDrawingPoints,
      'maxGuessLength': instance.maxGuessLength,
      'minBuildNumber': instance.minBuildNumber,
      'drawOptimizeEpsilion': instance.drawOptimizeEpsilion,
      'updateDialogData': instance.updateDialogData,
      'noticeDialogData': instance.noticeDialogData,
      'noticeDialogHistory': instance.noticeDialogHistory,
      'maintenanceDialogData': instance.maintenanceDialogData,
      'installedAt': const TimeSerializer().toJson(instance.installedAt),
    };
