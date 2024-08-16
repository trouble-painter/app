// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JwtImpl _$$JwtImplFromJson(Map<String, dynamic> json) => _$JwtImpl(
      userId: (json['userId'] as num).toInt(),
      refreshToken: json['refreshToken'] as String,
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$$JwtImplToJson(_$JwtImpl instance) => <String, dynamic>{
      'userId': instance.userId,
      'refreshToken': instance.refreshToken,
      'accessToken': instance.accessToken,
    };
