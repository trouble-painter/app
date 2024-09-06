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
      gameBgmUrl: json['gameBgmUrl'] as String,
      contactUsEmail: json['contactUsEmail'] as String,
      bgmLicenseUrl: Uri.parse(json['bgmLicenseUrl'] as String),
      baseUrl: Uri.parse(json['baseUrl'] as String),
      baseSocketUrl: Uri.parse(json['baseSocketUrl'] as String),
      errorWebHookUrl: Uri.parse(json['errorWebHookUrl'] as String),
      quickStartWebHookUrl: Uri.parse(json['quickStartWebHookUrl'] as String),
      inviteUrl: Uri.parse(json['inviteUrl'] as String),
      instagramUrl: Uri.parse(json['instagramUrl'] as String),
      discordUrl: Uri.parse(json['discordUrl'] as String),
      noticeUrl: Uri.parse(json['noticeUrl'] as String),
      suggestKeywordsUrl: Uri.parse(json['suggestKeywordsUrl'] as String),
      devUuidList: (json['devUuidList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isUiTestMode: json['isUiTestMode'] as bool,
      isFirstRun: json['isFirstRun'] as bool,
      isLightTheme: json['isLightTheme'] as bool,
      isGeminiHint: json['isGeminiHint'] as bool,
      isBgmDisabled: json['isBgmDisabled'] as bool,
      isBgmMute: json['isBgmMute'] as bool,
      isGameBgmDisabled: json['isGameBgmDisabled'] as bool,
      isQuickStartWebHook: json['isQuickStartWebHook'] as bool,
      language: Language.fromJson(json['language']),
      appId: AppId.fromJson(json['appId'] as Map<String, dynamic>),
      appInfo: AppInfo.fromJson(json['appInfo'] as Map<String, dynamic>),
      termsOfServiceUrl: Uri.parse(json['termsOfServiceUrl'] as String),
      privacyPolicyUrl: Uri.parse(json['privacyPolicyUrl'] as String),
      drawingThrottleMs: (json['drawingThrottleMs'] as num).toInt(),
      maxDrawingPoints: (json['maxDrawingPoints'] as num).toInt(),
      maxGuessLength: (json['maxGuessLength'] as num).toInt(),
      minBuildNumber: (json['minBuildNumber'] as num).toInt(),
      quickStartWebHookWaitingSec:
          (json['quickStartWebHookWaitingSec'] as num).toInt(),
      waitingBgSocketTimeOut: (json['waitingBgSocketTimeOut'] as num).toInt(),
      playingBgSocketTimeOut: (json['playingBgSocketTimeOut'] as num).toInt(),
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

Map<String, dynamic> _$$ConfigImplToJson(_$ConfigImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'nickname': instance.nickname,
      'geminiApiKey': instance.geminiApiKey,
      'geminiModel': instance.geminiModel,
      'geminiHintPrompt': instance.geminiHintPrompt,
      'bgmUrl': instance.bgmUrl,
      'gameBgmUrl': instance.gameBgmUrl,
      'contactUsEmail': instance.contactUsEmail,
      'bgmLicenseUrl': instance.bgmLicenseUrl.toString(),
      'baseUrl': instance.baseUrl.toString(),
      'baseSocketUrl': instance.baseSocketUrl.toString(),
      'errorWebHookUrl': instance.errorWebHookUrl.toString(),
      'quickStartWebHookUrl': instance.quickStartWebHookUrl.toString(),
      'inviteUrl': instance.inviteUrl.toString(),
      'instagramUrl': instance.instagramUrl.toString(),
      'discordUrl': instance.discordUrl.toString(),
      'noticeUrl': instance.noticeUrl.toString(),
      'suggestKeywordsUrl': instance.suggestKeywordsUrl.toString(),
      'devUuidList': instance.devUuidList,
      'isUiTestMode': instance.isUiTestMode,
      'isFirstRun': instance.isFirstRun,
      'isLightTheme': instance.isLightTheme,
      'isGeminiHint': instance.isGeminiHint,
      'isBgmDisabled': instance.isBgmDisabled,
      'isBgmMute': instance.isBgmMute,
      'isGameBgmDisabled': instance.isGameBgmDisabled,
      'isQuickStartWebHook': instance.isQuickStartWebHook,
      'language': instance.language,
      'appId': instance.appId,
      'appInfo': instance.appInfo,
      'termsOfServiceUrl': instance.termsOfServiceUrl.toString(),
      'privacyPolicyUrl': instance.privacyPolicyUrl.toString(),
      'drawingThrottleMs': instance.drawingThrottleMs,
      'maxDrawingPoints': instance.maxDrawingPoints,
      'maxGuessLength': instance.maxGuessLength,
      'minBuildNumber': instance.minBuildNumber,
      'quickStartWebHookWaitingSec': instance.quickStartWebHookWaitingSec,
      'waitingBgSocketTimeOut': instance.waitingBgSocketTimeOut,
      'playingBgSocketTimeOut': instance.playingBgSocketTimeOut,
      'drawOptimizeEpsilion': instance.drawOptimizeEpsilion,
      'updateDialogData': instance.updateDialogData,
      'admob': instance.admob,
      'notificationSetting': instance.notificationSetting,
      'noticeDialogData': instance.noticeDialogData,
      'noticeDialogHistory': instance.noticeDialogHistory,
      'maintenanceDialogData': instance.maintenanceDialogData,
      'installedAt': const TimeSerializer().toJson(instance.installedAt),
    };
