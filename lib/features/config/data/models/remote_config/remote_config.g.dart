// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RemoteConfig _$RemoteConfigFromJson(Map<String, dynamic> json) =>
    _RemoteConfig(
      aosAppId: json['aosAppId'] as String,
      iosAppId: json['iosAppId'] as String,
      privacyPolicyUrl: RemoteConfigLang.fromJson(
          json['privacyPolicyUrl'] as Map<String, dynamic>),
      termsOfServiceUrl: RemoteConfigLang.fromJson(
          json['termsOfServiceUrl'] as Map<String, dynamic>),
      noticeUrl:
          RemoteConfigLang.fromJson(json['noticeUrl'] as Map<String, dynamic>),
      baseUrl: json['baseUrl'] as String,
      baseSocketUrl: json['baseSocketUrl'] as String,
      inviteUrl: json['inviteUrl'] as String,
      drawOptimizeEpsilion: (json['drawOptimizeEpsilion'] as num).toDouble(),
      isReactionDisabled: json['isReactionDisabled'] as bool,
      bgmUrl: json['bgmUrl'] as String,
      gameBgmUrl: json['gameBgmUrl'] as String,
      isBgmDisabled: json['isBgmDisabled'] as bool,
      isGameBgmDisabled: json['isGameBgmDisabled'] as bool,
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
      disableQuickStartNoti: json['disableQuickStartNoti'] as bool,
      devUuidList: (json['devUuidList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RemoteConfigToJson(_RemoteConfig instance) =>
    <String, dynamic>{
      'aosAppId': instance.aosAppId,
      'iosAppId': instance.iosAppId,
      'privacyPolicyUrl': instance.privacyPolicyUrl,
      'termsOfServiceUrl': instance.termsOfServiceUrl,
      'noticeUrl': instance.noticeUrl,
      'baseUrl': instance.baseUrl,
      'baseSocketUrl': instance.baseSocketUrl,
      'inviteUrl': instance.inviteUrl,
      'drawOptimizeEpsilion': instance.drawOptimizeEpsilion,
      'isReactionDisabled': instance.isReactionDisabled,
      'bgmUrl': instance.bgmUrl,
      'gameBgmUrl': instance.gameBgmUrl,
      'isBgmDisabled': instance.isBgmDisabled,
      'isGameBgmDisabled': instance.isGameBgmDisabled,
      'bgmLicenseUrl': instance.bgmLicenseUrl,
      'minBuildNumber': instance.minBuildNumber,
      'updateDialogData': instance.updateDialogData,
      'contactUsEmail': instance.contactUsEmail,
      'noticeDialogData': instance.noticeDialogData,
      'maintenanceDialogData': instance.maintenanceDialogData,
      'disableQuickStartNoti': instance.disableQuickStartNoti,
      'devUuidList': instance.devUuidList,
    };
