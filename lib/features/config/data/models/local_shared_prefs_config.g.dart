// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_shared_prefs_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalSharedPrefsConfigImpl _$$LocalSharedPrefsConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalSharedPrefsConfigImpl(
      isFirstRun: json['isFirstRun'] as bool,
      installedAt: DateTime.parse(json['installedAt'] as String),
      uuid: json['uuid'] as String?,
      nickname: json['nickname'] as String?,
      isLightTheme: json['isLightTheme'] as bool?,
      isGameDevMode: json['isGameDevMode'] as bool?,
      isUiTestMode: json['isUiTestMode'] as bool?,
      isBgmMute: json['isBgmMute'] as bool?,
      language:
          json['language'] == null ? null : Language.fromJson(json['language']),
      noticeDialogHistory: json['noticeDialogHistory'] == null
          ? null
          : NoticeDialogHistory.fromJson(
              json['noticeDialogHistory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LocalSharedPrefsConfigImplToJson(
        _$LocalSharedPrefsConfigImpl instance) =>
    <String, dynamic>{
      'isFirstRun': instance.isFirstRun,
      'installedAt': instance.installedAt.toIso8601String(),
      'uuid': instance.uuid,
      'nickname': instance.nickname,
      'isLightTheme': instance.isLightTheme,
      'isGameDevMode': instance.isGameDevMode,
      'isUiTestMode': instance.isUiTestMode,
      'isBgmMute': instance.isBgmMute,
      'language': instance.language,
      'noticeDialogHistory': instance.noticeDialogHistory,
    };
