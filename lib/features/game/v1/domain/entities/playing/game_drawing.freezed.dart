// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_drawing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameDrawing _$GameDrawingFromJson(Map<String, dynamic> json) {
  return _GameDrawing.fromJson(json);
}

/// @nodoc
mixin _$GameDrawing {
  /// [
  ///   { First stroke
  ///     x: [0, 1, 2, 3, ...],
  ///     y: [0, 1, 2, 3, ...],
  ///     t: [0, 1, 2, 3, ...]
  ///   },
  ///   { Second stroke
  ///     x: [0, 1, 2, 3, ...],
  ///     y: [0, 1, 2, 3, ...],
  ///     t: [0, 1, 2, 3, ...]
  ///   },
  /// ]
  List<GameStroke> get strokeList => throw _privateConstructorUsedError;
  @SizeSerializer()
  Size get canvasSize => throw _privateConstructorUsedError;
  @ColorSerializer()
  Color get color => throw _privateConstructorUsedError;
  String get player => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameDrawingCopyWith<GameDrawing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameDrawingCopyWith<$Res> {
  factory $GameDrawingCopyWith(
          GameDrawing value, $Res Function(GameDrawing) then) =
      _$GameDrawingCopyWithImpl<$Res, GameDrawing>;
  @useResult
  $Res call(
      {List<GameStroke> strokeList,
      @SizeSerializer() Size canvasSize,
      @ColorSerializer() Color color,
      String player});
}

/// @nodoc
class _$GameDrawingCopyWithImpl<$Res, $Val extends GameDrawing>
    implements $GameDrawingCopyWith<$Res> {
  _$GameDrawingCopyWithImpl(this._value, this._then);

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
    Object? player = null,
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
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameDrawingImplCopyWith<$Res>
    implements $GameDrawingCopyWith<$Res> {
  factory _$$GameDrawingImplCopyWith(
          _$GameDrawingImpl value, $Res Function(_$GameDrawingImpl) then) =
      __$$GameDrawingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GameStroke> strokeList,
      @SizeSerializer() Size canvasSize,
      @ColorSerializer() Color color,
      String player});
}

/// @nodoc
class __$$GameDrawingImplCopyWithImpl<$Res>
    extends _$GameDrawingCopyWithImpl<$Res, _$GameDrawingImpl>
    implements _$$GameDrawingImplCopyWith<$Res> {
  __$$GameDrawingImplCopyWithImpl(
      _$GameDrawingImpl _value, $Res Function(_$GameDrawingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strokeList = null,
    Object? canvasSize = null,
    Object? color = null,
    Object? player = null,
  }) {
    return _then(_$GameDrawingImpl(
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
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameDrawingImpl implements _GameDrawing {
  _$GameDrawingImpl(
      {required final List<GameStroke> strokeList,
      @SizeSerializer() required this.canvasSize,
      @ColorSerializer() required this.color,
      required this.player})
      : _strokeList = strokeList;

  factory _$GameDrawingImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameDrawingImplFromJson(json);

  /// [
  ///   { First stroke
  ///     x: [0, 1, 2, 3, ...],
  ///     y: [0, 1, 2, 3, ...],
  ///     t: [0, 1, 2, 3, ...]
  ///   },
  ///   { Second stroke
  ///     x: [0, 1, 2, 3, ...],
  ///     y: [0, 1, 2, 3, ...],
  ///     t: [0, 1, 2, 3, ...]
  ///   },
  /// ]
  final List<GameStroke> _strokeList;

  /// [
  ///   { First stroke
  ///     x: [0, 1, 2, 3, ...],
  ///     y: [0, 1, 2, 3, ...],
  ///     t: [0, 1, 2, 3, ...]
  ///   },
  ///   { Second stroke
  ///     x: [0, 1, 2, 3, ...],
  ///     y: [0, 1, 2, 3, ...],
  ///     t: [0, 1, 2, 3, ...]
  ///   },
  /// ]
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
  final String player;

  @override
  String toString() {
    return 'GameDrawing(strokeList: $strokeList, canvasSize: $canvasSize, color: $color, player: $player)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameDrawingImpl &&
            const DeepCollectionEquality()
                .equals(other._strokeList, _strokeList) &&
            (identical(other.canvasSize, canvasSize) ||
                other.canvasSize == canvasSize) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.player, player) || other.player == player));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_strokeList),
      canvasSize,
      color,
      player);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameDrawingImplCopyWith<_$GameDrawingImpl> get copyWith =>
      __$$GameDrawingImplCopyWithImpl<_$GameDrawingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameDrawingImplToJson(
      this,
    );
  }
}

abstract class _GameDrawing implements GameDrawing {
  factory _GameDrawing(
      {required final List<GameStroke> strokeList,
      @SizeSerializer() required final Size canvasSize,
      @ColorSerializer() required final Color color,
      required final String player}) = _$GameDrawingImpl;

  factory _GameDrawing.fromJson(Map<String, dynamic> json) =
      _$GameDrawingImpl.fromJson;

  @override

  /// [
  ///   { First stroke
  ///     x: [0, 1, 2, 3, ...],
  ///     y: [0, 1, 2, 3, ...],
  ///     t: [0, 1, 2, 3, ...]
  ///   },
  ///   { Second stroke
  ///     x: [0, 1, 2, 3, ...],
  ///     y: [0, 1, 2, 3, ...],
  ///     t: [0, 1, 2, 3, ...]
  ///   },
  /// ]
  List<GameStroke> get strokeList;
  @override
  @SizeSerializer()
  Size get canvasSize;
  @override
  @ColorSerializer()
  Color get color;
  @override
  String get player;
  @override
  @JsonKey(ignore: true)
  _$$GameDrawingImplCopyWith<_$GameDrawingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
