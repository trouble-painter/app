// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthState {
  Jwt get jwt;
  IdToken get idToken;
  SignInMethod get signInMethod;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthStateCopyWith<AuthState> get copyWith =>
      _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);

  /// Serializes this AuthState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as AuthState;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthState &&
            (identical(other.jwt, _this.jwt) || other.jwt == _this.jwt) &&
            (identical(other.idToken, _this.idToken) ||
                other.idToken == _this.idToken) &&
            (identical(other.signInMethod, _this.signInMethod) ||
                other.signInMethod == _this.signInMethod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as AuthState;
    return Object.hash(
        runtimeType, _this.jwt, _this.idToken, _this.signInMethod);
  }

  @override
  String toString() {
    final _this = this as AuthState;
    return 'AuthState(jwt: ${_this.jwt}, idToken: ${_this.idToken}, signInMethod: ${_this.signInMethod})';
  }
}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) =
      _$AuthStateCopyWithImpl;
  @useResult
  $Res call({Jwt jwt, IdToken idToken, SignInMethod signInMethod});

  $JwtCopyWith<$Res> get jwt;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jwt = null,
    Object? idToken = null,
    Object? signInMethod = null,
  }) {
    return _then(AuthState(
      jwt: null == jwt
          ? _self.jwt
          : jwt // ignore: cast_nullable_to_non_nullable
              as Jwt,
      idToken: null == idToken
          ? _self.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as IdToken,
      signInMethod: null == signInMethod
          ? _self.signInMethod
          : signInMethod // ignore: cast_nullable_to_non_nullable
              as SignInMethod,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JwtCopyWith<$Res> get jwt {
    return $JwtCopyWith<$Res>(_self.jwt, (value) {
      return _then(_self.copyWith(jwt: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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
    TResult Function(_AuthState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthState() when $default != null:
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
    TResult Function(_AuthState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthState():
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
    TResult? Function(_AuthState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthState() when $default != null:
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
    TResult Function(Jwt jwt, IdToken idToken, SignInMethod signInMethod)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthState() when $default != null:
        return $default(_that.jwt, _that.idToken, _that.signInMethod);
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
    TResult Function(Jwt jwt, IdToken idToken, SignInMethod signInMethod)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthState():
        return $default(_that.jwt, _that.idToken, _that.signInMethod);
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
    TResult? Function(Jwt jwt, IdToken idToken, SignInMethod signInMethod)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthState() when $default != null:
        return $default(_that.jwt, _that.idToken, _that.signInMethod);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AuthState implements AuthState {
  _AuthState(
      {required this.jwt, required this.idToken, required this.signInMethod});
  factory _AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);

  @override
  final Jwt jwt;
  @override
  final IdToken idToken;
  @override
  final SignInMethod signInMethod;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuthStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthState &&
            (identical(other.jwt, jwt) || other.jwt == jwt) &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.signInMethod, signInMethod) ||
                other.signInMethod == signInMethod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, jwt, idToken, signInMethod);
  }

  @override
  String toString() {
    return 'AuthState(jwt: $jwt, idToken: $idToken, signInMethod: $signInMethod)';
  }
}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) _then) =
      __$AuthStateCopyWithImpl;
  @override
  @useResult
  $Res call({Jwt jwt, IdToken idToken, SignInMethod signInMethod});

  @override
  $JwtCopyWith<$Res> get jwt;
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? jwt = null,
    Object? idToken = null,
    Object? signInMethod = null,
  }) {
    return _then(_AuthState(
      jwt: null == jwt
          ? _self.jwt
          : jwt // ignore: cast_nullable_to_non_nullable
              as Jwt,
      idToken: null == idToken
          ? _self.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as IdToken,
      signInMethod: null == signInMethod
          ? _self.signInMethod
          : signInMethod // ignore: cast_nullable_to_non_nullable
              as SignInMethod,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JwtCopyWith<$Res> get jwt {
    return $JwtCopyWith<$Res>(_self.jwt, (value) {
      return _then(_self.copyWith(jwt: value));
    });
  }
}

// dart format on
