// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_sketch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameSketch _$GameSketchFromJson(Map<String, dynamic> json) {
  return _GameSketch.fromJson(json);
}

/// @nodoc
mixin _$GameSketch {
  List<GameStroke> get strokeList => throw _privateConstructorUsedError;
  @SizeSerializer()
  Size get canvasSize => throw _privateConstructorUsedError;
  @ColorSerializer()
  Color get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameSketchCopyWith<GameSketch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameSketchCopyWith<$Res> {
  factory $GameSketchCopyWith(
          GameSketch value, $Res Function(GameSketch) then) =
      _$GameSketchCopyWithImpl<$Res, GameSketch>;
  @useResult
  $Res call(
      {List<GameStroke> strokeList,
      @SizeSerializer() Size canvasSize,
      @ColorSerializer() Color color});
}

/// @nodoc
class _$GameSketchCopyWithImpl<$Res, $Val extends GameSketch>
    implements $GameSketchCopyWith<$Res> {
  _$GameSketchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strokeList = null,
    Object? canvasSize = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      strokeList: null == strokeList
          ? _value.strokeList
          : strokeList // ignore: cast_nullable_to_non_nullable
              as List<GameStroke>,
      canvasSize: null == canvasSize
          ? _value.canvasSize
          : canvasSize // ignore: cast_nullable_to_non_nullable
              as Size,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameSketchImplCopyWith<$Res>
    implements $GameSketchCopyWith<$Res> {
  factory _$$GameSketchImplCopyWith(
          _$GameSketchImpl value, $Res Function(_$GameSketchImpl) then) =
      __$$GameSketchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GameStroke> strokeList,
      @SizeSerializer() Size canvasSize,
      @ColorSerializer() Color color});
}

/// @nodoc
class __$$GameSketchImplCopyWithImpl<$Res>
    extends _$GameSketchCopyWithImpl<$Res, _$GameSketchImpl>
    implements _$$GameSketchImplCopyWith<$Res> {
  __$$GameSketchImplCopyWithImpl(
      _$GameSketchImpl _value, $Res Function(_$GameSketchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strokeList = null,
    Object? canvasSize = null,
    Object? color = null,
  }) {
    return _then(_$GameSketchImpl(
      strokeList: null == strokeList
          ? _value._strokeList
          : strokeList // ignore: cast_nullable_to_non_nullable
              as List<GameStroke>,
      canvasSize: null == canvasSize
          ? _value.canvasSize
          : canvasSize // ignore: cast_nullable_to_non_nullable
              as Size,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameSketchImpl implements _GameSketch {
  _$GameSketchImpl(
      {required final List<GameStroke> strokeList,
      @SizeSerializer() required this.canvasSize,
      @ColorSerializer() required this.color})
      : _strokeList = strokeList;

  factory _$GameSketchImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameSketchImplFromJson(json);

  final List<GameStroke> _strokeList;
  @override
  List<GameStroke> get strokeList {
    if (_strokeList is EqualUnmodifiableListView) return _strokeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strokeList);
  }

  @override
  @SizeSerializer()
  final Size canvasSize;
  @override
  @ColorSerializer()
  final Color color;

  @override
  String toString() {
    return 'GameSketch(strokeList: $strokeList, canvasSize: $canvasSize, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameSketchImpl &&
            const DeepCollectionEquality()
                .equals(other._strokeList, _strokeList) &&
            (identical(other.canvasSize, canvasSize) ||
                other.canvasSize == canvasSize) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_strokeList), canvasSize, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameSketchImplCopyWith<_$GameSketchImpl> get copyWith =>
      __$$GameSketchImplCopyWithImpl<_$GameSketchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameSketchImplToJson(
      this,
    );
  }
}

abstract class _GameSketch implements GameSketch {
  factory _GameSketch(
      {required final List<GameStroke> strokeList,
      @SizeSerializer() required final Size canvasSize,
      @ColorSerializer() required final Color color}) = _$GameSketchImpl;

  factory _GameSketch.fromJson(Map<String, dynamic> json) =
      _$GameSketchImpl.fromJson;

  @override
  List<GameStroke> get strokeList;
  @override
  @SizeSerializer()
  Size get canvasSize;
  @override
  @ColorSerializer()
  Color get color;
  @override
  @JsonKey(ignore: true)
  _$$GameSketchImplCopyWith<_$GameSketchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
