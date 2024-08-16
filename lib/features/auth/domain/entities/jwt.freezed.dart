// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jwt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Jwt _$JwtFromJson(Map<String, dynamic> json) {
  return _Jwt.fromJson(json);
}

/// @nodoc
mixin _$Jwt {
  int get userId => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JwtCopyWith<Jwt> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JwtCopyWith<$Res> {
  factory $JwtCopyWith(Jwt value, $Res Function(Jwt) then) =
      _$JwtCopyWithImpl<$Res, Jwt>;
  @useResult
  $Res call({int userId, String refreshToken, String accessToken});
}

/// @nodoc
class _$JwtCopyWithImpl<$Res, $Val extends Jwt> implements $JwtCopyWith<$Res> {
  _$JwtCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? refreshToken = null,
    Object? accessToken = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JwtImplCopyWith<$Res> implements $JwtCopyWith<$Res> {
  factory _$$JwtImplCopyWith(_$JwtImpl value, $Res Function(_$JwtImpl) then) =
      __$$JwtImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, String refreshToken, String accessToken});
}

/// @nodoc
class __$$JwtImplCopyWithImpl<$Res> extends _$JwtCopyWithImpl<$Res, _$JwtImpl>
    implements _$$JwtImplCopyWith<$Res> {
  __$$JwtImplCopyWithImpl(_$JwtImpl _value, $Res Function(_$JwtImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? refreshToken = null,
    Object? accessToken = null,
  }) {
    return _then(_$JwtImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JwtImpl implements _Jwt {
  _$JwtImpl(
      {required this.userId,
      required this.refreshToken,
      required this.accessToken});

  factory _$JwtImpl.fromJson(Map<String, dynamic> json) =>
      _$$JwtImplFromJson(json);

  @override
  final int userId;
  @override
  final String refreshToken;
  @override
  final String accessToken;

  @override
  String toString() {
    return 'Jwt(userId: $userId, refreshToken: $refreshToken, accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JwtImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, refreshToken, accessToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JwtImplCopyWith<_$JwtImpl> get copyWith =>
      __$$JwtImplCopyWithImpl<_$JwtImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JwtImplToJson(
      this,
    );
  }
}

abstract class _Jwt implements Jwt {
  factory _Jwt(
      {required final int userId,
      required final String refreshToken,
      required final String accessToken}) = _$JwtImpl;

  factory _Jwt.fromJson(Map<String, dynamic> json) = _$JwtImpl.fromJson;

  @override
  int get userId;
  @override
  String get refreshToken;
  @override
  String get accessToken;
  @override
  @JsonKey(ignore: true)
  _$$JwtImplCopyWith<_$JwtImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
