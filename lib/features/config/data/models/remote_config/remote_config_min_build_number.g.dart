// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_min_build_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteConfigMinBuildNumberImpl _$$RemoteConfigMinBuildNumberImplFromJson(
        Map<String, dynamic> json) =>
    _$RemoteConfigMinBuildNumberImpl(
      aos: (json['aos'] as num?)?.toInt() ?? -1,
      ios: (json['ios'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$$RemoteConfigMinBuildNumberImplToJson(
        _$RemoteConfigMinBuildNumberImpl instance) =>
    <String, dynamic>{
      'aos': instance.aos,
      'ios': instance.ios,
    };
