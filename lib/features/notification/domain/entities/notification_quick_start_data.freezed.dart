// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_quick_start_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationQuickStartData {
  String get title;
  String get content;

  /// Create a copy of NotificationQuickStartData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationQuickStartDataCopyWith<NotificationQuickStartData>
      get copyWith =>
          _$NotificationQuickStartDataCopyWithImpl<NotificationQuickStartData>(
              this as NotificationQuickStartData, _$identity);

  /// Serializes this NotificationQuickStartData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as NotificationQuickStartData;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationQuickStartData &&
            (identical(other.title, _this.title) ||
                other.title == _this.title) &&
            (identical(other.content, _this.content) ||
                other.content == _this.content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as NotificationQuickStartData;
    return Object.hash(runtimeType, _this.title, _this.content);
  }

  @override
  String toString() {
    final _this = this as NotificationQuickStartData;
    return 'NotificationQuickStartData(title: ${_this.title}, content: ${_this.content})';
  }
}

/// @nodoc
abstract mixin class $NotificationQuickStartDataCopyWith<$Res> {
  factory $NotificationQuickStartDataCopyWith(NotificationQuickStartData value,
          $Res Function(NotificationQuickStartData) _then) =
      _$NotificationQuickStartDataCopyWithImpl;
  @useResult
  $Res call({String title, String content});
}

/// @nodoc
class _$NotificationQuickStartDataCopyWithImpl<$Res>
    implements $NotificationQuickStartDataCopyWith<$Res> {
  _$NotificationQuickStartDataCopyWithImpl(this._self, this._then);

  final NotificationQuickStartData _self;
  final $Res Function(NotificationQuickStartData) _then;

  /// Create a copy of NotificationQuickStartData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
  }) {
    return _then(NotificationQuickStartData(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [NotificationQuickStartData].
extension NotificationQuickStartDataPatterns on NotificationQuickStartData {
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
    TResult Function(_NotificationQuickStartData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationQuickStartData() when $default != null:
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
    TResult Function(_NotificationQuickStartData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationQuickStartData():
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
    TResult? Function(_NotificationQuickStartData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationQuickStartData() when $default != null:
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
    TResult Function(String title, String content)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationQuickStartData() when $default != null:
        return $default(_that.title, _that.content);
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
    TResult Function(String title, String content) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationQuickStartData():
        return $default(_that.title, _that.content);
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
    TResult? Function(String title, String content)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationQuickStartData() when $default != null:
        return $default(_that.title, _that.content);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NotificationQuickStartData implements NotificationQuickStartData {
  _NotificationQuickStartData({required this.title, required this.content});
  factory _NotificationQuickStartData.fromJson(Map<String, dynamic> json) =>
      _$NotificationQuickStartDataFromJson(json);

  @override
  final String title;
  @override
  final String content;

  /// Create a copy of NotificationQuickStartData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationQuickStartDataCopyWith<_NotificationQuickStartData>
      get copyWith => __$NotificationQuickStartDataCopyWithImpl<
          _NotificationQuickStartData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationQuickStartDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationQuickStartData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, title, content);
  }

  @override
  String toString() {
    return 'NotificationQuickStartData(title: $title, content: $content)';
  }
}

/// @nodoc
abstract mixin class _$NotificationQuickStartDataCopyWith<$Res>
    implements $NotificationQuickStartDataCopyWith<$Res> {
  factory _$NotificationQuickStartDataCopyWith(
          _NotificationQuickStartData value,
          $Res Function(_NotificationQuickStartData) _then) =
      __$NotificationQuickStartDataCopyWithImpl;
  @override
  @useResult
  $Res call({String title, String content});
}

/// @nodoc
class __$NotificationQuickStartDataCopyWithImpl<$Res>
    implements _$NotificationQuickStartDataCopyWith<$Res> {
  __$NotificationQuickStartDataCopyWithImpl(this._self, this._then);

  final _NotificationQuickStartData _self;
  final $Res Function(_NotificationQuickStartData) _then;

  /// Create a copy of NotificationQuickStartData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_NotificationQuickStartData(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
