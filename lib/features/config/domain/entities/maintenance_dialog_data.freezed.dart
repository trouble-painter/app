// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_dialog_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MaintenanceDialogData {
  DateTime get startedAt;
  DateTime get endedAt;
  String get title;

  /// Create a copy of MaintenanceDialogData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MaintenanceDialogDataCopyWith<MaintenanceDialogData> get copyWith =>
      _$MaintenanceDialogDataCopyWithImpl<MaintenanceDialogData>(
          this as MaintenanceDialogData, _$identity);

  /// Serializes this MaintenanceDialogData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as MaintenanceDialogData;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MaintenanceDialogData &&
            (identical(other.startedAt, _this.startedAt) ||
                other.startedAt == _this.startedAt) &&
            (identical(other.endedAt, _this.endedAt) ||
                other.endedAt == _this.endedAt) &&
            (identical(other.title, _this.title) ||
                other.title == _this.title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as MaintenanceDialogData;
    return Object.hash(
        runtimeType, _this.startedAt, _this.endedAt, _this.title);
  }

  @override
  String toString() {
    final _this = this as MaintenanceDialogData;
    return 'MaintenanceDialogData(startedAt: ${_this.startedAt}, endedAt: ${_this.endedAt}, title: ${_this.title})';
  }
}

/// @nodoc
abstract mixin class $MaintenanceDialogDataCopyWith<$Res> {
  factory $MaintenanceDialogDataCopyWith(MaintenanceDialogData value,
          $Res Function(MaintenanceDialogData) _then) =
      _$MaintenanceDialogDataCopyWithImpl;
  @useResult
  $Res call({DateTime startedAt, DateTime endedAt, String title});
}

/// @nodoc
class _$MaintenanceDialogDataCopyWithImpl<$Res>
    implements $MaintenanceDialogDataCopyWith<$Res> {
  _$MaintenanceDialogDataCopyWithImpl(this._self, this._then);

  final MaintenanceDialogData _self;
  final $Res Function(MaintenanceDialogData) _then;

  /// Create a copy of MaintenanceDialogData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startedAt = null,
    Object? endedAt = null,
    Object? title = null,
  }) {
    return _then(MaintenanceDialogData(
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endedAt: null == endedAt
          ? _self.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [MaintenanceDialogData].
extension MaintenanceDialogDataPatterns on MaintenanceDialogData {
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
    TResult Function(_MaintenanceDialogData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MaintenanceDialogData() when $default != null:
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
    TResult Function(_MaintenanceDialogData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MaintenanceDialogData():
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
    TResult? Function(_MaintenanceDialogData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MaintenanceDialogData() when $default != null:
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
    TResult Function(DateTime startedAt, DateTime endedAt, String title)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MaintenanceDialogData() when $default != null:
        return $default(_that.startedAt, _that.endedAt, _that.title);
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
    TResult Function(DateTime startedAt, DateTime endedAt, String title)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MaintenanceDialogData():
        return $default(_that.startedAt, _that.endedAt, _that.title);
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
    TResult? Function(DateTime startedAt, DateTime endedAt, String title)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MaintenanceDialogData() when $default != null:
        return $default(_that.startedAt, _that.endedAt, _that.title);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MaintenanceDialogData extends MaintenanceDialogData {
  _MaintenanceDialogData(
      {required this.startedAt, required this.endedAt, required this.title})
      : super._();
  factory _MaintenanceDialogData.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceDialogDataFromJson(json);

  @override
  final DateTime startedAt;
  @override
  final DateTime endedAt;
  @override
  final String title;

  /// Create a copy of MaintenanceDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MaintenanceDialogDataCopyWith<_MaintenanceDialogData> get copyWith =>
      __$MaintenanceDialogDataCopyWithImpl<_MaintenanceDialogData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MaintenanceDialogDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MaintenanceDialogData &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, startedAt, endedAt, title);
  }

  @override
  String toString() {
    return 'MaintenanceDialogData(startedAt: $startedAt, endedAt: $endedAt, title: $title)';
  }
}

/// @nodoc
abstract mixin class _$MaintenanceDialogDataCopyWith<$Res>
    implements $MaintenanceDialogDataCopyWith<$Res> {
  factory _$MaintenanceDialogDataCopyWith(_MaintenanceDialogData value,
          $Res Function(_MaintenanceDialogData) _then) =
      __$MaintenanceDialogDataCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime startedAt, DateTime endedAt, String title});
}

/// @nodoc
class __$MaintenanceDialogDataCopyWithImpl<$Res>
    implements _$MaintenanceDialogDataCopyWith<$Res> {
  __$MaintenanceDialogDataCopyWithImpl(this._self, this._then);

  final _MaintenanceDialogData _self;
  final $Res Function(_MaintenanceDialogData) _then;

  /// Create a copy of MaintenanceDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startedAt = null,
    Object? endedAt = null,
    Object? title = null,
  }) {
    return _then(_MaintenanceDialogData(
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endedAt: null == endedAt
          ? _self.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
