// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_dialog_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NoticeDialogData {
  int get version;
  int get exposureIntervalHour;
  bool get isShow;
  DateTime get startedAt;
  DateTime get endedAt;
  String get title;
  String get desc;
  Uri? get url;

  /// Create a copy of NoticeDialogData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NoticeDialogDataCopyWith<NoticeDialogData> get copyWith =>
      _$NoticeDialogDataCopyWithImpl<NoticeDialogData>(
          this as NoticeDialogData, _$identity);

  /// Serializes this NoticeDialogData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as NoticeDialogData;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NoticeDialogData &&
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
    final _this = this as NoticeDialogData;
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
    final _this = this as NoticeDialogData;
    return 'NoticeDialogData(version: ${_this.version}, exposureIntervalHour: ${_this.exposureIntervalHour}, isShow: ${_this.isShow}, startedAt: ${_this.startedAt}, endedAt: ${_this.endedAt}, title: ${_this.title}, desc: ${_this.desc}, url: ${_this.url})';
  }
}

/// @nodoc
abstract mixin class $NoticeDialogDataCopyWith<$Res> {
  factory $NoticeDialogDataCopyWith(
          NoticeDialogData value, $Res Function(NoticeDialogData) _then) =
      _$NoticeDialogDataCopyWithImpl;
  @useResult
  $Res call(
      {int version,
      int exposureIntervalHour,
      bool isShow,
      DateTime startedAt,
      DateTime endedAt,
      String title,
      String desc,
      Uri? url});
}

/// @nodoc
class _$NoticeDialogDataCopyWithImpl<$Res>
    implements $NoticeDialogDataCopyWith<$Res> {
  _$NoticeDialogDataCopyWithImpl(this._self, this._then);

  final NoticeDialogData _self;
  final $Res Function(NoticeDialogData) _then;

  /// Create a copy of NoticeDialogData
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
    Object? url = freezed,
  }) {
    return _then(NoticeDialogData(
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
              as String,
      desc: null == desc
          ? _self.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri?,
    ));
  }
}

/// Adds pattern-matching-related methods to [NoticeDialogData].
extension NoticeDialogDataPatterns on NoticeDialogData {
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
    TResult Function(_NoticeDialogData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NoticeDialogData() when $default != null:
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
    TResult Function(_NoticeDialogData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NoticeDialogData():
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
    TResult? Function(_NoticeDialogData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NoticeDialogData() when $default != null:
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
            String title,
            String desc,
            Uri? url)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NoticeDialogData() when $default != null:
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
            String title,
            String desc,
            Uri? url)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NoticeDialogData():
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
            String title,
            String desc,
            Uri? url)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NoticeDialogData() when $default != null:
        return $default(_that.version, _that.exposureIntervalHour, _that.isShow,
            _that.startedAt, _that.endedAt, _that.title, _that.desc, _that.url);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NoticeDialogData extends NoticeDialogData {
  _NoticeDialogData(
      {required this.version,
      required this.exposureIntervalHour,
      required this.isShow,
      required this.startedAt,
      required this.endedAt,
      required this.title,
      required this.desc,
      this.url})
      : super._();
  factory _NoticeDialogData.fromJson(Map<String, dynamic> json) =>
      _$NoticeDialogDataFromJson(json);

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
  final String title;
  @override
  final String desc;
  @override
  final Uri? url;

  /// Create a copy of NoticeDialogData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NoticeDialogDataCopyWith<_NoticeDialogData> get copyWith =>
      __$NoticeDialogDataCopyWithImpl<_NoticeDialogData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NoticeDialogDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoticeDialogData &&
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
    return 'NoticeDialogData(version: $version, exposureIntervalHour: $exposureIntervalHour, isShow: $isShow, startedAt: $startedAt, endedAt: $endedAt, title: $title, desc: $desc, url: $url)';
  }
}

/// @nodoc
abstract mixin class _$NoticeDialogDataCopyWith<$Res>
    implements $NoticeDialogDataCopyWith<$Res> {
  factory _$NoticeDialogDataCopyWith(
          _NoticeDialogData value, $Res Function(_NoticeDialogData) _then) =
      __$NoticeDialogDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int version,
      int exposureIntervalHour,
      bool isShow,
      DateTime startedAt,
      DateTime endedAt,
      String title,
      String desc,
      Uri? url});
}

/// @nodoc
class __$NoticeDialogDataCopyWithImpl<$Res>
    implements _$NoticeDialogDataCopyWith<$Res> {
  __$NoticeDialogDataCopyWithImpl(this._self, this._then);

  final _NoticeDialogData _self;
  final $Res Function(_NoticeDialogData) _then;

  /// Create a copy of NoticeDialogData
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
    Object? url = freezed,
  }) {
    return _then(_NoticeDialogData(
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
              as String,
      desc: null == desc
          ? _self.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri?,
    ));
  }
}

// dart format on
