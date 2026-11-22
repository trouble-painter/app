// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_maintenance_dialog_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemoteConfigMaintenanceDialogData {
  DateTime get startedAt;
  DateTime get endedAt;
  RemoteConfigLang get title;

  /// Create a copy of RemoteConfigMaintenanceDialogData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RemoteConfigMaintenanceDialogDataCopyWith<RemoteConfigMaintenanceDialogData>
      get copyWith => _$RemoteConfigMaintenanceDialogDataCopyWithImpl<
              RemoteConfigMaintenanceDialogData>(
          this as RemoteConfigMaintenanceDialogData, _$identity);

  /// Serializes this RemoteConfigMaintenanceDialogData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as RemoteConfigMaintenanceDialogData;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemoteConfigMaintenanceDialogData &&
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
    final _this = this as RemoteConfigMaintenanceDialogData;
    return Object.hash(
        runtimeType, _this.startedAt, _this.endedAt, _this.title);
  }

  @override
  String toString() {
    final _this = this as RemoteConfigMaintenanceDialogData;
    return 'RemoteConfigMaintenanceDialogData(startedAt: ${_this.startedAt}, endedAt: ${_this.endedAt}, title: ${_this.title})';
  }
}

/// @nodoc
abstract mixin class $RemoteConfigMaintenanceDialogDataCopyWith<$Res> {
  factory $RemoteConfigMaintenanceDialogDataCopyWith(
          RemoteConfigMaintenanceDialogData value,
          $Res Function(RemoteConfigMaintenanceDialogData) _then) =
      _$RemoteConfigMaintenanceDialogDataCopyWithImpl;
  @useResult
  $Res call({DateTime startedAt, DateTime endedAt, RemoteConfigLang title});

  $RemoteConfigLangCopyWith<$Res> get title;
}

/// @nodoc
class _$RemoteConfigMaintenanceDialogDataCopyWithImpl<$Res>
    implements $RemoteConfigMaintenanceDialogDataCopyWith<$Res> {
  _$RemoteConfigMaintenanceDialogDataCopyWithImpl(this._self, this._then);

  final RemoteConfigMaintenanceDialogData _self;
  final $Res Function(RemoteConfigMaintenanceDialogData) _then;

  /// Create a copy of RemoteConfigMaintenanceDialogData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startedAt = null,
    Object? endedAt = null,
    Object? title = null,
  }) {
    return _then(RemoteConfigMaintenanceDialogData(
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
              as RemoteConfigLang,
    ));
  }

  /// Create a copy of RemoteConfigMaintenanceDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get title {
    return $RemoteConfigLangCopyWith<$Res>(_self.title, (value) {
      return _then(_self.copyWith(title: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RemoteConfigMaintenanceDialogData].
extension RemoteConfigMaintenanceDialogDataPatterns
    on RemoteConfigMaintenanceDialogData {
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
    TResult Function(_RemoteConfigMaintenanceDialogData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigMaintenanceDialogData() when $default != null:
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
    TResult Function(_RemoteConfigMaintenanceDialogData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigMaintenanceDialogData():
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
    TResult? Function(_RemoteConfigMaintenanceDialogData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigMaintenanceDialogData() when $default != null:
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
            DateTime startedAt, DateTime endedAt, RemoteConfigLang title)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigMaintenanceDialogData() when $default != null:
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
    TResult Function(
            DateTime startedAt, DateTime endedAt, RemoteConfigLang title)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigMaintenanceDialogData():
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
    TResult? Function(
            DateTime startedAt, DateTime endedAt, RemoteConfigLang title)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigMaintenanceDialogData() when $default != null:
        return $default(_that.startedAt, _that.endedAt, _that.title);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RemoteConfigMaintenanceDialogData
    extends RemoteConfigMaintenanceDialogData {
  _RemoteConfigMaintenanceDialogData(
      {required this.startedAt, required this.endedAt, required this.title})
      : super._();
  factory _RemoteConfigMaintenanceDialogData.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteConfigMaintenanceDialogDataFromJson(json);

  @override
  final DateTime startedAt;
  @override
  final DateTime endedAt;
  @override
  final RemoteConfigLang title;

  /// Create a copy of RemoteConfigMaintenanceDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RemoteConfigMaintenanceDialogDataCopyWith<
          _RemoteConfigMaintenanceDialogData>
      get copyWith => __$RemoteConfigMaintenanceDialogDataCopyWithImpl<
          _RemoteConfigMaintenanceDialogData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RemoteConfigMaintenanceDialogDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RemoteConfigMaintenanceDialogData &&
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
    return 'RemoteConfigMaintenanceDialogData(startedAt: $startedAt, endedAt: $endedAt, title: $title)';
  }
}

/// @nodoc
abstract mixin class _$RemoteConfigMaintenanceDialogDataCopyWith<$Res>
    implements $RemoteConfigMaintenanceDialogDataCopyWith<$Res> {
  factory _$RemoteConfigMaintenanceDialogDataCopyWith(
          _RemoteConfigMaintenanceDialogData value,
          $Res Function(_RemoteConfigMaintenanceDialogData) _then) =
      __$RemoteConfigMaintenanceDialogDataCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime startedAt, DateTime endedAt, RemoteConfigLang title});

  @override
  $RemoteConfigLangCopyWith<$Res> get title;
}

/// @nodoc
class __$RemoteConfigMaintenanceDialogDataCopyWithImpl<$Res>
    implements _$RemoteConfigMaintenanceDialogDataCopyWith<$Res> {
  __$RemoteConfigMaintenanceDialogDataCopyWithImpl(this._self, this._then);

  final _RemoteConfigMaintenanceDialogData _self;
  final $Res Function(_RemoteConfigMaintenanceDialogData) _then;

  /// Create a copy of RemoteConfigMaintenanceDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startedAt = null,
    Object? endedAt = null,
    Object? title = null,
  }) {
    return _then(_RemoteConfigMaintenanceDialogData(
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
              as RemoteConfigLang,
    ));
  }

  /// Create a copy of RemoteConfigMaintenanceDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get title {
    return $RemoteConfigLangCopyWith<$Res>(_self.title, (value) {
      return _then(_self.copyWith(title: value));
    });
  }
}

// dart format on
