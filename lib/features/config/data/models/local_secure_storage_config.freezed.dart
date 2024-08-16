// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_secure_storage_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocalSecureStorageConfig _$LocalSecureStorageConfigFromJson(
    Map<String, dynamic> json) {
  return _LocalSecureStorageConfig.fromJson(json);
}

/// @nodoc
mixin _$LocalSecureStorageConfig {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalSecureStorageConfigCopyWith<$Res> {
  factory $LocalSecureStorageConfigCopyWith(LocalSecureStorageConfig value,
          $Res Function(LocalSecureStorageConfig) then) =
      _$LocalSecureStorageConfigCopyWithImpl<$Res, LocalSecureStorageConfig>;
}

/// @nodoc
class _$LocalSecureStorageConfigCopyWithImpl<$Res,
        $Val extends LocalSecureStorageConfig>
    implements $LocalSecureStorageConfigCopyWith<$Res> {
  _$LocalSecureStorageConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LocalSecureStorageConfigImplCopyWith<$Res> {
  factory _$$LocalSecureStorageConfigImplCopyWith(
          _$LocalSecureStorageConfigImpl value,
          $Res Function(_$LocalSecureStorageConfigImpl) then) =
      __$$LocalSecureStorageConfigImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LocalSecureStorageConfigImplCopyWithImpl<$Res>
    extends _$LocalSecureStorageConfigCopyWithImpl<$Res,
        _$LocalSecureStorageConfigImpl>
    implements _$$LocalSecureStorageConfigImplCopyWith<$Res> {
  __$$LocalSecureStorageConfigImplCopyWithImpl(
      _$LocalSecureStorageConfigImpl _value,
      $Res Function(_$LocalSecureStorageConfigImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$LocalSecureStorageConfigImpl implements _LocalSecureStorageConfig {
  _$LocalSecureStorageConfigImpl();

  factory _$LocalSecureStorageConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalSecureStorageConfigImplFromJson(json);

  @override
  String toString() {
    return 'LocalSecureStorageConfig()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalSecureStorageConfigImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalSecureStorageConfigImplToJson(
      this,
    );
  }
}

abstract class _LocalSecureStorageConfig implements LocalSecureStorageConfig {
  factory _LocalSecureStorageConfig() = _$LocalSecureStorageConfigImpl;

  factory _LocalSecureStorageConfig.fromJson(Map<String, dynamic> json) =
      _$LocalSecureStorageConfigImpl.fromJson;
}
