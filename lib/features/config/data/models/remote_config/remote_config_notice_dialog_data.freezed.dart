// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_notice_dialog_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemoteConfigNoticeDialogData {
  int get version;
  int get exposureIntervalHour;
  bool get isShow;
  DateTime get startedAt;
  DateTime get endedAt;
  RemoteConfigLang get title;
  RemoteConfigLang get desc;
  RemoteConfigLang get url;

  /// Create a copy of RemoteConfigNoticeDialogData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RemoteConfigNoticeDialogDataCopyWith<RemoteConfigNoticeDialogData>
      get copyWith => _$RemoteConfigNoticeDialogDataCopyWithImpl<
              RemoteConfigNoticeDialogData>(
          this as RemoteConfigNoticeDialogData, _$identity);

  /// Serializes this RemoteConfigNoticeDialogData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as RemoteConfigNoticeDialogData;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemoteConfigNoticeDialogData &&
            (identical(other.version, _this.version) ||
                other.version == _this.version) &&
            (identical(
                    other.exposureIntervalHour, _this.exposureIntervalHour) ||
                other.exposureIntervalHour == _this.exposureIntervalHour) &&
            (identical(other.isShow, _this.isShow) ||
                other.isShow == _this.isShow) &&
            (identical(other.startedAt, _this.startedAt) ||
                other.startedAt == _this.startedAt) &&
            (identical(other.endedAt, _this.endedAt) ||
                other.endedAt == _this.endedAt) &&
            (identical(other.title, _this.title) ||
                other.title == _this.title) &&
            (identical(other.desc, _this.desc) || other.desc == _this.desc) &&
            (identical(other.url, _this.url) || other.url == _this.url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as RemoteConfigNoticeDialogData;
    return Object.hash(
        runtimeType,
        _this.version,
        _this.exposureIntervalHour,
        _this.isShow,
        _this.startedAt,
        _this.endedAt,
        _this.title,
        _this.desc,
        _this.url);
  }

  @override
  String toString() {
    final _this = this as RemoteConfigNoticeDialogData;
    return 'RemoteConfigNoticeDialogData(version: ${_this.version}, exposureIntervalHour: ${_this.exposureIntervalHour}, isShow: ${_this.isShow}, startedAt: ${_this.startedAt}, endedAt: ${_this.endedAt}, title: ${_this.title}, desc: ${_this.desc}, url: ${_this.url})';
  }
}

/// @nodoc
abstract mixin class $RemoteConfigNoticeDialogDataCopyWith<$Res> {
  factory $RemoteConfigNoticeDialogDataCopyWith(
          RemoteConfigNoticeDialogData value,
          $Res Function(RemoteConfigNoticeDialogData) _then) =
      _$RemoteConfigNoticeDialogDataCopyWithImpl;
  @useResult
  $Res call(
      {int version,
      int exposureIntervalHour,
      bool isShow,
      DateTime startedAt,
      DateTime endedAt,
      RemoteConfigLang title,
      RemoteConfigLang desc,
      RemoteConfigLang url});

  $RemoteConfigLangCopyWith<$Res> get title;
  $RemoteConfigLangCopyWith<$Res> get desc;
  $RemoteConfigLangCopyWith<$Res> get url;
}

/// @nodoc
class _$RemoteConfigNoticeDialogDataCopyWithImpl<$Res>
    implements $RemoteConfigNoticeDialogDataCopyWith<$Res> {
  _$RemoteConfigNoticeDialogDataCopyWithImpl(this._self, this._then);

  final RemoteConfigNoticeDialogData _self;
  final $Res Function(RemoteConfigNoticeDialogData) _then;

  /// Create a copy of RemoteConfigNoticeDialogData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? exposureIntervalHour = null,
    Object? isShow = null,
    Object? startedAt = null,
    Object? endedAt = null,
    Object? title = null,
    Object? desc = null,
    Object? url = null,
  }) {
    return _then(RemoteConfigNoticeDialogData(
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      exposureIntervalHour: null == exposureIntervalHour
          ? _self.exposureIntervalHour
          : exposureIntervalHour // ignore: cast_nullable_to_non_nullable
              as int,
      isShow: null == isShow
          ? _self.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
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
      desc: null == desc
          ? _self.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
    ));
  }

  /// Create a copy of RemoteConfigNoticeDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get title {
    return $RemoteConfigLangCopyWith<$Res>(_self.title, (value) {
      return _then(_self.copyWith(title: value));
    });
  }

  /// Create a copy of RemoteConfigNoticeDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get desc {
    return $RemoteConfigLangCopyWith<$Res>(_self.desc, (value) {
      return _then(_self.copyWith(desc: value));
    });
  }

  /// Create a copy of RemoteConfigNoticeDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get url {
    return $RemoteConfigLangCopyWith<$Res>(_self.url, (value) {
      return _then(_self.copyWith(url: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RemoteConfigNoticeDialogData].
extension RemoteConfigNoticeDialogDataPatterns on RemoteConfigNoticeDialogData {
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
    TResult Function(_RemoteConfigNoticeDialogData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigNoticeDialogData() when $default != null:
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
    TResult Function(_RemoteConfigNoticeDialogData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigNoticeDialogData():
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
    TResult? Function(_RemoteConfigNoticeDialogData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigNoticeDialogData() when $default != null:
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
            int version,
            int exposureIntervalHour,
            bool isShow,
            DateTime startedAt,
            DateTime endedAt,
            RemoteConfigLang title,
            RemoteConfigLang desc,
            RemoteConfigLang url)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigNoticeDialogData() when $default != null:
        return $default(_that.version, _that.exposureIntervalHour, _that.isShow,
            _that.startedAt, _that.endedAt, _that.title, _that.desc, _that.url);
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
            int version,
            int exposureIntervalHour,
            bool isShow,
            DateTime startedAt,
            DateTime endedAt,
            RemoteConfigLang title,
            RemoteConfigLang desc,
            RemoteConfigLang url)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigNoticeDialogData():
        return $default(_that.version, _that.exposureIntervalHour, _that.isShow,
            _that.startedAt, _that.endedAt, _that.title, _that.desc, _that.url);
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
            int version,
            int exposureIntervalHour,
            bool isShow,
            DateTime startedAt,
            DateTime endedAt,
            RemoteConfigLang title,
            RemoteConfigLang desc,
            RemoteConfigLang url)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigNoticeDialogData() when $default != null:
        return $default(_that.version, _that.exposureIntervalHour, _that.isShow,
            _that.startedAt, _that.endedAt, _that.title, _that.desc, _that.url);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RemoteConfigNoticeDialogData extends RemoteConfigNoticeDialogData {
  _RemoteConfigNoticeDialogData(
      {required this.version,
      required this.exposureIntervalHour,
      required this.isShow,
      required this.startedAt,
      required this.endedAt,
      required this.title,
      required this.desc,
      required this.url})
      : super._();
  factory _RemoteConfigNoticeDialogData.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigNoticeDialogDataFromJson(json);

  @override
  final int version;
  @override
  final int exposureIntervalHour;
  @override
  final bool isShow;
  @override
  final DateTime startedAt;
  @override
  final DateTime endedAt;
  @override
  final RemoteConfigLang title;
  @override
  final RemoteConfigLang desc;
  @override
  final RemoteConfigLang url;

  /// Create a copy of RemoteConfigNoticeDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RemoteConfigNoticeDialogDataCopyWith<_RemoteConfigNoticeDialogData>
      get copyWith => __$RemoteConfigNoticeDialogDataCopyWithImpl<
          _RemoteConfigNoticeDialogData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RemoteConfigNoticeDialogDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RemoteConfigNoticeDialogData &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.exposureIntervalHour, exposureIntervalHour) ||
                other.exposureIntervalHour == exposureIntervalHour) &&
            (identical(other.isShow, isShow) || other.isShow == isShow) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, version, exposureIntervalHour, isShow,
        startedAt, endedAt, title, desc, url);
  }

  @override
  String toString() {
    return 'RemoteConfigNoticeDialogData(version: $version, exposureIntervalHour: $exposureIntervalHour, isShow: $isShow, startedAt: $startedAt, endedAt: $endedAt, title: $title, desc: $desc, url: $url)';
  }
}

/// @nodoc
abstract mixin class _$RemoteConfigNoticeDialogDataCopyWith<$Res>
    implements $RemoteConfigNoticeDialogDataCopyWith<$Res> {
  factory _$RemoteConfigNoticeDialogDataCopyWith(
          _RemoteConfigNoticeDialogData value,
          $Res Function(_RemoteConfigNoticeDialogData) _then) =
      __$RemoteConfigNoticeDialogDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int version,
      int exposureIntervalHour,
      bool isShow,
      DateTime startedAt,
      DateTime endedAt,
      RemoteConfigLang title,
      RemoteConfigLang desc,
      RemoteConfigLang url});

  @override
  $RemoteConfigLangCopyWith<$Res> get title;
  @override
  $RemoteConfigLangCopyWith<$Res> get desc;
  @override
  $RemoteConfigLangCopyWith<$Res> get url;
}

/// @nodoc
class __$RemoteConfigNoticeDialogDataCopyWithImpl<$Res>
    implements _$RemoteConfigNoticeDialogDataCopyWith<$Res> {
  __$RemoteConfigNoticeDialogDataCopyWithImpl(this._self, this._then);

  final _RemoteConfigNoticeDialogData _self;
  final $Res Function(_RemoteConfigNoticeDialogData) _then;

  /// Create a copy of RemoteConfigNoticeDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? version = null,
    Object? exposureIntervalHour = null,
    Object? isShow = null,
    Object? startedAt = null,
    Object? endedAt = null,
    Object? title = null,
    Object? desc = null,
    Object? url = null,
  }) {
    return _then(_RemoteConfigNoticeDialogData(
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      exposureIntervalHour: null == exposureIntervalHour
          ? _self.exposureIntervalHour
          : exposureIntervalHour // ignore: cast_nullable_to_non_nullable
              as int,
      isShow: null == isShow
          ? _self.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
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
      desc: null == desc
          ? _self.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
    ));
  }

  /// Create a copy of RemoteConfigNoticeDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get title {
    return $RemoteConfigLangCopyWith<$Res>(_self.title, (value) {
      return _then(_self.copyWith(title: value));
    });
  }

  /// Create a copy of RemoteConfigNoticeDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get desc {
    return $RemoteConfigLangCopyWith<$Res>(_self.desc, (value) {
      return _then(_self.copyWith(desc: value));
    });
  }

  /// Create a copy of RemoteConfigNoticeDialogData
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
