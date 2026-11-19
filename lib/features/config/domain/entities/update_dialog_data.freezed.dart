// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_dialog_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateDialogData {
  String get title;
  String get button;
  Uri get url;

  /// Create a copy of UpdateDialogData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateDialogDataCopyWith<UpdateDialogData> get copyWith =>
      _$UpdateDialogDataCopyWithImpl<UpdateDialogData>(
          this as UpdateDialogData, _$identity);

  /// Serializes this UpdateDialogData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as UpdateDialogData;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateDialogData &&
            (identical(other.title, _this.title) ||
                other.title == _this.title) &&
            (identical(other.button, _this.button) ||
                other.button == _this.button) &&
            (identical(other.url, _this.url) || other.url == _this.url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as UpdateDialogData;
    return Object.hash(runtimeType, _this.title, _this.button, _this.url);
  }

  @override
  String toString() {
    final _this = this as UpdateDialogData;
    return 'UpdateDialogData(title: ${_this.title}, button: ${_this.button}, url: ${_this.url})';
  }
}

/// @nodoc
abstract mixin class $UpdateDialogDataCopyWith<$Res> {
  factory $UpdateDialogDataCopyWith(
          UpdateDialogData value, $Res Function(UpdateDialogData) _then) =
      _$UpdateDialogDataCopyWithImpl;
  @useResult
  $Res call({String title, String button, Uri url});
}

/// @nodoc
class _$UpdateDialogDataCopyWithImpl<$Res>
    implements $UpdateDialogDataCopyWith<$Res> {
  _$UpdateDialogDataCopyWithImpl(this._self, this._then);

  final UpdateDialogData _self;
  final $Res Function(UpdateDialogData) _then;

  /// Create a copy of UpdateDialogData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? button = null,
    Object? url = null,
  }) {
    return _then(UpdateDialogData(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      button: null == button
          ? _self.button
          : button // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// Adds pattern-matching-related methods to [UpdateDialogData].
extension UpdateDialogDataPatterns on UpdateDialogData {
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
    TResult Function(_UpdateDialogData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateDialogData() when $default != null:
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
    TResult Function(_UpdateDialogData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateDialogData():
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
    TResult? Function(_UpdateDialogData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateDialogData() when $default != null:
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
    TResult Function(String title, String button, Uri url)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateDialogData() when $default != null:
        return $default(_that.title, _that.button, _that.url);
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
    TResult Function(String title, String button, Uri url) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateDialogData():
        return $default(_that.title, _that.button, _that.url);
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
    TResult? Function(String title, String button, Uri url)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateDialogData() when $default != null:
        return $default(_that.title, _that.button, _that.url);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateDialogData extends UpdateDialogData {
  _UpdateDialogData(
      {required this.title, required this.button, required this.url})
      : super._();
  factory _UpdateDialogData.fromJson(Map<String, dynamic> json) =>
      _$UpdateDialogDataFromJson(json);

  @override
  final String title;
  @override
  final String button;
  @override
  final Uri url;

  /// Create a copy of UpdateDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateDialogDataCopyWith<_UpdateDialogData> get copyWith =>
      __$UpdateDialogDataCopyWithImpl<_UpdateDialogData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateDialogDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateDialogData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.button, button) || other.button == button) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, title, button, url);
  }

  @override
  String toString() {
    return 'UpdateDialogData(title: $title, button: $button, url: $url)';
  }
}

/// @nodoc
abstract mixin class _$UpdateDialogDataCopyWith<$Res>
    implements $UpdateDialogDataCopyWith<$Res> {
  factory _$UpdateDialogDataCopyWith(
          _UpdateDialogData value, $Res Function(_UpdateDialogData) _then) =
      __$UpdateDialogDataCopyWithImpl;
  @override
  @useResult
  $Res call({String title, String button, Uri url});
}

/// @nodoc
class __$UpdateDialogDataCopyWithImpl<$Res>
    implements _$UpdateDialogDataCopyWith<$Res> {
  __$UpdateDialogDataCopyWithImpl(this._self, this._then);

  final _UpdateDialogData _self;
  final $Res Function(_UpdateDialogData) _then;

  /// Create a copy of UpdateDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? button = null,
    Object? url = null,
  }) {
    return _then(_UpdateDialogData(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      button: null == button
          ? _self.button
          : button // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

// dart format on
