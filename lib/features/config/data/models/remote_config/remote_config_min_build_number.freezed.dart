// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_min_build_number.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemoteConfigMinBuildNumber _$RemoteConfigMinBuildNumberFromJson(
    Map<String, dynamic> json) {
  return _RemoteConfigMinBuildNumber.fromJson(json);
}

/// @nodoc
mixin _$RemoteConfigMinBuildNumber {
  int get aos => throw _privateConstructorUsedError;
  int get ios => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteConfigMinBuildNumberCopyWith<RemoteConfigMinBuildNumber>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteConfigMinBuildNumberCopyWith<$Res> {
  factory $RemoteConfigMinBuildNumberCopyWith(RemoteConfigMinBuildNumber value,
          $Res Function(RemoteConfigMinBuildNumber) then) =
      _$RemoteConfigMinBuildNumberCopyWithImpl<$Res,
          RemoteConfigMinBuildNumber>;
  @useResult
  $Res call({int aos, int ios});
}

/// @nodoc
class _$RemoteConfigMinBuildNumberCopyWithImpl<$Res,
        $Val extends RemoteConfigMinBuildNumber>
    implements $RemoteConfigMinBuildNumberCopyWith<$Res> {
  _$RemoteConfigMinBuildNumberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aos = null,
    Object? ios = null,
  }) {
    return _then(_value.copyWith(
      aos: null == aos
          ? _value.aos
          : aos // ignore: cast_nullable_to_non_nullable
              as int,
      ios: null == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoteConfigMinBuildNumberImplCopyWith<$Res>
    implements $RemoteConfigMinBuildNumberCopyWith<$Res> {
  factory _$$RemoteConfigMinBuildNumberImplCopyWith(
          _$RemoteConfigMinBuildNumberImpl value,
          $Res Function(_$RemoteConfigMinBuildNumberImpl) then) =
      __$$RemoteConfigMinBuildNumberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int aos, int ios});
}

/// @nodoc
class __$$RemoteConfigMinBuildNumberImplCopyWithImpl<$Res>
    extends _$RemoteConfigMinBuildNumberCopyWithImpl<$Res,
        _$RemoteConfigMinBuildNumberImpl>
    implements _$$RemoteConfigMinBuildNumberImplCopyWith<$Res> {
  __$$RemoteConfigMinBuildNumberImplCopyWithImpl(
      _$RemoteConfigMinBuildNumberImpl _value,
      $Res Function(_$RemoteConfigMinBuildNumberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aos = null,
    Object? ios = null,
  }) {
    return _then(_$RemoteConfigMinBuildNumberImpl(
      aos: null == aos
          ? _value.aos
          : aos // ignore: cast_nullable_to_non_nullable
              as int,
      ios: null == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoteConfigMinBuildNumberImpl extends _RemoteConfigMinBuildNumber {
  _$RemoteConfigMinBuildNumberImpl({this.aos = -1, this.ios = -1}) : super._();

  factory _$RemoteConfigMinBuildNumberImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RemoteConfigMinBuildNumberImplFromJson(json);

  @override
  @JsonKey()
  final int aos;
  @override
  @JsonKey()
  final int ios;

  @override
  String toString() {
    return 'RemoteConfigMinBuildNumber(aos: $aos, ios: $ios)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteConfigMinBuildNumberImpl &&
            (identical(other.aos, aos) || other.aos == aos) &&
            (identical(other.ios, ios) || other.ios == ios));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, aos, ios);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteConfigMinBuildNumberImplCopyWith<_$RemoteConfigMinBuildNumberImpl>
      get copyWith => __$$RemoteConfigMinBuildNumberImplCopyWithImpl<
          _$RemoteConfigMinBuildNumberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoteConfigMinBuildNumberImplToJson(
      this,
    );
  }
}

abstract class _RemoteConfigMinBuildNumber extends RemoteConfigMinBuildNumber {
  factory _RemoteConfigMinBuildNumber({final int aos, final int ios}) =
      _$RemoteConfigMinBuildNumberImpl;
  _RemoteConfigMinBuildNumber._() : super._();

  factory _RemoteConfigMinBuildNumber.fromJson(Map<String, dynamic> json) =
      _$RemoteConfigMinBuildNumberImpl.fromJson;

  @override
  int get aos;
  @override
  int get ios;
  @override
  @JsonKey(ignore: true)
  _$$RemoteConfigMinBuildNumberImplCopyWith<_$RemoteConfigMinBuildNumberImpl>
      get copyWith => throw _privateConstructorUsedError;
}
