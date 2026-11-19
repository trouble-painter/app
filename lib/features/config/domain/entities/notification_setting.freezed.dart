// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationSetting {
  /// Whether to disable the quick startup notification function
  bool get disableQuickStartNoti;

  /// Whether to receive quick start notifications
  bool get receiveQuickStartNoti;

  /// Create a copy of NotificationSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationSettingCopyWith<NotificationSetting> get copyWith =>
      _$NotificationSettingCopyWithImpl<NotificationSetting>(
          this as NotificationSetting, _$identity);

  /// Serializes this NotificationSetting to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as NotificationSetting;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationSetting &&
            (identical(
                    other.disableQuickStartNoti, _this.disableQuickStartNoti) ||
                other.disableQuickStartNoti == _this.disableQuickStartNoti) &&
            (identical(
                    other.receiveQuickStartNoti, _this.receiveQuickStartNoti) ||
                other.receiveQuickStartNoti == _this.receiveQuickStartNoti));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as NotificationSetting;
    return Object.hash(
        runtimeType, _this.disableQuickStartNoti, _this.receiveQuickStartNoti);
  }

  @override
  String toString() {
    final _this = this as NotificationSetting;
    return 'NotificationSetting(disableQuickStartNoti: ${_this.disableQuickStartNoti}, receiveQuickStartNoti: ${_this.receiveQuickStartNoti})';
  }
}

/// @nodoc
abstract mixin class $NotificationSettingCopyWith<$Res> {
  factory $NotificationSettingCopyWith(
          NotificationSetting value, $Res Function(NotificationSetting) _then) =
      _$NotificationSettingCopyWithImpl;
  @useResult
  $Res call({bool disableQuickStartNoti, bool receiveQuickStartNoti});
}

/// @nodoc
class _$NotificationSettingCopyWithImpl<$Res>
    implements $NotificationSettingCopyWith<$Res> {
  _$NotificationSettingCopyWithImpl(this._self, this._then);

  final NotificationSetting _self;
  final $Res Function(NotificationSetting) _then;

  /// Create a copy of NotificationSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disableQuickStartNoti = null,
    Object? receiveQuickStartNoti = null,
  }) {
    return _then(NotificationSetting(
      disableQuickStartNoti: null == disableQuickStartNoti
          ? _self.disableQuickStartNoti
          : disableQuickStartNoti // ignore: cast_nullable_to_non_nullable
              as bool,
      receiveQuickStartNoti: null == receiveQuickStartNoti
          ? _self.receiveQuickStartNoti
          : receiveQuickStartNoti // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [NotificationSetting].
extension NotificationSettingPatterns on NotificationSetting {
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
    TResult Function(_NotificationSetting value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationSetting() when $default != null:
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
    TResult Function(_NotificationSetting value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationSetting():
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
    TResult? Function(_NotificationSetting value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationSetting() when $default != null:
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
    TResult Function(bool disableQuickStartNoti, bool receiveQuickStartNoti)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationSetting() when $default != null:
        return $default(
            _that.disableQuickStartNoti, _that.receiveQuickStartNoti);
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
    TResult Function(bool disableQuickStartNoti, bool receiveQuickStartNoti)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationSetting():
        return $default(
            _that.disableQuickStartNoti, _that.receiveQuickStartNoti);
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
    TResult? Function(bool disableQuickStartNoti, bool receiveQuickStartNoti)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationSetting() when $default != null:
        return $default(
            _that.disableQuickStartNoti, _that.receiveQuickStartNoti);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NotificationSetting extends NotificationSetting {
  _NotificationSetting(
      {required this.disableQuickStartNoti,
      required this.receiveQuickStartNoti})
      : super._();
  factory _NotificationSetting.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingFromJson(json);

  /// Whether to disable the quick startup notification function
  @override
  final bool disableQuickStartNoti;

  /// Whether to receive quick start notifications
  @override
  final bool receiveQuickStartNoti;

  /// Create a copy of NotificationSetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationSettingCopyWith<_NotificationSetting> get copyWith =>
      __$NotificationSettingCopyWithImpl<_NotificationSetting>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationSettingToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationSetting &&
            (identical(other.disableQuickStartNoti, disableQuickStartNoti) ||
                other.disableQuickStartNoti == disableQuickStartNoti) &&
            (identical(other.receiveQuickStartNoti, receiveQuickStartNoti) ||
                other.receiveQuickStartNoti == receiveQuickStartNoti));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
        runtimeType, disableQuickStartNoti, receiveQuickStartNoti);
  }

  @override
  String toString() {
    return 'NotificationSetting(disableQuickStartNoti: $disableQuickStartNoti, receiveQuickStartNoti: $receiveQuickStartNoti)';
  }
}

/// @nodoc
abstract mixin class _$NotificationSettingCopyWith<$Res>
    implements $NotificationSettingCopyWith<$Res> {
  factory _$NotificationSettingCopyWith(_NotificationSetting value,
          $Res Function(_NotificationSetting) _then) =
      __$NotificationSettingCopyWithImpl;
  @override
  @useResult
  $Res call({bool disableQuickStartNoti, bool receiveQuickStartNoti});
}

/// @nodoc
class __$NotificationSettingCopyWithImpl<$Res>
    implements _$NotificationSettingCopyWith<$Res> {
  __$NotificationSettingCopyWithImpl(this._self, this._then);

  final _NotificationSetting _self;
  final $Res Function(_NotificationSetting) _then;

  /// Create a copy of NotificationSetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? disableQuickStartNoti = null,
    Object? receiveQuickStartNoti = null,
  }) {
    return _then(_NotificationSetting(
      disableQuickStartNoti: null == disableQuickStartNoti
          ? _self.disableQuickStartNoti
          : disableQuickStartNoti // ignore: cast_nullable_to_non_nullable
              as bool,
      receiveQuickStartNoti: null == receiveQuickStartNoti
          ? _self.receiveQuickStartNoti
          : receiveQuickStartNoti // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
