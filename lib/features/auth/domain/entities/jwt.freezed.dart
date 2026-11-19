// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jwt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Jwt {
  int get userId;
  RefreshToken get refreshToken;
  AccessToken get accessToken;

  /// Create a copy of Jwt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JwtCopyWith<Jwt> get copyWith =>
      _$JwtCopyWithImpl<Jwt>(this as Jwt, _$identity);

  /// Serializes this Jwt to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as Jwt;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Jwt &&
            (identical(other.userId, _this.userId) ||
                other.userId == _this.userId) &&
            (identical(other.refreshToken, _this.refreshToken) ||
                other.refreshToken == _this.refreshToken) &&
            (identical(other.accessToken, _this.accessToken) ||
                other.accessToken == _this.accessToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as Jwt;
    return Object.hash(
        runtimeType, _this.userId, _this.refreshToken, _this.accessToken);
  }

  @override
  String toString() {
    final _this = this as Jwt;
    return 'Jwt(userId: ${_this.userId}, refreshToken: ${_this.refreshToken}, accessToken: ${_this.accessToken})';
  }
}

/// @nodoc
abstract mixin class $JwtCopyWith<$Res> {
  factory $JwtCopyWith(Jwt value, $Res Function(Jwt) _then) = _$JwtCopyWithImpl;
  @useResult
  $Res call({int userId, RefreshToken refreshToken, AccessToken accessToken});
}

/// @nodoc
class _$JwtCopyWithImpl<$Res> implements $JwtCopyWith<$Res> {
  _$JwtCopyWithImpl(this._self, this._then);

  final Jwt _self;
  final $Res Function(Jwt) _then;

  /// Create a copy of Jwt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? refreshToken = null,
    Object? accessToken = null,
  }) {
    return _then(Jwt(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as RefreshToken,
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as AccessToken,
    ));
  }
}

/// Adds pattern-matching-related methods to [Jwt].
extension JwtPatterns on Jwt {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Jwt value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Jwt() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Jwt value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Jwt():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Jwt value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Jwt() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int userId, RefreshToken refreshToken, AccessToken accessToken)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Jwt() when $default != null:
        return $default(_that.userId, _that.refreshToken, _that.accessToken);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int userId, RefreshToken refreshToken, AccessToken accessToken)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Jwt():
        return $default(_that.userId, _that.refreshToken, _that.accessToken);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int userId, RefreshToken refreshToken, AccessToken accessToken)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Jwt() when $default != null:
        return $default(_that.userId, _that.refreshToken, _that.accessToken);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Jwt implements Jwt {
  _Jwt(
      {required this.userId,
      required this.refreshToken,
      required this.accessToken});
  factory _Jwt.fromJson(Map<String, dynamic> json) => _$JwtFromJson(json);

  @override
  final int userId;
  @override
  final RefreshToken refreshToken;
  @override
  final AccessToken accessToken;

  /// Create a copy of Jwt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$JwtCopyWith<_Jwt> get copyWith =>
      __$JwtCopyWithImpl<_Jwt>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$JwtToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Jwt &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, userId, refreshToken, accessToken);
  }

  @override
  String toString() {
    return 'Jwt(userId: $userId, refreshToken: $refreshToken, accessToken: $accessToken)';
  }
}

/// @nodoc
abstract mixin class _$JwtCopyWith<$Res> implements $JwtCopyWith<$Res> {
  factory _$JwtCopyWith(_Jwt value, $Res Function(_Jwt) _then) =
      __$JwtCopyWithImpl;
  @override
  @useResult
  $Res call({int userId, RefreshToken refreshToken, AccessToken accessToken});
}

/// @nodoc
class __$JwtCopyWithImpl<$Res> implements _$JwtCopyWith<$Res> {
  __$JwtCopyWithImpl(this._self, this._then);

  final _Jwt _self;
  final $Res Function(_Jwt) _then;

  /// Create a copy of Jwt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? refreshToken = null,
    Object? accessToken = null,
  }) {
    return _then(_Jwt(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as RefreshToken,
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as AccessToken,
    ));
  }
}

// dart format on
