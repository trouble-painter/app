// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stroke.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Stroke {
  List<double> get x;
  List<double> get y;
  List<double> get t;

  /// Create a copy of Stroke
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StrokeCopyWith<Stroke> get copyWith =>
      _$StrokeCopyWithImpl<Stroke>(this as Stroke, _$identity);

  /// Serializes this Stroke to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as Stroke;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Stroke &&
            const DeepCollectionEquality().equals(other.x, _this.x) &&
            const DeepCollectionEquality().equals(other.y, _this.y) &&
            const DeepCollectionEquality().equals(other.t, _this.t));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as Stroke;
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(_this.x),
        const DeepCollectionEquality().hash(_this.y),
        const DeepCollectionEquality().hash(_this.t));
  }

  @override
  String toString() {
    final _this = this as Stroke;
    return 'Stroke(x: ${_this.x}, y: ${_this.y}, t: ${_this.t})';
  }
}

/// @nodoc
abstract mixin class $StrokeCopyWith<$Res> {
  factory $StrokeCopyWith(Stroke value, $Res Function(Stroke) _then) =
      _$StrokeCopyWithImpl;
  @useResult
  $Res call({List<double> x, List<double> y, List<double> t});
}

/// @nodoc
class _$StrokeCopyWithImpl<$Res> implements $StrokeCopyWith<$Res> {
  _$StrokeCopyWithImpl(this._self, this._then);

  final Stroke _self;
  final $Res Function(Stroke) _then;

  /// Create a copy of Stroke
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? t = null,
  }) {
    return _then(Stroke(
      x: null == x
          ? _self.x
          : x // ignore: cast_nullable_to_non_nullable
              as List<double>,
      y: null == y
          ? _self.y
          : y // ignore: cast_nullable_to_non_nullable
              as List<double>,
      t: null == t
          ? _self.t
          : t // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Stroke].
extension StrokePatterns on Stroke {
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
    TResult Function(_Stroke value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Stroke() when $default != null:
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
    TResult Function(_Stroke value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Stroke():
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
    TResult? Function(_Stroke value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Stroke() when $default != null:
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
    TResult Function(List<double> x, List<double> y, List<double> t)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Stroke() when $default != null:
        return $default(_that.x, _that.y, _that.t);
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
    TResult Function(List<double> x, List<double> y, List<double> t) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Stroke():
        return $default(_that.x, _that.y, _that.t);
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
    TResult? Function(List<double> x, List<double> y, List<double> t)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Stroke() when $default != null:
        return $default(_that.x, _that.y, _that.t);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Stroke extends Stroke {
  _Stroke(
      {required List<double> x,
      required List<double> y,
      required List<double> t})
      : _x = x,
        _y = y,
        _t = t,
        super._();
  factory _Stroke.fromJson(Map<String, dynamic> json) => _$StrokeFromJson(json);

  final List<double> _x;
  @override
  List<double> get x {
    if (_x is EqualUnmodifiableListView) return _x;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_x);
  }

  final List<double> _y;
  @override
  List<double> get y {
    if (_y is EqualUnmodifiableListView) return _y;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_y);
  }

  final List<double> _t;
  @override
  List<double> get t {
    if (_t is EqualUnmodifiableListView) return _t;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_t);
  }

  /// Create a copy of Stroke
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StrokeCopyWith<_Stroke> get copyWith =>
      __$StrokeCopyWithImpl<_Stroke>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StrokeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Stroke &&
            const DeepCollectionEquality().equals(other.x, _x) &&
            const DeepCollectionEquality().equals(other.y, _y) &&
            const DeepCollectionEquality().equals(other.t, _t));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(_x),
        const DeepCollectionEquality().hash(_y),
        const DeepCollectionEquality().hash(_t));
  }

  @override
  String toString() {
    return 'Stroke(x: $x, y: $y, t: $t)';
  }
}

/// @nodoc
abstract mixin class _$StrokeCopyWith<$Res> implements $StrokeCopyWith<$Res> {
  factory _$StrokeCopyWith(_Stroke value, $Res Function(_Stroke) _then) =
      __$StrokeCopyWithImpl;
  @override
  @useResult
  $Res call({List<double> x, List<double> y, List<double> t});
}

/// @nodoc
class __$StrokeCopyWithImpl<$Res> implements _$StrokeCopyWith<$Res> {
  __$StrokeCopyWithImpl(this._self, this._then);

  final _Stroke _self;
  final $Res Function(_Stroke) _then;

  /// Create a copy of Stroke
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? t = null,
  }) {
    return _then(_Stroke(
      x: null == x
          ? _self._x
          : x // ignore: cast_nullable_to_non_nullable
              as List<double>,
      y: null == y
          ? _self._y
          : y // ignore: cast_nullable_to_non_nullable
              as List<double>,
      t: null == t
          ? _self._t
          : t // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

// dart format on
