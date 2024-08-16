// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_keyword.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameKeyword _$GameKeywordFromJson(Map<String, dynamic> json) {
  return _GameKeyword.fromJson(json);
}

/// @nodoc
mixin _$GameKeyword {
  GameCategory get category => throw _privateConstructorUsedError;
  String get ko => throw _privateConstructorUsedError;
  String get en => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameKeywordCopyWith<GameKeyword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameKeywordCopyWith<$Res> {
  factory $GameKeywordCopyWith(
          GameKeyword value, $Res Function(GameKeyword) then) =
      _$GameKeywordCopyWithImpl<$Res, GameKeyword>;
  @useResult
  $Res call({GameCategory category, String ko, String en});
}

/// @nodoc
class _$GameKeywordCopyWithImpl<$Res, $Val extends GameKeyword>
    implements $GameKeywordCopyWith<$Res> {
  _$GameKeywordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? ko = null,
    Object? en = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as GameCategory,
      ko: null == ko
          ? _value.ko
          : ko // ignore: cast_nullable_to_non_nullable
              as String,
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameKeywordImplCopyWith<$Res>
    implements $GameKeywordCopyWith<$Res> {
  factory _$$GameKeywordImplCopyWith(
          _$GameKeywordImpl value, $Res Function(_$GameKeywordImpl) then) =
      __$$GameKeywordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GameCategory category, String ko, String en});
}

/// @nodoc
class __$$GameKeywordImplCopyWithImpl<$Res>
    extends _$GameKeywordCopyWithImpl<$Res, _$GameKeywordImpl>
    implements _$$GameKeywordImplCopyWith<$Res> {
  __$$GameKeywordImplCopyWithImpl(
      _$GameKeywordImpl _value, $Res Function(_$GameKeywordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? ko = null,
    Object? en = null,
  }) {
    return _then(_$GameKeywordImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as GameCategory,
      ko: null == ko
          ? _value.ko
          : ko // ignore: cast_nullable_to_non_nullable
              as String,
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameKeywordImpl extends _GameKeyword {
  _$GameKeywordImpl(
      {required this.category, required this.ko, required this.en})
      : super._();

  factory _$GameKeywordImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameKeywordImplFromJson(json);

  @override
  final GameCategory category;
  @override
  final String ko;
  @override
  final String en;

  @override
  String toString() {
    return 'GameKeyword(category: $category, ko: $ko, en: $en)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameKeywordImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.ko, ko) || other.ko == ko) &&
            (identical(other.en, en) || other.en == en));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, category, ko, en);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameKeywordImplCopyWith<_$GameKeywordImpl> get copyWith =>
      __$$GameKeywordImplCopyWithImpl<_$GameKeywordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameKeywordImplToJson(
      this,
    );
  }
}

abstract class _GameKeyword extends GameKeyword {
  factory _GameKeyword(
      {required final GameCategory category,
      required final String ko,
      required final String en}) = _$GameKeywordImpl;
  _GameKeyword._() : super._();

  factory _GameKeyword.fromJson(Map<String, dynamic> json) =
      _$GameKeywordImpl.fromJson;

  @override
  GameCategory get category;
  @override
  String get ko;
  @override
  String get en;
  @override
  @JsonKey(ignore: true)
  _$$GameKeywordImplCopyWith<_$GameKeywordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
