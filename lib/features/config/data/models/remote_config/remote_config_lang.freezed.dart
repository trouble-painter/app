// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_lang.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemoteConfigLang {
  String get ko;
  String get en;

  /// Create a copy of RemoteConfigLang
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<RemoteConfigLang> get copyWith =>
      _$RemoteConfigLangCopyWithImpl<RemoteConfigLang>(
          this as RemoteConfigLang, _$identity);

  /// Serializes this RemoteConfigLang to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as RemoteConfigLang;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemoteConfigLang &&
            (identical(other.ko, _this.ko) || other.ko == _this.ko) &&
            (identical(other.en, _this.en) || other.en == _this.en));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as RemoteConfigLang;
    return Object.hash(runtimeType, _this.ko, _this.en);
  }

  @override
  String toString() {
    final _this = this as RemoteConfigLang;
    return 'RemoteConfigLang(ko: ${_this.ko}, en: ${_this.en})';
  }
}

/// @nodoc
abstract mixin class $RemoteConfigLangCopyWith<$Res> {
  factory $RemoteConfigLangCopyWith(
          RemoteConfigLang value, $Res Function(RemoteConfigLang) _then) =
      _$RemoteConfigLangCopyWithImpl;
  @useResult
  $Res call({String ko, String en});
}

/// @nodoc
class _$RemoteConfigLangCopyWithImpl<$Res>
    implements $RemoteConfigLangCopyWith<$Res> {
  _$RemoteConfigLangCopyWithImpl(this._self, this._then);

  final RemoteConfigLang _self;
  final $Res Function(RemoteConfigLang) _then;

  /// Create a copy of RemoteConfigLang
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ko = null,
    Object? en = null,
  }) {
    return _then(RemoteConfigLang(
      ko: null == ko
          ? _self.ko
          : ko // ignore: cast_nullable_to_non_nullable
              as String,
      en: null == en
          ? _self.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [RemoteConfigLang].
extension RemoteConfigLangPatterns on RemoteConfigLang {
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
    TResult Function(_RemoteConfigLang value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigLang() when $default != null:
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
    TResult Function(_RemoteConfigLang value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigLang():
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
    TResult? Function(_RemoteConfigLang value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigLang() when $default != null:
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
    TResult Function(String ko, String en)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigLang() when $default != null:
        return $default(_that.ko, _that.en);
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
    TResult Function(String ko, String en) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigLang():
        return $default(_that.ko, _that.en);
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
    TResult? Function(String ko, String en)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfigLang() when $default != null:
        return $default(_that.ko, _that.en);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RemoteConfigLang extends RemoteConfigLang {
  _RemoteConfigLang({this.ko = "", this.en = ""}) : super._();
  factory _RemoteConfigLang.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigLangFromJson(json);

  @override
  @JsonKey()
  final String ko;
  @override
  @JsonKey()
  final String en;

  /// Create a copy of RemoteConfigLang
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RemoteConfigLangCopyWith<_RemoteConfigLang> get copyWith =>
      __$RemoteConfigLangCopyWithImpl<_RemoteConfigLang>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RemoteConfigLangToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RemoteConfigLang &&
            (identical(other.ko, ko) || other.ko == ko) &&
            (identical(other.en, en) || other.en == en));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, ko, en);
  }

  @override
  String toString() {
    return 'RemoteConfigLang(ko: $ko, en: $en)';
  }
}

/// @nodoc
abstract mixin class _$RemoteConfigLangCopyWith<$Res>
    implements $RemoteConfigLangCopyWith<$Res> {
  factory _$RemoteConfigLangCopyWith(
          _RemoteConfigLang value, $Res Function(_RemoteConfigLang) _then) =
      __$RemoteConfigLangCopyWithImpl;
  @override
  @useResult
  $Res call({String ko, String en});
}

/// @nodoc
class __$RemoteConfigLangCopyWithImpl<$Res>
    implements _$RemoteConfigLangCopyWith<$Res> {
  __$RemoteConfigLangCopyWithImpl(this._self, this._then);

  final _RemoteConfigLang _self;
  final $Res Function(_RemoteConfigLang) _then;

  /// Create a copy of RemoteConfigLang
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ko = null,
    Object? en = null,
  }) {
    return _then(_RemoteConfigLang(
      ko: null == ko
          ? _self.ko
          : ko // ignore: cast_nullable_to_non_nullable
              as String,
      en: null == en
          ? _self.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
