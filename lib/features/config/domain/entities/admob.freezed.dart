// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admob.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Admob _$AdmobFromJson(Map<String, dynamic> json) {
  return _Admob.fromJson(json);
}

/// @nodoc
mixin _$Admob {
  String get appId => throw _privateConstructorUsedError;
  String get quickStartRewardId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdmobCopyWith<Admob> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdmobCopyWith<$Res> {
  factory $AdmobCopyWith(Admob value, $Res Function(Admob) then) =
      _$AdmobCopyWithImpl<$Res, Admob>;
  @useResult
  $Res call({String appId, String quickStartRewardId});
}

/// @nodoc
class _$AdmobCopyWithImpl<$Res, $Val extends Admob>
    implements $AdmobCopyWith<$Res> {
  _$AdmobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? quickStartRewardId = null,
  }) {
    return _then(_value.copyWith(
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      quickStartRewardId: null == quickStartRewardId
          ? _value.quickStartRewardId
          : quickStartRewardId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdmobImplCopyWith<$Res> implements $AdmobCopyWith<$Res> {
  factory _$$AdmobImplCopyWith(
          _$AdmobImpl value, $Res Function(_$AdmobImpl) then) =
      __$$AdmobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String appId, String quickStartRewardId});
}

/// @nodoc
class __$$AdmobImplCopyWithImpl<$Res>
    extends _$AdmobCopyWithImpl<$Res, _$AdmobImpl>
    implements _$$AdmobImplCopyWith<$Res> {
  __$$AdmobImplCopyWithImpl(
      _$AdmobImpl _value, $Res Function(_$AdmobImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? quickStartRewardId = null,
  }) {
    return _then(_$AdmobImpl(
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      quickStartRewardId: null == quickStartRewardId
          ? _value.quickStartRewardId
          : quickStartRewardId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdmobImpl extends _Admob {
  _$AdmobImpl({required this.appId, required this.quickStartRewardId})
      : super._();

  factory _$AdmobImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdmobImplFromJson(json);

  @override
  final String appId;
  @override
  final String quickStartRewardId;

  @override
  String toString() {
    return 'Admob(appId: $appId, quickStartRewardId: $quickStartRewardId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdmobImpl &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.quickStartRewardId, quickStartRewardId) ||
                other.quickStartRewardId == quickStartRewardId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, appId, quickStartRewardId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdmobImplCopyWith<_$AdmobImpl> get copyWith =>
      __$$AdmobImplCopyWithImpl<_$AdmobImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdmobImplToJson(
      this,
    );
  }
}

abstract class _Admob extends Admob {
  factory _Admob(
      {required final String appId,
      required final String quickStartRewardId}) = _$AdmobImpl;
  _Admob._() : super._();

  factory _Admob.fromJson(Map<String, dynamic> json) = _$AdmobImpl.fromJson;

  @override
  String get appId;
  @override
  String get quickStartRewardId;
  @override
  @JsonKey(ignore: true)
  _$$AdmobImplCopyWith<_$AdmobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
