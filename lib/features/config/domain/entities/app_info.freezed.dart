// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppInfo {
  String get packageName;
  String get version;
  int get buildNumber;

  /// Create a copy of AppInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppInfoCopyWith<AppInfo> get copyWith =>
      _$AppInfoCopyWithImpl<AppInfo>(this as AppInfo, _$identity);

  /// Serializes this AppInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as AppInfo;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppInfo &&
            (identical(other.packageName, _this.packageName) ||
                other.packageName == _this.packageName) &&
            (identical(other.version, _this.version) ||
                other.version == _this.version) &&
            (identical(other.buildNumber, _this.buildNumber) ||
                other.buildNumber == _this.buildNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as AppInfo;
    return Object.hash(
        runtimeType, _this.packageName, _this.version, _this.buildNumber);
  }

  @override
  String toString() {
    final _this = this as AppInfo;
    return 'AppInfo(packageName: ${_this.packageName}, version: ${_this.version}, buildNumber: ${_this.buildNumber})';
  }
}

/// @nodoc
abstract mixin class $AppInfoCopyWith<$Res> {
  factory $AppInfoCopyWith(AppInfo value, $Res Function(AppInfo) _then) =
      _$AppInfoCopyWithImpl;
  @useResult
  $Res call({String packageName, String version, int buildNumber});
}

/// @nodoc
class _$AppInfoCopyWithImpl<$Res> implements $AppInfoCopyWith<$Res> {
  _$AppInfoCopyWithImpl(this._self, this._then);

  final AppInfo _self;
  final $Res Function(AppInfo) _then;

  /// Create a copy of AppInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageName = null,
    Object? version = null,
    Object? buildNumber = null,
  }) {
    return _then(AppInfo(
      packageName: null == packageName
          ? _self.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: null == buildNumber
          ? _self.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [AppInfo].
extension AppInfoPatterns on AppInfo {
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
    TResult Function(_AppInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppInfo() when $default != null:
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
    TResult Function(_AppInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppInfo():
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
    TResult? Function(_AppInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppInfo() when $default != null:
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
    TResult Function(String packageName, String version, int buildNumber)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppInfo() when $default != null:
        return $default(_that.packageName, _that.version, _that.buildNumber);
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
    TResult Function(String packageName, String version, int buildNumber)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppInfo():
        return $default(_that.packageName, _that.version, _that.buildNumber);
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
    TResult? Function(String packageName, String version, int buildNumber)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppInfo() when $default != null:
        return $default(_that.packageName, _that.version, _that.buildNumber);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AppInfo extends AppInfo {
  _AppInfo(
      {required this.packageName,
      required this.version,
      required this.buildNumber})
      : super._();
  factory _AppInfo.fromJson(Map<String, dynamic> json) =>
      _$AppInfoFromJson(json);

  @override
  final String packageName;
  @override
  final String version;
  @override
  final int buildNumber;

  /// Create a copy of AppInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppInfoCopyWith<_AppInfo> get copyWith =>
      __$AppInfoCopyWithImpl<_AppInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppInfo &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.buildNumber, buildNumber) ||
                other.buildNumber == buildNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, packageName, version, buildNumber);
  }

  @override
  String toString() {
    return 'AppInfo(packageName: $packageName, version: $version, buildNumber: $buildNumber)';
  }
}

/// @nodoc
abstract mixin class _$AppInfoCopyWith<$Res> implements $AppInfoCopyWith<$Res> {
  factory _$AppInfoCopyWith(_AppInfo value, $Res Function(_AppInfo) _then) =
      __$AppInfoCopyWithImpl;
  @override
  @useResult
  $Res call({String packageName, String version, int buildNumber});
}

/// @nodoc
class __$AppInfoCopyWithImpl<$Res> implements _$AppInfoCopyWith<$Res> {
  __$AppInfoCopyWithImpl(this._self, this._then);

  final _AppInfo _self;
  final $Res Function(_AppInfo) _then;

  /// Create a copy of AppInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? packageName = null,
    Object? version = null,
    Object? buildNumber = null,
  }) {
    return _then(_AppInfo(
      packageName: null == packageName
          ? _self.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: null == buildNumber
          ? _self.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
