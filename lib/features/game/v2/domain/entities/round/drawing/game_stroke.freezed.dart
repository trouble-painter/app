// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_stroke.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameStroke _$GameStrokeFromJson(Map<String, dynamic> json) {
  return _GameStroke.fromJson(json);
}

/// @nodoc
mixin _$GameStroke {
  List<double> get x => throw _privateConstructorUsedError;
  List<double> get y => throw _privateConstructorUsedError;
  List<double> get t => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameStrokeCopyWith<GameStroke> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStrokeCopyWith<$Res> {
  factory $GameStrokeCopyWith(
          GameStroke value, $Res Function(GameStroke) then) =
      _$GameStrokeCopyWithImpl<$Res, GameStroke>;
  @useResult
  $Res call({List<double> x, List<double> y, List<double> t});
}

/// @nodoc
class _$GameStrokeCopyWithImpl<$Res, $Val extends GameStroke>
    implements $GameStrokeCopyWith<$Res> {
  _$GameStrokeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? t = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as List<double>,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as List<double>,
      t: null == t
          ? _value.t
          : t // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameStrokeImplCopyWith<$Res>
    implements $GameStrokeCopyWith<$Res> {
  factory _$$GameStrokeImplCopyWith(
          _$GameStrokeImpl value, $Res Function(_$GameStrokeImpl) then) =
      __$$GameStrokeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<double> x, List<double> y, List<double> t});
}

/// @nodoc
class __$$GameStrokeImplCopyWithImpl<$Res>
    extends _$GameStrokeCopyWithImpl<$Res, _$GameStrokeImpl>
    implements _$$GameStrokeImplCopyWith<$Res> {
  __$$GameStrokeImplCopyWithImpl(
      _$GameStrokeImpl _value, $Res Function(_$GameStrokeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? t = null,
  }) {
    return _then(_$GameStrokeImpl(
      x: null == x
          ? _value._x
          : x // ignore: cast_nullable_to_non_nullable
              as List<double>,
      y: null == y
          ? _value._y
          : y // ignore: cast_nullable_to_non_nullable
              as List<double>,
      t: null == t
          ? _value._t
          : t // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameStrokeImpl extends _GameStroke {
  _$GameStrokeImpl(
      {required final List<double> x,
      required final List<double> y,
      required final List<double> t})
      : _x = x,
        _y = y,
        _t = t,
        super._();

  factory _$GameStrokeImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameStrokeImplFromJson(json);

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

  @override
  String toString() {
    return 'GameStroke(x: $x, y: $y, t: $t)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStrokeImpl &&
            const DeepCollectionEquality().equals(other._x, _x) &&
            const DeepCollectionEquality().equals(other._y, _y) &&
            const DeepCollectionEquality().equals(other._t, _t));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_x),
      const DeepCollectionEquality().hash(_y),
      const DeepCollectionEquality().hash(_t));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStrokeImplCopyWith<_$GameStrokeImpl> get copyWith =>
      __$$GameStrokeImplCopyWithImpl<_$GameStrokeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameStrokeImplToJson(
      this,
    );
  }
}

abstract class _GameStroke extends GameStroke {
  factory _GameStroke(
      {required final List<double> x,
      required final List<double> y,
      required final List<double> t}) = _$GameStrokeImpl;
  _GameStroke._() : super._();

  factory _GameStroke.fromJson(Map<String, dynamic> json) =
      _$GameStrokeImpl.fromJson;

  @override
  List<double> get x;
  @override
  List<double> get y;
  @override
  List<double> get t;
  @override
  @JsonKey(ignore: true)
  _$$GameStrokeImplCopyWith<_$GameStrokeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
