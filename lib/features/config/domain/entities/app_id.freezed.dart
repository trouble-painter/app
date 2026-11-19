// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppId {
  String get aos;
  String get ios;

  /// Create a copy of AppId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppIdCopyWith<AppId> get copyWith =>
      _$AppIdCopyWithImpl<AppId>(this as AppId, _$identity);

  /// Serializes this AppId to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as AppId;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppId &&
            (identical(other.aos, _this.aos) || other.aos == _this.aos) &&
            (identical(other.ios, _this.ios) || other.ios == _this.ios));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as AppId;
    return Object.hash(runtimeType, _this.aos, _this.ios);
  }

  @override
  String toString() {
    final _this = this as AppId;
    return 'AppId(aos: ${_this.aos}, ios: ${_this.ios})';
  }
}

/// @nodoc
abstract mixin class $AppIdCopyWith<$Res> {
  factory $AppIdCopyWith(AppId value, $Res Function(AppId) _then) =
      _$AppIdCopyWithImpl;
  @useResult
  $Res call({String aos, String ios});
}

/// @nodoc
class _$AppIdCopyWithImpl<$Res> implements $AppIdCopyWith<$Res> {
  _$AppIdCopyWithImpl(this._self, this._then);

  final AppId _self;
  final $Res Function(AppId) _then;

  /// Create a copy of AppId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aos = null,
    Object? ios = null,
  }) {
    return _then(AppId(
      aos: null == aos
          ? _self.aos
          : aos // ignore: cast_nullable_to_non_nullable
              as String,
      ios: null == ios
          ? _self.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [AppId].
extension AppIdPatterns on AppId {
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
    TResult Function(_AppId value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppId() when $default != null:
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
    TResult Function(_AppId value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppId():
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
    TResult? Function(_AppId value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppId() when $default != null:
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
    TResult Function(String aos, String ios)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppId() when $default != null:
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
    TResult Function(String aos, String ios) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppId():
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
    TResult? Function(String aos, String ios)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppId() when $default != null:
        return $default(_that.aos, _that.ios);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AppId extends AppId {
  _AppId({required this.aos, required this.ios}) : super._();
  factory _AppId.fromJson(Map<String, dynamic> json) => _$AppIdFromJson(json);

  @override
  final String aos;
  @override
  final String ios;

  /// Create a copy of AppId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppIdCopyWith<_AppId> get copyWith =>
      __$AppIdCopyWithImpl<_AppId>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppIdToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppId &&
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
    return 'AppId(aos: $aos, ios: $ios)';
  }
}

/// @nodoc
abstract mixin class _$AppIdCopyWith<$Res> implements $AppIdCopyWith<$Res> {
  factory _$AppIdCopyWith(_AppId value, $Res Function(_AppId) _then) =
      __$AppIdCopyWithImpl;
  @override
  @useResult
  $Res call({String aos, String ios});
}

/// @nodoc
class __$AppIdCopyWithImpl<$Res> implements _$AppIdCopyWith<$Res> {
  __$AppIdCopyWithImpl(this._self, this._then);

  final _AppId _self;
  final $Res Function(_AppId) _then;

  /// Create a copy of AppId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? aos = null,
    Object? ios = null,
  }) {
    return _then(_AppId(
      aos: null == aos
          ? _self.aos
          : aos // ignore: cast_nullable_to_non_nullable
              as String,
      ios: null == ios
          ? _self.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
