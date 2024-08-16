// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthStateImpl _$$AuthStateImplFromJson(Map<String, dynamic> json) =>
    _$AuthStateImpl(
      jwt: Jwt.fromJson(json['jwt'] as Map<String, dynamic>),
      idToken: json['idToken'] as String,
      signInMethod: SignInMethod.fromJson(json['signInMethod']),
    );

Map<String, dynamic> _$$AuthStateImplToJson(_$AuthStateImpl instance) =>
    <String, dynamic>{
      'jwt': instance.jwt,
      'idToken': instance.idToken,
      'signInMethod': instance.signInMethod,
    };
