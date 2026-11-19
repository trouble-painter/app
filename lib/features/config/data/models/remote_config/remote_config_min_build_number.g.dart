// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_min_build_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RemoteConfigMinBuildNumber _$RemoteConfigMinBuildNumberFromJson(
        Map<String, dynamic> json) =>
    _RemoteConfigMinBuildNumber(
      aos: (json['aos'] as num?)?.toInt() ?? -1,
      ios: (json['ios'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$RemoteConfigMinBuildNumberToJson(
        _RemoteConfigMinBuildNumber instance) =>
    <String, dynamic>{
      'aos': instance.aos,
      'ios': instance.ios,
    };
