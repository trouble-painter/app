// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_admob_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemoteConfigAdmobId _$RemoteConfigAdmobIdFromJson(Map<String, dynamic> json) {
  return _RemoteConfigAdmobId.fromJson(json);
}

/// @nodoc
mixin _$RemoteConfigAdmobId {
  String get aos => throw _privateConstructorUsedError;
  String get ios => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteConfigAdmobIdCopyWith<RemoteConfigAdmobId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteConfigAdmobIdCopyWith<$Res> {
  factory $RemoteConfigAdmobIdCopyWith(
          RemoteConfigAdmobId value, $Res Function(RemoteConfigAdmobId) then) =
      _$RemoteConfigAdmobIdCopyWithImpl<$Res, RemoteConfigAdmobId>;
  @useResult
  $Res call({String aos, String ios});
}

/// @nodoc
class _$RemoteConfigAdmobIdCopyWithImpl<$Res, $Val extends RemoteConfigAdmobId>
    implements $RemoteConfigAdmobIdCopyWith<$Res> {
  _$RemoteConfigAdmobIdCopyWithImpl(this._value, this._then);

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
              as String,
      ios: null == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoteConfigAdmobIdImplCopyWith<$Res>
    implements $RemoteConfigAdmobIdCopyWith<$Res> {
  factory _$$RemoteConfigAdmobIdImplCopyWith(_$RemoteConfigAdmobIdImpl value,
          $Res Function(_$RemoteConfigAdmobIdImpl) then) =
      __$$RemoteConfigAdmobIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String aos, String ios});
}

/// @nodoc
class __$$RemoteConfigAdmobIdImplCopyWithImpl<$Res>
    extends _$RemoteConfigAdmobIdCopyWithImpl<$Res, _$RemoteConfigAdmobIdImpl>
    implements _$$RemoteConfigAdmobIdImplCopyWith<$Res> {
  __$$RemoteConfigAdmobIdImplCopyWithImpl(_$RemoteConfigAdmobIdImpl _value,
      $Res Function(_$RemoteConfigAdmobIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aos = null,
    Object? ios = null,
  }) {
    return _then(_$RemoteConfigAdmobIdImpl(
      aos: null == aos
          ? _value.aos
          : aos // ignore: cast_nullable_to_non_nullable
              as String,
      ios: null == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoteConfigAdmobIdImpl extends _RemoteConfigAdmobId {
  _$RemoteConfigAdmobIdImpl({required this.aos, required this.ios}) : super._();

  factory _$RemoteConfigAdmobIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoteConfigAdmobIdImplFromJson(json);

  @override
  final String aos;
  @override
  final String ios;

  @override
  String toString() {
    return 'RemoteConfigAdmobId(aos: $aos, ios: $ios)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteConfigAdmobIdImpl &&
            (identical(other.aos, aos) || other.aos == aos) &&
            (identical(other.ios, ios) || other.ios == ios));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, aos, ios);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteConfigAdmobIdImplCopyWith<_$RemoteConfigAdmobIdImpl> get copyWith =>
      __$$RemoteConfigAdmobIdImplCopyWithImpl<_$RemoteConfigAdmobIdImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoteConfigAdmobIdImplToJson(
      this,
    );
  }
}

abstract class _RemoteConfigAdmobId extends RemoteConfigAdmobId {
  factory _RemoteConfigAdmobId(
      {required final String aos,
      required final String ios}) = _$RemoteConfigAdmobIdImpl;
  _RemoteConfigAdmobId._() : super._();

  factory _RemoteConfigAdmobId.fromJson(Map<String, dynamic> json) =
      _$RemoteConfigAdmobIdImpl.fromJson;

  @override
  String get aos;
  @override
  String get ios;
  @override
  @JsonKey(ignore: true)
  _$$RemoteConfigAdmobIdImplCopyWith<_$RemoteConfigAdmobIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
