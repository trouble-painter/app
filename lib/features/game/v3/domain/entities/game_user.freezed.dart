// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameUser _$GameUserFromJson(Map<String, dynamic> json) {
  return _GameUser.fromJson(json);
}

/// @nodoc
mixin _$GameUser {
  int get id => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  bool get isConnect => throw _privateConstructorUsedError;
  @JsonKey(name: "colorCode")
  @ColorSerializer()
  Color get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameUserCopyWith<GameUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameUserCopyWith<$Res> {
  factory $GameUserCopyWith(GameUser value, $Res Function(GameUser) then) =
      _$GameUserCopyWithImpl<$Res, GameUser>;
  @useResult
  $Res call(
      {int id,
      String nickname,
      bool isConnect,
      @JsonKey(name: "colorCode") @ColorSerializer() Color color});
}

/// @nodoc
class _$GameUserCopyWithImpl<$Res, $Val extends GameUser>
    implements $GameUserCopyWith<$Res> {
  _$GameUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? isConnect = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      isConnect: null == isConnect
          ? _value.isConnect
          : isConnect // ignore: cast_nullable_to_non_nullable
              as bool,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameUserImplCopyWith<$Res>
    implements $GameUserCopyWith<$Res> {
  factory _$$GameUserImplCopyWith(
          _$GameUserImpl value, $Res Function(_$GameUserImpl) then) =
      __$$GameUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String nickname,
      bool isConnect,
      @JsonKey(name: "colorCode") @ColorSerializer() Color color});
}

/// @nodoc
class __$$GameUserImplCopyWithImpl<$Res>
    extends _$GameUserCopyWithImpl<$Res, _$GameUserImpl>
    implements _$$GameUserImplCopyWith<$Res> {
  __$$GameUserImplCopyWithImpl(
      _$GameUserImpl _value, $Res Function(_$GameUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? isConnect = null,
    Object? color = null,
  }) {
    return _then(_$GameUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      isConnect: null == isConnect
          ? _value.isConnect
          : isConnect // ignore: cast_nullable_to_non_nullable
              as bool,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameUserImpl extends _GameUser {
  _$GameUserImpl(
      {required this.id,
      required this.nickname,
      required this.isConnect,
      @JsonKey(name: "colorCode") @ColorSerializer() required this.color})
      : super._();

  factory _$GameUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameUserImplFromJson(json);

  @override
  final int id;
  @override
  final String nickname;
  @override
  final bool isConnect;
  @override
  @JsonKey(name: "colorCode")
  @ColorSerializer()
  final Color color;

  @override
  String toString() {
    return 'GameUser(id: $id, nickname: $nickname, isConnect: $isConnect, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.isConnect, isConnect) ||
                other.isConnect == isConnect) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nickname, isConnect, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameUserImplCopyWith<_$GameUserImpl> get copyWith =>
      __$$GameUserImplCopyWithImpl<_$GameUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameUserImplToJson(
      this,
    );
  }
}

abstract class _GameUser extends GameUser {
  factory _GameUser(
      {required final int id,
      required final String nickname,
      required final bool isConnect,
      @JsonKey(name: "colorCode")
      @ColorSerializer()
      required final Color color}) = _$GameUserImpl;
  _GameUser._() : super._();

  factory _GameUser.fromJson(Map<String, dynamic> json) =
      _$GameUserImpl.fromJson;

  @override
  int get id;
  @override
  String get nickname;
  @override
  bool get isConnect;
  @override
  @JsonKey(name: "colorCode")
  @ColorSerializer()
  Color get color;
  @override
  @JsonKey(ignore: true)
  _$$GameUserImplCopyWith<_$GameUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
