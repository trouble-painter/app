// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admob.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Admob {
  String get appId;
  String get quickStartRewardId;

  /// Create a copy of Admob
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdmobCopyWith<Admob> get copyWith =>
      _$AdmobCopyWithImpl<Admob>(this as Admob, _$identity);

  /// Serializes this Admob to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as Admob;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Admob &&
            (identical(other.appId, _this.appId) ||
                other.appId == _this.appId) &&
            (identical(other.quickStartRewardId, _this.quickStartRewardId) ||
                other.quickStartRewardId == _this.quickStartRewardId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as Admob;
    return Object.hash(runtimeType, _this.appId, _this.quickStartRewardId);
  }

  @override
  String toString() {
    final _this = this as Admob;
    return 'Admob(appId: ${_this.appId}, quickStartRewardId: ${_this.quickStartRewardId})';
  }
}

/// @nodoc
abstract mixin class $AdmobCopyWith<$Res> {
  factory $AdmobCopyWith(Admob value, $Res Function(Admob) _then) =
      _$AdmobCopyWithImpl;
  @useResult
  $Res call({String appId, String quickStartRewardId});
}

/// @nodoc
class _$AdmobCopyWithImpl<$Res> implements $AdmobCopyWith<$Res> {
  _$AdmobCopyWithImpl(this._self, this._then);

  final Admob _self;
  final $Res Function(Admob) _then;

  /// Create a copy of Admob
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? quickStartRewardId = null,
  }) {
    return _then(Admob(
      appId: null == appId
          ? _self.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      quickStartRewardId: null == quickStartRewardId
          ? _self.quickStartRewardId
          : quickStartRewardId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Admob].
extension AdmobPatterns on Admob {
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
    TResult Function(_Admob value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Admob() when $default != null:
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
    TResult Function(_Admob value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Admob():
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
    TResult? Function(_Admob value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Admob() when $default != null:
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
    TResult Function(String appId, String quickStartRewardId)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Admob() when $default != null:
        return $default(_that.appId, _that.quickStartRewardId);
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
    TResult Function(String appId, String quickStartRewardId) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Admob():
        return $default(_that.appId, _that.quickStartRewardId);
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
    TResult? Function(String appId, String quickStartRewardId)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Admob() when $default != null:
        return $default(_that.appId, _that.quickStartRewardId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Admob extends Admob {
  _Admob({required this.appId, required this.quickStartRewardId}) : super._();
  factory _Admob.fromJson(Map<String, dynamic> json) => _$AdmobFromJson(json);

  @override
  final String appId;
  @override
  final String quickStartRewardId;

  /// Create a copy of Admob
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdmobCopyWith<_Admob> get copyWith =>
      __$AdmobCopyWithImpl<_Admob>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AdmobToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Admob &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.quickStartRewardId, quickStartRewardId) ||
                other.quickStartRewardId == quickStartRewardId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, appId, quickStartRewardId);
  }

  @override
  String toString() {
    return 'Admob(appId: $appId, quickStartRewardId: $quickStartRewardId)';
  }
}

/// @nodoc
abstract mixin class _$AdmobCopyWith<$Res> implements $AdmobCopyWith<$Res> {
  factory _$AdmobCopyWith(_Admob value, $Res Function(_Admob) _then) =
      __$AdmobCopyWithImpl;
  @override
  @useResult
  $Res call({String appId, String quickStartRewardId});
}

/// @nodoc
class __$AdmobCopyWithImpl<$Res> implements _$AdmobCopyWith<$Res> {
  __$AdmobCopyWithImpl(this._self, this._then);

  final _Admob _self;
  final $Res Function(_Admob) _then;

  /// Create a copy of Admob
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appId = null,
    Object? quickStartRewardId = null,
  }) {
    return _then(_Admob(
      appId: null == appId
          ? _self.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      quickStartRewardId: null == quickStartRewardId
          ? _self.quickStartRewardId
          : quickStartRewardId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
