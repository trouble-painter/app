// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameRoom _$GameRoomFromJson(Map<String, dynamic> json) {
  return _GameRoom.fromJson(json);
}

/// @nodoc
mixin _$GameRoom {
  String get id => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  int get maxPlayers => throw _privateConstructorUsedError;
  int get timeLimitSec => throw _privateConstructorUsedError;
  List<GamePlayer> get players => throw _privateConstructorUsedError;
  GameRoomState get state => throw _privateConstructorUsedError;
  @TimeSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Playing
  String get spy => throw _privateConstructorUsedError;
  GameKeyword get keyword => throw _privateConstructorUsedError;
  int get strokeLeft => throw _privateConstructorUsedError;
  int get currentDrawingOrder => throw _privateConstructorUsedError;
  List<String> get drawingOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameRoomCopyWith<GameRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameRoomCopyWith<$Res> {
  factory $GameRoomCopyWith(GameRoom value, $Res Function(GameRoom) then) =
      _$GameRoomCopyWithImpl<$Res, GameRoom>;
  @useResult
  $Res call(
      {String id,
      String host,
      int maxPlayers,
      int timeLimitSec,
      List<GamePlayer> players,
      GameRoomState state,
      @TimeSerializer() DateTime createdAt,
      String spy,
      GameKeyword keyword,
      int strokeLeft,
      int currentDrawingOrder,
      List<String> drawingOrder});

  $GameKeywordCopyWith<$Res> get keyword;
}

/// @nodoc
class _$GameRoomCopyWithImpl<$Res, $Val extends GameRoom>
    implements $GameRoomCopyWith<$Res> {
  _$GameRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? host = null,
    Object? maxPlayers = null,
    Object? timeLimitSec = null,
    Object? players = null,
    Object? state = null,
    Object? createdAt = null,
    Object? spy = null,
    Object? keyword = null,
    Object? strokeLeft = null,
    Object? currentDrawingOrder = null,
    Object? drawingOrder = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      maxPlayers: null == maxPlayers
          ? _value.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      timeLimitSec: null == timeLimitSec
          ? _value.timeLimitSec
          : timeLimitSec // ignore: cast_nullable_to_non_nullable
              as int,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<GamePlayer>,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as GameRoomState,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      spy: null == spy
          ? _value.spy
          : spy // ignore: cast_nullable_to_non_nullable
              as String,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as GameKeyword,
      strokeLeft: null == strokeLeft
          ? _value.strokeLeft
          : strokeLeft // ignore: cast_nullable_to_non_nullable
              as int,
      currentDrawingOrder: null == currentDrawingOrder
          ? _value.currentDrawingOrder
          : currentDrawingOrder // ignore: cast_nullable_to_non_nullable
              as int,
      drawingOrder: null == drawingOrder
          ? _value.drawingOrder
          : drawingOrder // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameKeywordCopyWith<$Res> get keyword {
    return $GameKeywordCopyWith<$Res>(_value.keyword, (value) {
      return _then(_value.copyWith(keyword: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameRoomImplCopyWith<$Res>
    implements $GameRoomCopyWith<$Res> {
  factory _$$GameRoomImplCopyWith(
          _$GameRoomImpl value, $Res Function(_$GameRoomImpl) then) =
      __$$GameRoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String host,
      int maxPlayers,
      int timeLimitSec,
      List<GamePlayer> players,
      GameRoomState state,
      @TimeSerializer() DateTime createdAt,
      String spy,
      GameKeyword keyword,
      int strokeLeft,
      int currentDrawingOrder,
      List<String> drawingOrder});

  @override
  $GameKeywordCopyWith<$Res> get keyword;
}

/// @nodoc
class __$$GameRoomImplCopyWithImpl<$Res>
    extends _$GameRoomCopyWithImpl<$Res, _$GameRoomImpl>
    implements _$$GameRoomImplCopyWith<$Res> {
  __$$GameRoomImplCopyWithImpl(
      _$GameRoomImpl _value, $Res Function(_$GameRoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? host = null,
    Object? maxPlayers = null,
    Object? timeLimitSec = null,
    Object? players = null,
    Object? state = null,
    Object? createdAt = null,
    Object? spy = null,
    Object? keyword = null,
    Object? strokeLeft = null,
    Object? currentDrawingOrder = null,
    Object? drawingOrder = null,
  }) {
    return _then(_$GameRoomImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      maxPlayers: null == maxPlayers
          ? _value.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      timeLimitSec: null == timeLimitSec
          ? _value.timeLimitSec
          : timeLimitSec // ignore: cast_nullable_to_non_nullable
              as int,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<GamePlayer>,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as GameRoomState,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      spy: null == spy
          ? _value.spy
          : spy // ignore: cast_nullable_to_non_nullable
              as String,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as GameKeyword,
      strokeLeft: null == strokeLeft
          ? _value.strokeLeft
          : strokeLeft // ignore: cast_nullable_to_non_nullable
              as int,
      currentDrawingOrder: null == currentDrawingOrder
          ? _value.currentDrawingOrder
          : currentDrawingOrder // ignore: cast_nullable_to_non_nullable
              as int,
      drawingOrder: null == drawingOrder
          ? _value._drawingOrder
          : drawingOrder // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameRoomImpl extends _GameRoom {
  _$GameRoomImpl(
      {required this.id,
      required this.host,
      required this.maxPlayers,
      required this.timeLimitSec,
      required final List<GamePlayer> players,
      required this.state,
      @TimeSerializer() required this.createdAt,
      required this.spy,
      required this.keyword,
      required this.strokeLeft,
      required this.currentDrawingOrder,
      required final List<String> drawingOrder})
      : _players = players,
        _drawingOrder = drawingOrder,
        super._();

  factory _$GameRoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameRoomImplFromJson(json);

  @override
  final String id;
  @override
  final String host;
  @override
  final int maxPlayers;
  @override
  final int timeLimitSec;
  final List<GamePlayer> _players;
  @override
  List<GamePlayer> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  final GameRoomState state;
  @override
  @TimeSerializer()
  final DateTime createdAt;

  /// Playing
  @override
  final String spy;
  @override
  final GameKeyword keyword;
  @override
  final int strokeLeft;
  @override
  final int currentDrawingOrder;
  final List<String> _drawingOrder;
  @override
  List<String> get drawingOrder {
    if (_drawingOrder is EqualUnmodifiableListView) return _drawingOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drawingOrder);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameRoomImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.maxPlayers, maxPlayers) ||
                other.maxPlayers == maxPlayers) &&
            (identical(other.timeLimitSec, timeLimitSec) ||
                other.timeLimitSec == timeLimitSec) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.spy, spy) || other.spy == spy) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.strokeLeft, strokeLeft) ||
                other.strokeLeft == strokeLeft) &&
            (identical(other.currentDrawingOrder, currentDrawingOrder) ||
                other.currentDrawingOrder == currentDrawingOrder) &&
            const DeepCollectionEquality()
                .equals(other._drawingOrder, _drawingOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      host,
      maxPlayers,
      timeLimitSec,
      const DeepCollectionEquality().hash(_players),
      state,
      createdAt,
      spy,
      keyword,
      strokeLeft,
      currentDrawingOrder,
      const DeepCollectionEquality().hash(_drawingOrder));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameRoomImplCopyWith<_$GameRoomImpl> get copyWith =>
      __$$GameRoomImplCopyWithImpl<_$GameRoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameRoomImplToJson(
      this,
    );
  }
}

abstract class _GameRoom extends GameRoom {
  factory _GameRoom(
      {required final String id,
      required final String host,
      required final int maxPlayers,
      required final int timeLimitSec,
      required final List<GamePlayer> players,
      required final GameRoomState state,
      @TimeSerializer() required final DateTime createdAt,
      required final String spy,
      required final GameKeyword keyword,
      required final int strokeLeft,
      required final int currentDrawingOrder,
      required final List<String> drawingOrder}) = _$GameRoomImpl;
  _GameRoom._() : super._();

  factory _GameRoom.fromJson(Map<String, dynamic> json) =
      _$GameRoomImpl.fromJson;

  @override
  String get id;
  @override
  String get host;
  @override
  int get maxPlayers;
  @override
  int get timeLimitSec;
  @override
  List<GamePlayer> get players;
  @override
  GameRoomState get state;
  @override
  @TimeSerializer()
  DateTime get createdAt;
  @override

  /// Playing
  String get spy;
  @override
  GameKeyword get keyword;
  @override
  int get strokeLeft;
  @override
  int get currentDrawingOrder;
  @override
  List<String> get drawingOrder;
  @override
  @JsonKey(ignore: true)
  _$$GameRoomImplCopyWith<_$GameRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
