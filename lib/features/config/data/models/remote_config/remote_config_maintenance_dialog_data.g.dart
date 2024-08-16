// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_maintenance_dialog_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteConfigMaintenanceDialogDataImpl
    _$$RemoteConfigMaintenanceDialogDataImplFromJson(
            Map<String, dynamic> json) =>
        _$RemoteConfigMaintenanceDialogDataImpl(
          startedAt: DateTime.parse(json['startedAt'] as String),
          endedAt: DateTime.parse(json['endedAt'] as String),
          title:
              RemoteConfigLang.fromJson(json['title'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RemoteConfigMaintenanceDialogDataImplToJson(
        _$RemoteConfigMaintenanceDialogDataImpl instance) =>
    <String, dynamic>{
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': instance.endedAt.toIso8601String(),
      'title': instance.title,
    };
