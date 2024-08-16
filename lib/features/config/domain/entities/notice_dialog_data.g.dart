// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_dialog_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoticeDialogDataImpl _$$NoticeDialogDataImplFromJson(
        Map<String, dynamic> json) =>
    _$NoticeDialogDataImpl(
      version: (json['version'] as num).toInt(),
      exposureIntervalHour: (json['exposureIntervalHour'] as num).toInt(),
      isShow: json['isShow'] as bool,
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: DateTime.parse(json['endedAt'] as String),
      title: json['title'] as String,
      desc: json['desc'] as String,
      url: json['url'] == null ? null : Uri.parse(json['url'] as String),
    );

Map<String, dynamic> _$$NoticeDialogDataImplToJson(
        _$NoticeDialogDataImpl instance) =>
    <String, dynamic>{
      'version': instance.version,
      'exposureIntervalHour': instance.exposureIntervalHour,
      'isShow': instance.isShow,
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': instance.endedAt.toIso8601String(),
      'title': instance.title,
      'desc': instance.desc,
      'url': instance.url?.toString(),
    };
