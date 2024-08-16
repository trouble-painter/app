// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppInfoImpl _$$AppInfoImplFromJson(Map<String, dynamic> json) =>
    _$AppInfoImpl(
      packageName: json['packageName'] as String,
      version: json['version'] as String,
      buildNumber: (json['buildNumber'] as num).toInt(),
    );

Map<String, dynamic> _$$AppInfoImplToJson(_$AppInfoImpl instance) =>
    <String, dynamic>{
      'packageName': instance.packageName,
      'version': instance.version,
      'buildNumber': instance.buildNumber,
    };
