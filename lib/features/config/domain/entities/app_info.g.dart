// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppInfo _$AppInfoFromJson(Map<String, dynamic> json) => _AppInfo(
      packageName: json['packageName'] as String,
      version: json['version'] as String,
      buildNumber: (json['buildNumber'] as num).toInt(),
    );

Map<String, dynamic> _$AppInfoToJson(_AppInfo instance) => <String, dynamic>{
      'packageName': instance.packageName,
      'version': instance.version,
      'buildNumber': instance.buildNumber,
    };
