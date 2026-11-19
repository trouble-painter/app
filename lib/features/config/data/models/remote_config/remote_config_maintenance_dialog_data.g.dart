// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_maintenance_dialog_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RemoteConfigMaintenanceDialogData _$RemoteConfigMaintenanceDialogDataFromJson(
        Map<String, dynamic> json) =>
    _RemoteConfigMaintenanceDialogData(
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: DateTime.parse(json['endedAt'] as String),
      title: RemoteConfigLang.fromJson(json['title'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteConfigMaintenanceDialogDataToJson(
        _RemoteConfigMaintenanceDialogData instance) =>
    <String, dynamic>{
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': instance.endedAt.toIso8601String(),
      'title': instance.title,
    };
