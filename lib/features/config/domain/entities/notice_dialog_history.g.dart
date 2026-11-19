// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_dialog_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NoticeDialogHistory _$NoticeDialogHistoryFromJson(Map<String, dynamic> json) =>
    _NoticeDialogHistory(
      version: (json['version'] as num).toInt(),
      exposedAt: DateTime.parse(json['exposedAt'] as String),
    );

Map<String, dynamic> _$NoticeDialogHistoryToJson(
        _NoticeDialogHistory instance) =>
    <String, dynamic>{
      'version': instance.version,
      'exposedAt': instance.exposedAt.toIso8601String(),
    };
