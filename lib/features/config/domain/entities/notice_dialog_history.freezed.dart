// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_dialog_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NoticeDialogHistory {
  int get version;
  DateTime get exposedAt;

  /// Create a copy of NoticeDialogHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NoticeDialogHistoryCopyWith<NoticeDialogHistory> get copyWith =>
      _$NoticeDialogHistoryCopyWithImpl<NoticeDialogHistory>(
          this as NoticeDialogHistory, _$identity);

  /// Serializes this NoticeDialogHistory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as NoticeDialogHistory;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NoticeDialogHistory &&
            (identical(other.version, _this.version) ||
                other.version == _this.version) &&
            (identical(other.exposedAt, _this.exposedAt) ||
                other.exposedAt == _this.exposedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as NoticeDialogHistory;
    return Object.hash(runtimeType, _this.version, _this.exposedAt);
  }

  @override
  String toString() {
    final _this = this as NoticeDialogHistory;
    return 'NoticeDialogHistory(version: ${_this.version}, exposedAt: ${_this.exposedAt})';
  }
}

/// @nodoc
abstract mixin class $NoticeDialogHistoryCopyWith<$Res> {
  factory $NoticeDialogHistoryCopyWith(
          NoticeDialogHistory value, $Res Function(NoticeDialogHistory) _then) =
      _$NoticeDialogHistoryCopyWithImpl;
  @useResult
  $Res call({int version, DateTime exposedAt});
}

/// @nodoc
class _$NoticeDialogHistoryCopyWithImpl<$Res>
    implements $NoticeDialogHistoryCopyWith<$Res> {
  _$NoticeDialogHistoryCopyWithImpl(this._self, this._then);

  final NoticeDialogHistory _self;
  final $Res Function(NoticeDialogHistory) _then;

  /// Create a copy of NoticeDialogHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? exposedAt = null,
  }) {
    return _then(NoticeDialogHistory(
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      exposedAt: null == exposedAt
          ? _self.exposedAt
          : exposedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [NoticeDialogHistory].
extension NoticeDialogHistoryPatterns on NoticeDialogHistory {
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
    TResult Function(_NoticeDialogHistory value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NoticeDialogHistory() when $default != null:
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
    TResult Function(_NoticeDialogHistory value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NoticeDialogHistory():
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
    TResult? Function(_NoticeDialogHistory value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NoticeDialogHistory() when $default != null:
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
    TResult Function(int version, DateTime exposedAt)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NoticeDialogHistory() when $default != null:
        return $default(_that.version, _that.exposedAt);
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
    TResult Function(int version, DateTime exposedAt) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NoticeDialogHistory():
        return $default(_that.version, _that.exposedAt);
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
    TResult? Function(int version, DateTime exposedAt)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NoticeDialogHistory() when $default != null:
        return $default(_that.version, _that.exposedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NoticeDialogHistory extends NoticeDialogHistory {
  _NoticeDialogHistory({required this.version, required this.exposedAt})
      : super._();
  factory _NoticeDialogHistory.fromJson(Map<String, dynamic> json) =>
      _$NoticeDialogHistoryFromJson(json);

  @override
  final int version;
  @override
  final DateTime exposedAt;

  /// Create a copy of NoticeDialogHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NoticeDialogHistoryCopyWith<_NoticeDialogHistory> get copyWith =>
      __$NoticeDialogHistoryCopyWithImpl<_NoticeDialogHistory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NoticeDialogHistoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoticeDialogHistory &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.exposedAt, exposedAt) ||
                other.exposedAt == exposedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, version, exposedAt);
  }

  @override
  String toString() {
    return 'NoticeDialogHistory(version: $version, exposedAt: $exposedAt)';
  }
}

/// @nodoc
abstract mixin class _$NoticeDialogHistoryCopyWith<$Res>
    implements $NoticeDialogHistoryCopyWith<$Res> {
  factory _$NoticeDialogHistoryCopyWith(_NoticeDialogHistory value,
          $Res Function(_NoticeDialogHistory) _then) =
      __$NoticeDialogHistoryCopyWithImpl;
  @override
  @useResult
  $Res call({int version, DateTime exposedAt});
}

/// @nodoc
class __$NoticeDialogHistoryCopyWithImpl<$Res>
    implements _$NoticeDialogHistoryCopyWith<$Res> {
  __$NoticeDialogHistoryCopyWithImpl(this._self, this._then);

  final _NoticeDialogHistory _self;
  final $Res Function(_NoticeDialogHistory) _then;

  /// Create a copy of NoticeDialogHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? version = null,
    Object? exposedAt = null,
  }) {
    return _then(_NoticeDialogHistory(
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      exposedAt: null == exposedAt
          ? _self.exposedAt
          : exposedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
