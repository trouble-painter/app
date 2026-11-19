// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_min_build_number.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemoteConfigMinBuildNumber {
  int get aos;
  int get ios;

  /// Create a copy of RemoteConfigMinBuildNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RemoteConfigMinBuildNumberCopyWith<RemoteConfigMinBuildNumber>
      get copyWith =>
          _$RemoteConfigMinBuildNumberCopyWithImpl<RemoteConfigMinBuildNumber>(
              this as RemoteConfigMinBuildNumber, _$identity);

  /// Serializes this RemoteConfigMinBuildNumber to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as RemoteConfigMinBuildNumber;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemoteConfigMinBuildNumber &&
            (identical(other.aos, _this.aos) || other.aos == _this.aos) &&
            (identical(other.ios, _this.ios) || other.ios == _this.ios));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as RemoteConfigMinBuildNumber;
    return Object.hash(runtimeType, _this.aos, _this.ios);
  }

  @override
  String toString() {
    final _this = this as RemoteConfigMinBuildNumber;
    return 'RemoteConfigMinBuildNumber(aos: ${_this.aos}, ios: ${_this.ios})';
  }
}

/// @nodoc
abstract mixin class $RemoteConfigMinBuildNumberCopyWith<$Res> {
  factory $RemoteConfigMinBuildNumberCopyWith(RemoteConfigMinBuildNumber value,
          $Res Function(RemoteConfigMinBuildNumber) _then) =
      _$RemoteConfigMinBuildNumberCopyWithImpl;
  @useResult
  $Res call({int aos, int ios});
}

/// @nodoc
class _$RemoteConfigMinBuildNumberCopyWithImpl<$Res>
    implements $RemoteConfigMinBuildNumberCopyWith<$Res> {
  _$RemoteConfigMinBuildNumberCopyWithImpl(this._self, this._then);

  final RemoteConfigMinBuildNumber _self;
  final $Res Function(RemoteConfigMinBuildNumber) _then;

  /// Create a copy of RemoteConfigMinBuildNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aos = null,
    Object? ios = null,
  }) {
    return _then(RemoteConfigMinBuildNumber(
      aos: null == aos
          ? _self.aos
          : aos // ignore: cast_nullable_to_non_nullable
              as int,
      ios: null == ios
          ? _self.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [RemoteConfigMinBuildNumber].
extension RemoteConfigMinBuildNumberPatterns on RemoteConfigMinBuildNumber {
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
    TResult Function(_RemoteConfigMinBuildNumber value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigMinBuildNumber() when $default != null:
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
    TResult Function(_RemoteConfigMinBuildNumber value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigMinBuildNumber():
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
    TResult? Function(_RemoteConfigMinBuildNumber value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigMinBuildNumber() when $default != null:
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
    TResult Function(int aos, int ios)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigMinBuildNumber() when $default != null:
        return $default(_that.aos, _that.ios);
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
    TResult Function(int aos, int ios) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigMinBuildNumber():
        return $default(_that.aos, _that.ios);
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
    TResult? Function(int aos, int ios)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigMinBuildNumber() when $default != null:
        return $default(_that.aos, _that.ios);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RemoteConfigMinBuildNumber extends RemoteConfigMinBuildNumber {
  _RemoteConfigMinBuildNumber({this.aos = -1, this.ios = -1}) : super._();
  factory _RemoteConfigMinBuildNumber.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigMinBuildNumberFromJson(json);

  @override
  @JsonKey()
  final int aos;
  @override
  @JsonKey()
  final int ios;

  /// Create a copy of RemoteConfigMinBuildNumber
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RemoteConfigMinBuildNumberCopyWith<_RemoteConfigMinBuildNumber>
      get copyWith => __$RemoteConfigMinBuildNumberCopyWithImpl<
          _RemoteConfigMinBuildNumber>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RemoteConfigMinBuildNumberToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RemoteConfigMinBuildNumber &&
            (identical(other.aos, aos) || other.aos == aos) &&
            (identical(other.ios, ios) || other.ios == ios));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, aos, ios);
  }

  @override
  String toString() {
    return 'RemoteConfigMinBuildNumber(aos: $aos, ios: $ios)';
  }
}

/// @nodoc
abstract mixin class _$RemoteConfigMinBuildNumberCopyWith<$Res>
    implements $RemoteConfigMinBuildNumberCopyWith<$Res> {
  factory _$RemoteConfigMinBuildNumberCopyWith(
          _RemoteConfigMinBuildNumber value,
          $Res Function(_RemoteConfigMinBuildNumber) _then) =
      __$RemoteConfigMinBuildNumberCopyWithImpl;
  @override
  @useResult
  $Res call({int aos, int ios});
}

/// @nodoc
class __$RemoteConfigMinBuildNumberCopyWithImpl<$Res>
    implements _$RemoteConfigMinBuildNumberCopyWith<$Res> {
  __$RemoteConfigMinBuildNumberCopyWithImpl(this._self, this._then);

  final _RemoteConfigMinBuildNumber _self;
  final $Res Function(_RemoteConfigMinBuildNumber) _then;

  /// Create a copy of RemoteConfigMinBuildNumber
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? aos = null,
    Object? ios = null,
  }) {
    return _then(_RemoteConfigMinBuildNumber(
      aos: null == aos
          ? _self.aos
          : aos // ignore: cast_nullable_to_non_nullable
              as int,
      ios: null == ios
          ? _self.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
