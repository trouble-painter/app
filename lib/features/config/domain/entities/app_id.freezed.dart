// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppId _$AppIdFromJson(Map<String, dynamic> json) {
  return _AppId.fromJson(json);
}

/// @nodoc
mixin _$AppId {
  String get aos => throw _privateConstructorUsedError;
  String get ios => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppIdCopyWith<AppId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppIdCopyWith<$Res> {
  factory $AppIdCopyWith(AppId value, $Res Function(AppId) then) =
      _$AppIdCopyWithImpl<$Res, AppId>;
  @useResult
  $Res call({String aos, String ios});
}

/// @nodoc
class _$AppIdCopyWithImpl<$Res, $Val extends AppId>
    implements $AppIdCopyWith<$Res> {
  _$AppIdCopyWithImpl(this._value, this._then);

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
abstract class _$$AppIdImplCopyWith<$Res> implements $AppIdCopyWith<$Res> {
  factory _$$AppIdImplCopyWith(
          _$AppIdImpl value, $Res Function(_$AppIdImpl) then) =
      __$$AppIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String aos, String ios});
}

/// @nodoc
class __$$AppIdImplCopyWithImpl<$Res>
    extends _$AppIdCopyWithImpl<$Res, _$AppIdImpl>
    implements _$$AppIdImplCopyWith<$Res> {
  __$$AppIdImplCopyWithImpl(
      _$AppIdImpl _value, $Res Function(_$AppIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aos = null,
    Object? ios = null,
  }) {
    return _then(_$AppIdImpl(
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
class _$AppIdImpl extends _AppId {
  _$AppIdImpl({required this.aos, required this.ios}) : super._();

  factory _$AppIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppIdImplFromJson(json);

  @override
  final String aos;
  @override
  final String ios;

  @override
  String toString() {
    return 'AppId(aos: $aos, ios: $ios)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppIdImpl &&
            (identical(other.aos, aos) || other.aos == aos) &&
            (identical(other.ios, ios) || other.ios == ios));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, aos, ios);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppIdImplCopyWith<_$AppIdImpl> get copyWith =>
      __$$AppIdImplCopyWithImpl<_$AppIdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppIdImplToJson(
      this,
    );
  }
}

abstract class _AppId extends AppId {
  factory _AppId({required final String aos, required final String ios}) =
      _$AppIdImpl;
  _AppId._() : super._();

  factory _AppId.fromJson(Map<String, dynamic> json) = _$AppIdImpl.fromJson;

  @override
  String get aos;
  @override
  String get ios;
  @override
  @JsonKey(ignore: true)
  _$$AppIdImplCopyWith<_$AppIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
