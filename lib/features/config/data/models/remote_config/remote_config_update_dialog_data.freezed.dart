// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_update_dialog_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemoteConfigUpdateDialogData {
  RemoteConfigLang get title;
  RemoteConfigLang get button;
  RemoteConfigLang get url;

  /// Create a copy of RemoteConfigUpdateDialogData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RemoteConfigUpdateDialogDataCopyWith<RemoteConfigUpdateDialogData>
      get copyWith => _$RemoteConfigUpdateDialogDataCopyWithImpl<
              RemoteConfigUpdateDialogData>(
          this as RemoteConfigUpdateDialogData, _$identity);

  /// Serializes this RemoteConfigUpdateDialogData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as RemoteConfigUpdateDialogData;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemoteConfigUpdateDialogData &&
            (identical(other.title, _this.title) ||
                other.title == _this.title) &&
            (identical(other.button, _this.button) ||
                other.button == _this.button) &&
            (identical(other.url, _this.url) || other.url == _this.url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as RemoteConfigUpdateDialogData;
    return Object.hash(runtimeType, _this.title, _this.button, _this.url);
  }

  @override
  String toString() {
    final _this = this as RemoteConfigUpdateDialogData;
    return 'RemoteConfigUpdateDialogData(title: ${_this.title}, button: ${_this.button}, url: ${_this.url})';
  }
}

/// @nodoc
abstract mixin class $RemoteConfigUpdateDialogDataCopyWith<$Res> {
  factory $RemoteConfigUpdateDialogDataCopyWith(
          RemoteConfigUpdateDialogData value,
          $Res Function(RemoteConfigUpdateDialogData) _then) =
      _$RemoteConfigUpdateDialogDataCopyWithImpl;
  @useResult
  $Res call(
      {RemoteConfigLang title, RemoteConfigLang button, RemoteConfigLang url});

  $RemoteConfigLangCopyWith<$Res> get title;
  $RemoteConfigLangCopyWith<$Res> get button;
  $RemoteConfigLangCopyWith<$Res> get url;
}

/// @nodoc
class _$RemoteConfigUpdateDialogDataCopyWithImpl<$Res>
    implements $RemoteConfigUpdateDialogDataCopyWith<$Res> {
  _$RemoteConfigUpdateDialogDataCopyWithImpl(this._self, this._then);

  final RemoteConfigUpdateDialogData _self;
  final $Res Function(RemoteConfigUpdateDialogData) _then;

  /// Create a copy of RemoteConfigUpdateDialogData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? button = null,
    Object? url = null,
  }) {
    return _then(RemoteConfigUpdateDialogData(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
      button: null == button
          ? _self.button
          : button // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
    ));
  }

  /// Create a copy of RemoteConfigUpdateDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get title {
    return $RemoteConfigLangCopyWith<$Res>(_self.title, (value) {
      return _then(_self.copyWith(title: value));
    });
  }

  /// Create a copy of RemoteConfigUpdateDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get button {
    return $RemoteConfigLangCopyWith<$Res>(_self.button, (value) {
      return _then(_self.copyWith(button: value));
    });
  }

  /// Create a copy of RemoteConfigUpdateDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get url {
    return $RemoteConfigLangCopyWith<$Res>(_self.url, (value) {
      return _then(_self.copyWith(url: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RemoteConfigUpdateDialogData].
extension RemoteConfigUpdateDialogDataPatterns on RemoteConfigUpdateDialogData {
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
    TResult Function(_RemoteConfigUpdateDialogData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigUpdateDialogData() when $default != null:
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
    TResult Function(_RemoteConfigUpdateDialogData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigUpdateDialogData():
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
    TResult? Function(_RemoteConfigUpdateDialogData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigUpdateDialogData() when $default != null:
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
    TResult Function(RemoteConfigLang title, RemoteConfigLang button,
            RemoteConfigLang url)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigUpdateDialogData() when $default != null:
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
    TResult Function(RemoteConfigLang title, RemoteConfigLang button,
            RemoteConfigLang url)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigUpdateDialogData():
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
    TResult? Function(RemoteConfigLang title, RemoteConfigLang button,
            RemoteConfigLang url)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigUpdateDialogData() when $default != null:
        return $default(_that.title, _that.button, _that.url);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RemoteConfigUpdateDialogData extends RemoteConfigUpdateDialogData {
  _RemoteConfigUpdateDialogData(
      {required this.title, required this.button, required this.url})
      : super._();
  factory _RemoteConfigUpdateDialogData.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigUpdateDialogDataFromJson(json);

  @override
  final RemoteConfigLang title;
  @override
  final RemoteConfigLang button;
  @override
  final RemoteConfigLang url;

  /// Create a copy of RemoteConfigUpdateDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RemoteConfigUpdateDialogDataCopyWith<_RemoteConfigUpdateDialogData>
      get copyWith => __$RemoteConfigUpdateDialogDataCopyWithImpl<
          _RemoteConfigUpdateDialogData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RemoteConfigUpdateDialogDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RemoteConfigUpdateDialogData &&
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
    return 'RemoteConfigUpdateDialogData(title: $title, button: $button, url: $url)';
  }
}

/// @nodoc
abstract mixin class _$RemoteConfigUpdateDialogDataCopyWith<$Res>
    implements $RemoteConfigUpdateDialogDataCopyWith<$Res> {
  factory _$RemoteConfigUpdateDialogDataCopyWith(
          _RemoteConfigUpdateDialogData value,
          $Res Function(_RemoteConfigUpdateDialogData) _then) =
      __$RemoteConfigUpdateDialogDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {RemoteConfigLang title, RemoteConfigLang button, RemoteConfigLang url});

  @override
  $RemoteConfigLangCopyWith<$Res> get title;
  @override
  $RemoteConfigLangCopyWith<$Res> get button;
  @override
  $RemoteConfigLangCopyWith<$Res> get url;
}

/// @nodoc
class __$RemoteConfigUpdateDialogDataCopyWithImpl<$Res>
    implements _$RemoteConfigUpdateDialogDataCopyWith<$Res> {
  __$RemoteConfigUpdateDialogDataCopyWithImpl(this._self, this._then);

  final _RemoteConfigUpdateDialogData _self;
  final $Res Function(_RemoteConfigUpdateDialogData) _then;

  /// Create a copy of RemoteConfigUpdateDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? button = null,
    Object? url = null,
  }) {
    return _then(_RemoteConfigUpdateDialogData(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
      button: null == button
          ? _self.button
          : button // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
    ));
  }

  /// Create a copy of RemoteConfigUpdateDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get title {
    return $RemoteConfigLangCopyWith<$Res>(_self.title, (value) {
      return _then(_self.copyWith(title: value));
    });
  }

  /// Create a copy of RemoteConfigUpdateDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get button {
    return $RemoteConfigLangCopyWith<$Res>(_self.button, (value) {
      return _then(_self.copyWith(button: value));
    });
  }

  /// Create a copy of RemoteConfigUpdateDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get url {
    return $RemoteConfigLangCopyWith<$Res>(_self.url, (value) {
      return _then(_self.copyWith(url: value));
    });
  }
}

// dart format on
