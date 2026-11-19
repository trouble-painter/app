// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Jwt _$JwtFromJson(Map<String, dynamic> json) => _Jwt(
      userId: (json['userId'] as num).toInt(),
      refreshToken: json['refreshToken'] as RefreshToken,
      accessToken: json['accessToken'] as AccessToken,
    );

Map<String, dynamic> _$JwtToJson(_Jwt instance) => <String, dynamic>{
      'userId': instance.userId,
      'refreshToken': instance.refreshToken,
      'accessToken': instance.accessToken,
    };
