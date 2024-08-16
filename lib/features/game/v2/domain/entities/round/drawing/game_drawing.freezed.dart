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
  String get id => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;
  String get roundId => throw _privateConstructorUsedError;
  List<GameSketch> get sketchList => throw _privateConstructorUsedError;
  int get turn => throw _privateConstructorUsedError;
  int get step => throw _privateConstructorUsedError;
  @TimeSerializer()
  DateTime get turnStartedAt => throw _privateConstructorUsedError;
  @TimeSerializer()
  DateTime get startedAt => throw _privateConstructorUsedError;

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
      {String id,
      String roomId,
      String roundId,
      List<GameSketch> sketchList,
      int turn,
      int step,
      @TimeSerializer() DateTime turnStartedAt,
      @TimeSerializer() DateTime startedAt});
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
    Object? id = null,
    Object? roomId = null,
    Object? roundId = null,
    Object? sketchList = null,
    Object? turn = null,
    Object? step = null,
    Object? turnStartedAt = null,
    Object? startedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      roundId: null == roundId
          ? _value.roundId
          : roundId // ignore: cast_nullable_to_non_nullable
              as String,
      sketchList: null == sketchList
          ? _value.sketchList
          : sketchList // ignore: cast_nullable_to_non_nullable
              as List<GameSketch>,
      turn: null == turn
          ? _value.turn
          : turn // ignore: cast_nullable_to_non_nullable
              as int,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      turnStartedAt: null == turnStartedAt
          ? _value.turnStartedAt
          : turnStartedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      {String id,
      String roomId,
      String roundId,
      List<GameSketch> sketchList,
      int turn,
      int step,
      @TimeSerializer() DateTime turnStartedAt,
      @TimeSerializer() DateTime startedAt});
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
    Object? id = null,
    Object? roomId = null,
    Object? roundId = null,
    Object? sketchList = null,
    Object? turn = null,
    Object? step = null,
    Object? turnStartedAt = null,
    Object? startedAt = null,
  }) {
    return _then(_$GameDrawingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      roundId: null == roundId
          ? _value.roundId
          : roundId // ignore: cast_nullable_to_non_nullable
              as String,
      sketchList: null == sketchList
          ? _value._sketchList
          : sketchList // ignore: cast_nullable_to_non_nullable
              as List<GameSketch>,
      turn: null == turn
          ? _value.turn
          : turn // ignore: cast_nullable_to_non_nullable
              as int,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      turnStartedAt: null == turnStartedAt
          ? _value.turnStartedAt
          : turnStartedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameDrawingImpl implements _GameDrawing {
  _$GameDrawingImpl(
      {required this.id,
      required this.roomId,
      required this.roundId,
      required final List<GameSketch> sketchList,
      required this.turn,
      required this.step,
      @TimeSerializer() required this.turnStartedAt,
      @TimeSerializer() required this.startedAt})
      : _sketchList = sketchList;

  factory _$GameDrawingImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameDrawingImplFromJson(json);

  @override
  final String id;
  @override
  final String roomId;
  @override
  final String roundId;
  final List<GameSketch> _sketchList;
  @override
  List<GameSketch> get sketchList {
    if (_sketchList is EqualUnmodifiableListView) return _sketchList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sketchList);
  }

  @override
  final int turn;
  @override
  final int step;
  @override
  @TimeSerializer()
  final DateTime turnStartedAt;
  @override
  @TimeSerializer()
  final DateTime startedAt;

  @override
  String toString() {
    return 'GameDrawing(id: $id, roomId: $roomId, roundId: $roundId, sketchList: $sketchList, turn: $turn, step: $step, turnStartedAt: $turnStartedAt, startedAt: $startedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameDrawingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.roundId, roundId) || other.roundId == roundId) &&
            const DeepCollectionEquality()
                .equals(other._sketchList, _sketchList) &&
            (identical(other.turn, turn) || other.turn == turn) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.turnStartedAt, turnStartedAt) ||
                other.turnStartedAt == turnStartedAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      roomId,
      roundId,
      const DeepCollectionEquality().hash(_sketchList),
      turn,
      step,
      turnStartedAt,
      startedAt);

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
      {required final String id,
      required final String roomId,
      required final String roundId,
      required final List<GameSketch> sketchList,
      required final int turn,
      required final int step,
      @TimeSerializer() required final DateTime turnStartedAt,
      @TimeSerializer() required final DateTime startedAt}) = _$GameDrawingImpl;

  factory _GameDrawing.fromJson(Map<String, dynamic> json) =
      _$GameDrawingImpl.fromJson;

  @override
  String get id;
  @override
  String get roomId;
  @override
  String get roundId;
  @override
  List<GameSketch> get sketchList;
  @override
  int get turn;
  @override
  int get step;
  @override
  @TimeSerializer()
  DateTime get turnStartedAt;
  @override
  @TimeSerializer()
  DateTime get startedAt;
  @override
  @JsonKey(ignore: true)
  _$$GameDrawingImplCopyWith<_$GameDrawingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
