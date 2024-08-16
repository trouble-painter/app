// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_lang.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemoteConfigLang _$RemoteConfigLangFromJson(Map<String, dynamic> json) {
  return _RemoteConfigLang.fromJson(json);
}

/// @nodoc
mixin _$RemoteConfigLang {
  String get ko => throw _privateConstructorUsedError;
  String get en => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteConfigLangCopyWith<RemoteConfigLang> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteConfigLangCopyWith<$Res> {
  factory $RemoteConfigLangCopyWith(
          RemoteConfigLang value, $Res Function(RemoteConfigLang) then) =
      _$RemoteConfigLangCopyWithImpl<$Res, RemoteConfigLang>;
  @useResult
  $Res call({String ko, String en});
}

/// @nodoc
class _$RemoteConfigLangCopyWithImpl<$Res, $Val extends RemoteConfigLang>
    implements $RemoteConfigLangCopyWith<$Res> {
  _$RemoteConfigLangCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ko = null,
    Object? en = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$RemoteConfigLangImplCopyWith<$Res>
    implements $RemoteConfigLangCopyWith<$Res> {
  factory _$$RemoteConfigLangImplCopyWith(_$RemoteConfigLangImpl value,
          $Res Function(_$RemoteConfigLangImpl) then) =
      __$$RemoteConfigLangImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String ko, String en});
}

/// @nodoc
class __$$RemoteConfigLangImplCopyWithImpl<$Res>
    extends _$RemoteConfigLangCopyWithImpl<$Res, _$RemoteConfigLangImpl>
    implements _$$RemoteConfigLangImplCopyWith<$Res> {
  __$$RemoteConfigLangImplCopyWithImpl(_$RemoteConfigLangImpl _value,
      $Res Function(_$RemoteConfigLangImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ko = null,
    Object? en = null,
  }) {
    return _then(_$RemoteConfigLangImpl(
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
class _$RemoteConfigLangImpl extends _RemoteConfigLang {
  _$RemoteConfigLangImpl({this.ko = "", this.en = ""}) : super._();

  factory _$RemoteConfigLangImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoteConfigLangImplFromJson(json);

  @override
  @JsonKey()
  final String ko;
  @override
  @JsonKey()
  final String en;

  @override
  String toString() {
    return 'RemoteConfigLang(ko: $ko, en: $en)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteConfigLangImpl &&
            (identical(other.ko, ko) || other.ko == ko) &&
            (identical(other.en, en) || other.en == en));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ko, en);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteConfigLangImplCopyWith<_$RemoteConfigLangImpl> get copyWith =>
      __$$RemoteConfigLangImplCopyWithImpl<_$RemoteConfigLangImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoteConfigLangImplToJson(
      this,
    );
  }
}

abstract class _RemoteConfigLang extends RemoteConfigLang {
  factory _RemoteConfigLang({final String ko, final String en}) =
      _$RemoteConfigLangImpl;
  _RemoteConfigLang._() : super._();

  factory _RemoteConfigLang.fromJson(Map<String, dynamic> json) =
      _$RemoteConfigLangImpl.fromJson;

  @override
  String get ko;
  @override
  String get en;
  @override
  @JsonKey(ignore: true)
  _$$RemoteConfigLangImplCopyWith<_$RemoteConfigLangImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
