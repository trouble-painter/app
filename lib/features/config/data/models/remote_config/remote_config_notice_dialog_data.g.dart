// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_notice_dialog_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteConfigNoticeDialogDataImpl _$$RemoteConfigNoticeDialogDataImplFromJson(
        Map<String, dynamic> json) =>
    _$RemoteConfigNoticeDialogDataImpl(
      version: (json['version'] as num).toInt(),
      exposureIntervalHour: (json['exposureIntervalHour'] as num).toInt(),
      isShow: json['isShow'] as bool,
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: DateTime.parse(json['endedAt'] as String),
      title: RemoteConfigLang.fromJson(json['title'] as Map<String, dynamic>),
      desc: RemoteConfigLang.fromJson(json['desc'] as Map<String, dynamic>),
      url: RemoteConfigLang.fromJson(json['url'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RemoteConfigNoticeDialogDataImplToJson(
        _$RemoteConfigNoticeDialogDataImpl instance) =>
    <String, dynamic>{
      'version': instance.version,
      'exposureIntervalHour': instance.exposureIntervalHour,
      'isShow': instance.isShow,
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': instance.endedAt.toIso8601String(),
      'title': instance.title,
      'desc': instance.desc,
      'url': instance.url,
    };
