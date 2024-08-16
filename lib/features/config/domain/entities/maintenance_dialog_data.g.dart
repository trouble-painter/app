// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_dialog_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaintenanceDialogDataImpl _$$MaintenanceDialogDataImplFromJson(
        Map<String, dynamic> json) =>
    _$MaintenanceDialogDataImpl(
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: DateTime.parse(json['endedAt'] as String),
      title: json['title'] as String,
    );

Map<String, dynamic> _$$MaintenanceDialogDataImplToJson(
        _$MaintenanceDialogDataImpl instance) =>
    <String, dynamic>{
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': instance.endedAt.toIso8601String(),
      'title': instance.title,
    };
