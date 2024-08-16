// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_round_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameRoundSetting _$GameRoundSettingFromJson(Map<String, dynamic> json) {
  return _GameRoundSetting.fromJson(json);
}

/// @nodoc
mixin _$GameRoundSetting {
  int get waitingSec => throw _privateConstructorUsedError;
  int get drawingSecLimit => throw _privateConstructorUsedError;
  int get drawingStokeLimit => throw _privateConstructorUsedError;
  int get stepLimit => throw _privateConstructorUsedError;
  int get votingSecLimit => throw _privateConstructorUsedError;
  int get spyAnsweringSecLimit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameRoundSettingCopyWith<GameRoundSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameRoundSettingCopyWith<$Res> {
  factory $GameRoundSettingCopyWith(
          GameRoundSetting value, $Res Function(GameRoundSetting) then) =
      _$GameRoundSettingCopyWithImpl<$Res, GameRoundSetting>;
  @useResult
  $Res call(
      {int waitingSec,
      int drawingSecLimit,
      int drawingStokeLimit,
      int stepLimit,
      int votingSecLimit,
      int spyAnsweringSecLimit});
}

/// @nodoc
class _$GameRoundSettingCopyWithImpl<$Res, $Val extends GameRoundSetting>
    implements $GameRoundSettingCopyWith<$Res> {
  _$GameRoundSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? waitingSec = null,
    Object? drawingSecLimit = null,
    Object? drawingStokeLimit = null,
    Object? stepLimit = null,
    Object? votingSecLimit = null,
    Object? spyAnsweringSecLimit = null,
  }) {
    return _then(_value.copyWith(
      waitingSec: null == waitingSec
          ? _value.waitingSec
          : waitingSec // ignore: cast_nullable_to_non_nullable
              as int,
      drawingSecLimit: null == drawingSecLimit
          ? _value.drawingSecLimit
          : drawingSecLimit // ignore: cast_nullable_to_non_nullable
              as int,
      drawingStokeLimit: null == drawingStokeLimit
          ? _value.drawingStokeLimit
          : drawingStokeLimit // ignore: cast_nullable_to_non_nullable
              as int,
      stepLimit: null == stepLimit
          ? _value.stepLimit
          : stepLimit // ignore: cast_nullable_to_non_nullable
              as int,
      votingSecLimit: null == votingSecLimit
          ? _value.votingSecLimit
          : votingSecLimit // ignore: cast_nullable_to_non_nullable
              as int,
      spyAnsweringSecLimit: null == spyAnsweringSecLimit
          ? _value.spyAnsweringSecLimit
          : spyAnsweringSecLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameRoundSettingImplCopyWith<$Res>
    implements $GameRoundSettingCopyWith<$Res> {
  factory _$$GameRoundSettingImplCopyWith(_$GameRoundSettingImpl value,
          $Res Function(_$GameRoundSettingImpl) then) =
      __$$GameRoundSettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int waitingSec,
      int drawingSecLimit,
      int drawingStokeLimit,
      int stepLimit,
      int votingSecLimit,
      int spyAnsweringSecLimit});
}

/// @nodoc
class __$$GameRoundSettingImplCopyWithImpl<$Res>
    extends _$GameRoundSettingCopyWithImpl<$Res, _$GameRoundSettingImpl>
    implements _$$GameRoundSettingImplCopyWith<$Res> {
  __$$GameRoundSettingImplCopyWithImpl(_$GameRoundSettingImpl _value,
      $Res Function(_$GameRoundSettingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? waitingSec = null,
    Object? drawingSecLimit = null,
    Object? drawingStokeLimit = null,
    Object? stepLimit = null,
    Object? votingSecLimit = null,
    Object? spyAnsweringSecLimit = null,
  }) {
    return _then(_$GameRoundSettingImpl(
      waitingSec: null == waitingSec
          ? _value.waitingSec
          : waitingSec // ignore: cast_nullable_to_non_nullable
              as int,
      drawingSecLimit: null == drawingSecLimit
          ? _value.drawingSecLimit
          : drawingSecLimit // ignore: cast_nullable_to_non_nullable
              as int,
      drawingStokeLimit: null == drawingStokeLimit
          ? _value.drawingStokeLimit
          : drawingStokeLimit // ignore: cast_nullable_to_non_nullable
              as int,
      stepLimit: null == stepLimit
          ? _value.stepLimit
          : stepLimit // ignore: cast_nullable_to_non_nullable
              as int,
      votingSecLimit: null == votingSecLimit
          ? _value.votingSecLimit
          : votingSecLimit // ignore: cast_nullable_to_non_nullable
              as int,
      spyAnsweringSecLimit: null == spyAnsweringSecLimit
          ? _value.spyAnsweringSecLimit
          : spyAnsweringSecLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameRoundSettingImpl implements _GameRoundSetting {
  _$GameRoundSettingImpl(
      {required this.waitingSec,
      required this.drawingSecLimit,
      required this.drawingStokeLimit,
      required this.stepLimit,
      required this.votingSecLimit,
      required this.spyAnsweringSecLimit});

  factory _$GameRoundSettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameRoundSettingImplFromJson(json);

  @override
  final int waitingSec;
  @override
  final int drawingSecLimit;
  @override
  final int drawingStokeLimit;
  @override
  final int stepLimit;
  @override
  final int votingSecLimit;
  @override
  final int spyAnsweringSecLimit;

  @override
  String toString() {
    return 'GameRoundSetting(waitingSec: $waitingSec, drawingSecLimit: $drawingSecLimit, drawingStokeLimit: $drawingStokeLimit, stepLimit: $stepLimit, votingSecLimit: $votingSecLimit, spyAnsweringSecLimit: $spyAnsweringSecLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameRoundSettingImpl &&
            (identical(other.waitingSec, waitingSec) ||
                other.waitingSec == waitingSec) &&
            (identical(other.drawingSecLimit, drawingSecLimit) ||
                other.drawingSecLimit == drawingSecLimit) &&
            (identical(other.drawingStokeLimit, drawingStokeLimit) ||
                other.drawingStokeLimit == drawingStokeLimit) &&
            (identical(other.stepLimit, stepLimit) ||
                other.stepLimit == stepLimit) &&
            (identical(other.votingSecLimit, votingSecLimit) ||
                other.votingSecLimit == votingSecLimit) &&
            (identical(other.spyAnsweringSecLimit, spyAnsweringSecLimit) ||
                other.spyAnsweringSecLimit == spyAnsweringSecLimit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, waitingSec, drawingSecLimit,
      drawingStokeLimit, stepLimit, votingSecLimit, spyAnsweringSecLimit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameRoundSettingImplCopyWith<_$GameRoundSettingImpl> get copyWith =>
      __$$GameRoundSettingImplCopyWithImpl<_$GameRoundSettingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameRoundSettingImplToJson(
      this,
    );
  }
}

abstract class _GameRoundSetting implements GameRoundSetting {
  factory _GameRoundSetting(
      {required final int waitingSec,
      required final int drawingSecLimit,
      required final int drawingStokeLimit,
      required final int stepLimit,
      required final int votingSecLimit,
      required final int spyAnsweringSecLimit}) = _$GameRoundSettingImpl;

  factory _GameRoundSetting.fromJson(Map<String, dynamic> json) =
      _$GameRoundSettingImpl.fromJson;

  @override
  int get waitingSec;
  @override
  int get drawingSecLimit;
  @override
  int get drawingStokeLimit;
  @override
  int get stepLimit;
  @override
  int get votingSecLimit;
  @override
  int get spyAnsweringSecLimit;
  @override
  @JsonKey(ignore: true)
  _$$GameRoundSettingImplCopyWith<_$GameRoundSettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
