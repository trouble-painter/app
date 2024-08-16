// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'x_game_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

XGameInfo _$XGameInfoFromJson(Map<String, dynamic> json) {
  return _XGameInfo.fromJson(json);
}

/// @nodoc
mixin _$XGameInfo {
  int get mafiaUserId => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  List<XGameUser> get turnList => throw _privateConstructorUsedError;
  @JsonKey(name: "gameOption")
  XGameOption get option => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $XGameInfoCopyWith<XGameInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XGameInfoCopyWith<$Res> {
  factory $XGameInfoCopyWith(XGameInfo value, $Res Function(XGameInfo) then) =
      _$XGameInfoCopyWithImpl<$Res, XGameInfo>;
  @useResult
  $Res call(
      {int mafiaUserId,
      String category,
      String answer,
      List<XGameUser> turnList,
      @JsonKey(name: "gameOption") XGameOption option});

  $XGameOptionCopyWith<$Res> get option;
}

/// @nodoc
class _$XGameInfoCopyWithImpl<$Res, $Val extends XGameInfo>
    implements $XGameInfoCopyWith<$Res> {
  _$XGameInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mafiaUserId = null,
    Object? category = null,
    Object? answer = null,
    Object? turnList = null,
    Object? option = null,
  }) {
    return _then(_value.copyWith(
      mafiaUserId: null == mafiaUserId
          ? _value.mafiaUserId
          : mafiaUserId // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      turnList: null == turnList
          ? _value.turnList
          : turnList // ignore: cast_nullable_to_non_nullable
              as List<XGameUser>,
      option: null == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as XGameOption,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $XGameOptionCopyWith<$Res> get option {
    return $XGameOptionCopyWith<$Res>(_value.option, (value) {
      return _then(_value.copyWith(option: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$XGameInfoImplCopyWith<$Res>
    implements $XGameInfoCopyWith<$Res> {
  factory _$$XGameInfoImplCopyWith(
          _$XGameInfoImpl value, $Res Function(_$XGameInfoImpl) then) =
      __$$XGameInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int mafiaUserId,
      String category,
      String answer,
      List<XGameUser> turnList,
      @JsonKey(name: "gameOption") XGameOption option});

  @override
  $XGameOptionCopyWith<$Res> get option;
}

/// @nodoc
class __$$XGameInfoImplCopyWithImpl<$Res>
    extends _$XGameInfoCopyWithImpl<$Res, _$XGameInfoImpl>
    implements _$$XGameInfoImplCopyWith<$Res> {
  __$$XGameInfoImplCopyWithImpl(
      _$XGameInfoImpl _value, $Res Function(_$XGameInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mafiaUserId = null,
    Object? category = null,
    Object? answer = null,
    Object? turnList = null,
    Object? option = null,
  }) {
    return _then(_$XGameInfoImpl(
      mafiaUserId: null == mafiaUserId
          ? _value.mafiaUserId
          : mafiaUserId // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      turnList: null == turnList
          ? _value._turnList
          : turnList // ignore: cast_nullable_to_non_nullable
              as List<XGameUser>,
      option: null == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as XGameOption,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$XGameInfoImpl extends _XGameInfo {
  _$XGameInfoImpl(
      {required this.mafiaUserId,
      required this.category,
      required this.answer,
      required final List<XGameUser> turnList,
      @JsonKey(name: "gameOption") required this.option})
      : _turnList = turnList,
        super._();

  factory _$XGameInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$XGameInfoImplFromJson(json);

  @override
  final int mafiaUserId;
  @override
  final String category;
  @override
  final String answer;
  final List<XGameUser> _turnList;
  @override
  List<XGameUser> get turnList {
    if (_turnList is EqualUnmodifiableListView) return _turnList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_turnList);
  }

  @override
  @JsonKey(name: "gameOption")
  final XGameOption option;

  @override
  String toString() {
    return 'XGameInfo(mafiaUserId: $mafiaUserId, category: $category, answer: $answer, turnList: $turnList, option: $option)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$XGameInfoImpl &&
            (identical(other.mafiaUserId, mafiaUserId) ||
                other.mafiaUserId == mafiaUserId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            const DeepCollectionEquality().equals(other._turnList, _turnList) &&
            (identical(other.option, option) || other.option == option));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mafiaUserId, category, answer,
      const DeepCollectionEquality().hash(_turnList), option);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$XGameInfoImplCopyWith<_$XGameInfoImpl> get copyWith =>
      __$$XGameInfoImplCopyWithImpl<_$XGameInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$XGameInfoImplToJson(
      this,
    );
  }
}

abstract class _XGameInfo extends XGameInfo {
  factory _XGameInfo(
          {required final int mafiaUserId,
          required final String category,
          required final String answer,
          required final List<XGameUser> turnList,
          @JsonKey(name: "gameOption") required final XGameOption option}) =
      _$XGameInfoImpl;
  _XGameInfo._() : super._();

  factory _XGameInfo.fromJson(Map<String, dynamic> json) =
      _$XGameInfoImpl.fromJson;

  @override
  int get mafiaUserId;
  @override
  String get category;
  @override
  String get answer;
  @override
  List<XGameUser> get turnList;
  @override
  @JsonKey(name: "gameOption")
  XGameOption get option;
  @override
  @JsonKey(ignore: true)
  _$$XGameInfoImplCopyWith<_$XGameInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
