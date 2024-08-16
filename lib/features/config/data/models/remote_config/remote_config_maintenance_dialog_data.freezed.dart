// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_maintenance_dialog_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemoteConfigMaintenanceDialogData _$RemoteConfigMaintenanceDialogDataFromJson(
    Map<String, dynamic> json) {
  return _RemoteConfigMaintenanceDialogData.fromJson(json);
}

/// @nodoc
mixin _$RemoteConfigMaintenanceDialogData {
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime get endedAt => throw _privateConstructorUsedError;
  RemoteConfigLang get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteConfigMaintenanceDialogDataCopyWith<RemoteConfigMaintenanceDialogData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteConfigMaintenanceDialogDataCopyWith<$Res> {
  factory $RemoteConfigMaintenanceDialogDataCopyWith(
          RemoteConfigMaintenanceDialogData value,
          $Res Function(RemoteConfigMaintenanceDialogData) then) =
      _$RemoteConfigMaintenanceDialogDataCopyWithImpl<$Res,
          RemoteConfigMaintenanceDialogData>;
  @useResult
  $Res call({DateTime startedAt, DateTime endedAt, RemoteConfigLang title});

  $RemoteConfigLangCopyWith<$Res> get title;
}

/// @nodoc
class _$RemoteConfigMaintenanceDialogDataCopyWithImpl<$Res,
        $Val extends RemoteConfigMaintenanceDialogData>
    implements $RemoteConfigMaintenanceDialogDataCopyWith<$Res> {
  _$RemoteConfigMaintenanceDialogDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startedAt = null,
    Object? endedAt = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endedAt: null == endedAt
          ? _value.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get title {
    return $RemoteConfigLangCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RemoteConfigMaintenanceDialogDataImplCopyWith<$Res>
    implements $RemoteConfigMaintenanceDialogDataCopyWith<$Res> {
  factory _$$RemoteConfigMaintenanceDialogDataImplCopyWith(
          _$RemoteConfigMaintenanceDialogDataImpl value,
          $Res Function(_$RemoteConfigMaintenanceDialogDataImpl) then) =
      __$$RemoteConfigMaintenanceDialogDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime startedAt, DateTime endedAt, RemoteConfigLang title});

  @override
  $RemoteConfigLangCopyWith<$Res> get title;
}

/// @nodoc
class __$$RemoteConfigMaintenanceDialogDataImplCopyWithImpl<$Res>
    extends _$RemoteConfigMaintenanceDialogDataCopyWithImpl<$Res,
        _$RemoteConfigMaintenanceDialogDataImpl>
    implements _$$RemoteConfigMaintenanceDialogDataImplCopyWith<$Res> {
  __$$RemoteConfigMaintenanceDialogDataImplCopyWithImpl(
      _$RemoteConfigMaintenanceDialogDataImpl _value,
      $Res Function(_$RemoteConfigMaintenanceDialogDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startedAt = null,
    Object? endedAt = null,
    Object? title = null,
  }) {
    return _then(_$RemoteConfigMaintenanceDialogDataImpl(
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endedAt: null == endedAt
          ? _value.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoteConfigMaintenanceDialogDataImpl
    extends _RemoteConfigMaintenanceDialogData {
  _$RemoteConfigMaintenanceDialogDataImpl(
      {required this.startedAt, required this.endedAt, required this.title})
      : super._();

  factory _$RemoteConfigMaintenanceDialogDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RemoteConfigMaintenanceDialogDataImplFromJson(json);

  @override
  final DateTime startedAt;
  @override
  final DateTime endedAt;
  @override
  final RemoteConfigLang title;

  @override
  String toString() {
    return 'RemoteConfigMaintenanceDialogData(startedAt: $startedAt, endedAt: $endedAt, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteConfigMaintenanceDialogDataImpl &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, startedAt, endedAt, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteConfigMaintenanceDialogDataImplCopyWith<
          _$RemoteConfigMaintenanceDialogDataImpl>
      get copyWith => __$$RemoteConfigMaintenanceDialogDataImplCopyWithImpl<
          _$RemoteConfigMaintenanceDialogDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoteConfigMaintenanceDialogDataImplToJson(
      this,
    );
  }
}

abstract class _RemoteConfigMaintenanceDialogData
    extends RemoteConfigMaintenanceDialogData {
  factory _RemoteConfigMaintenanceDialogData(
          {required final DateTime startedAt,
          required final DateTime endedAt,
          required final RemoteConfigLang title}) =
      _$RemoteConfigMaintenanceDialogDataImpl;
  _RemoteConfigMaintenanceDialogData._() : super._();

  factory _RemoteConfigMaintenanceDialogData.fromJson(
          Map<String, dynamic> json) =
      _$RemoteConfigMaintenanceDialogDataImpl.fromJson;

  @override
  DateTime get startedAt;
  @override
  DateTime get endedAt;
  @override
  RemoteConfigLang get title;
  @override
  @JsonKey(ignore: true)
  _$$RemoteConfigMaintenanceDialogDataImplCopyWith<
          _$RemoteConfigMaintenanceDialogDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
