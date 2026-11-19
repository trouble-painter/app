// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthState _$AuthStateFromJson(Map<String, dynamic> json) => _AuthState(
      jwt: Jwt.fromJson(json['jwt'] as Map<String, dynamic>),
      idToken: json['idToken'] as IdToken,
      signInMethod: SignInMethod.fromJson(json['signInMethod']),
    );

Map<String, dynamic> _$AuthStateToJson(_AuthState instance) =>
    <String, dynamic>{
      'jwt': instance.jwt,
      'idToken': instance.idToken,
      'signInMethod': instance.signInMethod,
    };
