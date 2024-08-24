// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteConfigImpl _$$RemoteConfigImplFromJson(Map<String, dynamic> json) =>
    _$RemoteConfigImpl(
      aosAppId: json['aosAppId'] as String,
      iosAppId: json['iosAppId'] as String,
      privacyPolicyUrl: RemoteConfigLang.fromJson(
          json['privacyPolicyUrl'] as Map<String, dynamic>),
      termsOfServiceUrl: RemoteConfigLang.fromJson(
          json['termsOfServiceUrl'] as Map<String, dynamic>),
      noticeUrl:
          RemoteConfigLang.fromJson(json['noticeUrl'] as Map<String, dynamic>),
      suggestKeywordsUrl: RemoteConfigLang.fromJson(
          json['suggestKeywordsUrl'] as Map<String, dynamic>),
      baseUrl: json['baseUrl'] as String,
      baseSocketUrl: json['baseSocketUrl'] as String,
      discordWebHookUrl: json['discordWebHookUrl'] as String,
      inviteUrl: json['inviteUrl'] as String,
      instagramUrl: json['instagramUrl'] as String,
      discordUrl: json['discordUrl'] as String,
      maxDrawingPoints: (json['maxDrawingPoints'] as num).toInt(),
      drawingThrottleMs: (json['drawingThrottleMs'] as num).toInt(),
      maxGuessLength: (json['maxGuessLength'] as num).toInt(),
      drawOptimizeEpsilion: (json['drawOptimizeEpsilion'] as num).toDouble(),
      geminiApiKey: json['geminiApiKey'] as String,
      geminiModel: json['geminiModel'] as String,
      isGeminiHint: json['isGeminiHint'] as bool,
      geminiHintPrompt: RemoteConfigLang.fromJson(
          json['geminiHintPrompt'] as Map<String, dynamic>),
      bgmUrl: json['bgmUrl'] as String,
      isBgmDisabled: json['isBgmDisabled'] as bool,
      bgmLicenseUrl: RemoteConfigLang.fromJson(
          json['bgmLicenseUrl'] as Map<String, dynamic>),
      minBuildNumber: RemoteConfigMinBuildNumber.fromJson(
          json['minBuildNumber'] as Map<String, dynamic>),
      updateDialogData: RemoteConfigUpdateDialogData.fromJson(
          json['updateDialogData'] as Map<String, dynamic>),
      contactUsEmail: json['contactUsEmail'] as String,
      noticeDialogData: json['noticeDialogData'] == null
          ? null
          : RemoteConfigNoticeDialogData.fromJson(
              json['noticeDialogData'] as Map<String, dynamic>),
      maintenanceDialogData: json['maintenanceDialogData'] == null
          ? null
          : RemoteConfigMaintenanceDialogData.fromJson(
              json['maintenanceDialogData'] as Map<String, dynamic>),
      devUuidList: (json['devUuidList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$RemoteConfigImplToJson(_$RemoteConfigImpl instance) =>
    <String, dynamic>{
      'aosAppId': instance.aosAppId,
      'iosAppId': instance.iosAppId,
      'privacyPolicyUrl': instance.privacyPolicyUrl,
      'termsOfServiceUrl': instance.termsOfServiceUrl,
      'noticeUrl': instance.noticeUrl,
      'suggestKeywordsUrl': instance.suggestKeywordsUrl,
      'baseUrl': instance.baseUrl,
      'baseSocketUrl': instance.baseSocketUrl,
      'discordWebHookUrl': instance.discordWebHookUrl,
      'inviteUrl': instance.inviteUrl,
      'instagramUrl': instance.instagramUrl,
      'discordUrl': instance.discordUrl,
      'maxDrawingPoints': instance.maxDrawingPoints,
      'drawingThrottleMs': instance.drawingThrottleMs,
      'maxGuessLength': instance.maxGuessLength,
      'drawOptimizeEpsilion': instance.drawOptimizeEpsilion,
      'geminiApiKey': instance.geminiApiKey,
      'geminiModel': instance.geminiModel,
      'isGeminiHint': instance.isGeminiHint,
      'geminiHintPrompt': instance.geminiHintPrompt,
      'bgmUrl': instance.bgmUrl,
      'isBgmDisabled': instance.isBgmDisabled,
      'bgmLicenseUrl': instance.bgmLicenseUrl,
      'minBuildNumber': instance.minBuildNumber,
      'updateDialogData': instance.updateDialogData,
      'contactUsEmail': instance.contactUsEmail,
      'noticeDialogData': instance.noticeDialogData,
      'maintenanceDialogData': instance.maintenanceDialogData,
      'devUuidList': instance.devUuidList,
    };
