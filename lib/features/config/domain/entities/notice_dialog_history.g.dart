// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_dialog_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoticeDialogHistoryImpl _$$NoticeDialogHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$NoticeDialogHistoryImpl(
      version: (json['version'] as num).toInt(),
      exposedAt: DateTime.parse(json['exposedAt'] as String),
    );

Map<String, dynamic> _$$NoticeDialogHistoryImplToJson(
        _$NoticeDialogHistoryImpl instance) =>
    <String, dynamic>{
      'version': instance.version,
      'exposedAt': instance.exposedAt.toIso8601String(),
    };
