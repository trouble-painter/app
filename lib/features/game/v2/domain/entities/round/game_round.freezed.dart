// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_round.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameRound _$GameRoundFromJson(Map<String, dynamic> json) {
  return _GameRound.fromJson(json);
}

/// @nodoc
mixin _$GameRound {
  String get id => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;
  String get spyAnswer => throw _privateConstructorUsedError;
  Map<int, int> get voting => throw _privateConstructorUsedError;
  String get hostId => throw _privateConstructorUsedError;
  String get spyId => throw _privateConstructorUsedError;
  int get secondsLeft => throw _privateConstructorUsedError;
  GameKeyword get keyword => throw _privateConstructorUsedError;
  List<GamePlayer> get players => throw _privateConstructorUsedError;
  GameRoundSetting get setting => throw _privateConstructorUsedError;
  GameRoundStep get step => throw _privateConstructorUsedError;
  @TimeSerializer()
  DateTime get startedAt => throw _privateConstructorUsedError;
  String? get drawingId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameRoundCopyWith<GameRound> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameRoundCopyWith<$Res> {
  factory $GameRoundCopyWith(GameRound value, $Res Function(GameRound) then) =
      _$GameRoundCopyWithImpl<$Res, GameRound>;
  @useResult
  $Res call(
      {String id,
      String roomId,
      String spyAnswer,
      Map<int, int> voting,
      String hostId,
      String spyId,
      int secondsLeft,
      GameKeyword keyword,
      List<GamePlayer> players,
      GameRoundSetting setting,
      GameRoundStep step,
      @TimeSerializer() DateTime startedAt,
      String? drawingId});

  $GameKeywordCopyWith<$Res> get keyword;
  $GameRoundSettingCopyWith<$Res> get setting;
}

/// @nodoc
class _$GameRoundCopyWithImpl<$Res, $Val extends GameRound>
    implements $GameRoundCopyWith<$Res> {
  _$GameRoundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomId = null,
    Object? spyAnswer = null,
    Object? voting = null,
    Object? hostId = null,
    Object? spyId = null,
    Object? secondsLeft = null,
    Object? keyword = null,
    Object? players = null,
    Object? setting = null,
    Object? step = null,
    Object? startedAt = null,
    Object? drawingId = freezed,
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
      spyAnswer: null == spyAnswer
          ? _value.spyAnswer
          : spyAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      voting: null == voting
          ? _value.voting
          : voting // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      hostId: null == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as String,
      spyId: null == spyId
          ? _value.spyId
          : spyId // ignore: cast_nullable_to_non_nullable
              as String,
      secondsLeft: null == secondsLeft
          ? _value.secondsLeft
          : secondsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as GameKeyword,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<GamePlayer>,
      setting: null == setting
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as GameRoundSetting,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as GameRoundStep,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      drawingId: freezed == drawingId
          ? _value.drawingId
          : drawingId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameKeywordCopyWith<$Res> get keyword {
    return $GameKeywordCopyWith<$Res>(_value.keyword, (value) {
      return _then(_value.copyWith(keyword: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GameRoundSettingCopyWith<$Res> get setting {
    return $GameRoundSettingCopyWith<$Res>(_value.setting, (value) {
      return _then(_value.copyWith(setting: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameRoundImplCopyWith<$Res>
    implements $GameRoundCopyWith<$Res> {
  factory _$$GameRoundImplCopyWith(
          _$GameRoundImpl value, $Res Function(_$GameRoundImpl) then) =
      __$$GameRoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String roomId,
      String spyAnswer,
      Map<int, int> voting,
      String hostId,
      String spyId,
      int secondsLeft,
      GameKeyword keyword,
      List<GamePlayer> players,
      GameRoundSetting setting,
      GameRoundStep step,
      @TimeSerializer() DateTime startedAt,
      String? drawingId});

  @override
  $GameKeywordCopyWith<$Res> get keyword;
  @override
  $GameRoundSettingCopyWith<$Res> get setting;
}

/// @nodoc
class __$$GameRoundImplCopyWithImpl<$Res>
    extends _$GameRoundCopyWithImpl<$Res, _$GameRoundImpl>
    implements _$$GameRoundImplCopyWith<$Res> {
  __$$GameRoundImplCopyWithImpl(
      _$GameRoundImpl _value, $Res Function(_$GameRoundImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomId = null,
    Object? spyAnswer = null,
    Object? voting = null,
    Object? hostId = null,
    Object? spyId = null,
    Object? secondsLeft = null,
    Object? keyword = null,
    Object? players = null,
    Object? setting = null,
    Object? step = null,
    Object? startedAt = null,
    Object? drawingId = freezed,
  }) {
    return _then(_$GameRoundImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      spyAnswer: null == spyAnswer
          ? _value.spyAnswer
          : spyAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      voting: null == voting
          ? _value._voting
          : voting // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      hostId: null == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as String,
      spyId: null == spyId
          ? _value.spyId
          : spyId // ignore: cast_nullable_to_non_nullable
              as String,
      secondsLeft: null == secondsLeft
          ? _value.secondsLeft
          : secondsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as GameKeyword,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<GamePlayer>,
      setting: null == setting
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as GameRoundSetting,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as GameRoundStep,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      drawingId: freezed == drawingId
          ? _value.drawingId
          : drawingId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameRoundImpl extends _GameRound {
  _$GameRoundImpl(
      {required this.id,
      required this.roomId,
      required this.spyAnswer,
      required final Map<int, int> voting,
      required this.hostId,
      required this.spyId,
      required this.secondsLeft,
      required this.keyword,
      required final List<GamePlayer> players,
      required this.setting,
      required this.step,
      @TimeSerializer() required this.startedAt,
      this.drawingId})
      : _voting = voting,
        _players = players,
        super._();

  factory _$GameRoundImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameRoundImplFromJson(json);

  @override
  final String id;
  @override
  final String roomId;
  @override
  final String spyAnswer;
  final Map<int, int> _voting;
  @override
  Map<int, int> get voting {
    if (_voting is EqualUnmodifiableMapView) return _voting;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_voting);
  }

  @override
  final String hostId;
  @override
  final String spyId;
  @override
  final int secondsLeft;
  @override
  final GameKeyword keyword;
  final List<GamePlayer> _players;
  @override
  List<GamePlayer> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  final GameRoundSetting setting;
  @override
  final GameRoundStep step;
  @override
  @TimeSerializer()
  final DateTime startedAt;
  @override
  final String? drawingId;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameRoundImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.spyAnswer, spyAnswer) ||
                other.spyAnswer == spyAnswer) &&
            const DeepCollectionEquality().equals(other._voting, _voting) &&
            (identical(other.hostId, hostId) || other.hostId == hostId) &&
            (identical(other.spyId, spyId) || other.spyId == spyId) &&
            (identical(other.secondsLeft, secondsLeft) ||
                other.secondsLeft == secondsLeft) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.setting, setting) || other.setting == setting) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.drawingId, drawingId) ||
                other.drawingId == drawingId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      roomId,
      spyAnswer,
      const DeepCollectionEquality().hash(_voting),
      hostId,
      spyId,
      secondsLeft,
      keyword,
      const DeepCollectionEquality().hash(_players),
      setting,
      step,
      startedAt,
      drawingId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameRoundImplCopyWith<_$GameRoundImpl> get copyWith =>
      __$$GameRoundImplCopyWithImpl<_$GameRoundImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameRoundImplToJson(
      this,
    );
  }
}

abstract class _GameRound extends GameRound {
  factory _GameRound(
      {required final String id,
      required final String roomId,
      required final String spyAnswer,
      required final Map<int, int> voting,
      required final String hostId,
      required final String spyId,
      required final int secondsLeft,
      required final GameKeyword keyword,
      required final List<GamePlayer> players,
      required final GameRoundSetting setting,
      required final GameRoundStep step,
      @TimeSerializer() required final DateTime startedAt,
      final String? drawingId}) = _$GameRoundImpl;
  _GameRound._() : super._();

  factory _GameRound.fromJson(Map<String, dynamic> json) =
      _$GameRoundImpl.fromJson;

  @override
  String get id;
  @override
  String get roomId;
  @override
  String get spyAnswer;
  @override
  Map<int, int> get voting;
  @override
  String get hostId;
  @override
  String get spyId;
  @override
  int get secondsLeft;
  @override
  GameKeyword get keyword;
  @override
  List<GamePlayer> get players;
  @override
  GameRoundSetting get setting;
  @override
  GameRoundStep get step;
  @override
  @TimeSerializer()
  DateTime get startedAt;
  @override
  String? get drawingId;
  @override
  @JsonKey(ignore: true)
  _$$GameRoundImplCopyWith<_$GameRoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
