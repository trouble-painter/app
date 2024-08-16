// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_dialog_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaintenanceDialogData _$MaintenanceDialogDataFromJson(
    Map<String, dynamic> json) {
  return _MaintenanceDialogData.fromJson(json);
}

/// @nodoc
mixin _$MaintenanceDialogData {
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime get endedAt => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaintenanceDialogDataCopyWith<MaintenanceDialogData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceDialogDataCopyWith<$Res> {
  factory $MaintenanceDialogDataCopyWith(MaintenanceDialogData value,
          $Res Function(MaintenanceDialogData) then) =
      _$MaintenanceDialogDataCopyWithImpl<$Res, MaintenanceDialogData>;
  @useResult
  $Res call({DateTime startedAt, DateTime endedAt, String title});
}

/// @nodoc
class _$MaintenanceDialogDataCopyWithImpl<$Res,
        $Val extends MaintenanceDialogData>
    implements $MaintenanceDialogDataCopyWith<$Res> {
  _$MaintenanceDialogDataCopyWithImpl(this._value, this._then);

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
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaintenanceDialogDataImplCopyWith<$Res>
    implements $MaintenanceDialogDataCopyWith<$Res> {
  factory _$$MaintenanceDialogDataImplCopyWith(
          _$MaintenanceDialogDataImpl value,
          $Res Function(_$MaintenanceDialogDataImpl) then) =
      __$$MaintenanceDialogDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime startedAt, DateTime endedAt, String title});
}

/// @nodoc
class __$$MaintenanceDialogDataImplCopyWithImpl<$Res>
    extends _$MaintenanceDialogDataCopyWithImpl<$Res,
        _$MaintenanceDialogDataImpl>
    implements _$$MaintenanceDialogDataImplCopyWith<$Res> {
  __$$MaintenanceDialogDataImplCopyWithImpl(_$MaintenanceDialogDataImpl _value,
      $Res Function(_$MaintenanceDialogDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startedAt = null,
    Object? endedAt = null,
    Object? title = null,
  }) {
    return _then(_$MaintenanceDialogDataImpl(
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
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaintenanceDialogDataImpl extends _MaintenanceDialogData {
  _$MaintenanceDialogDataImpl(
      {required this.startedAt, required this.endedAt, required this.title})
      : super._();

  factory _$MaintenanceDialogDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaintenanceDialogDataImplFromJson(json);

  @override
  final DateTime startedAt;
  @override
  final DateTime endedAt;
  @override
  final String title;

  @override
  String toString() {
    return 'MaintenanceDialogData(startedAt: $startedAt, endedAt: $endedAt, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenanceDialogDataImpl &&
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
  _$$MaintenanceDialogDataImplCopyWith<_$MaintenanceDialogDataImpl>
      get copyWith => __$$MaintenanceDialogDataImplCopyWithImpl<
          _$MaintenanceDialogDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaintenanceDialogDataImplToJson(
      this,
    );
  }
}

abstract class _MaintenanceDialogData extends MaintenanceDialogData {
  factory _MaintenanceDialogData(
      {required final DateTime startedAt,
      required final DateTime endedAt,
      required final String title}) = _$MaintenanceDialogDataImpl;
  _MaintenanceDialogData._() : super._();

  factory _MaintenanceDialogData.fromJson(Map<String, dynamic> json) =
      _$MaintenanceDialogDataImpl.fromJson;

  @override
  DateTime get startedAt;
  @override
  DateTime get endedAt;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$MaintenanceDialogDataImplCopyWith<_$MaintenanceDialogDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
