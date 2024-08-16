// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_dialog_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NoticeDialogHistory _$NoticeDialogHistoryFromJson(Map<String, dynamic> json) {
  return _NoticeDialogHistory.fromJson(json);
}

/// @nodoc
mixin _$NoticeDialogHistory {
  int get version => throw _privateConstructorUsedError;
  DateTime get exposedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoticeDialogHistoryCopyWith<NoticeDialogHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeDialogHistoryCopyWith<$Res> {
  factory $NoticeDialogHistoryCopyWith(
          NoticeDialogHistory value, $Res Function(NoticeDialogHistory) then) =
      _$NoticeDialogHistoryCopyWithImpl<$Res, NoticeDialogHistory>;
  @useResult
  $Res call({int version, DateTime exposedAt});
}

/// @nodoc
class _$NoticeDialogHistoryCopyWithImpl<$Res, $Val extends NoticeDialogHistory>
    implements $NoticeDialogHistoryCopyWith<$Res> {
  _$NoticeDialogHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? exposedAt = null,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      exposedAt: null == exposedAt
          ? _value.exposedAt
          : exposedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoticeDialogHistoryImplCopyWith<$Res>
    implements $NoticeDialogHistoryCopyWith<$Res> {
  factory _$$NoticeDialogHistoryImplCopyWith(_$NoticeDialogHistoryImpl value,
          $Res Function(_$NoticeDialogHistoryImpl) then) =
      __$$NoticeDialogHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int version, DateTime exposedAt});
}

/// @nodoc
class __$$NoticeDialogHistoryImplCopyWithImpl<$Res>
    extends _$NoticeDialogHistoryCopyWithImpl<$Res, _$NoticeDialogHistoryImpl>
    implements _$$NoticeDialogHistoryImplCopyWith<$Res> {
  __$$NoticeDialogHistoryImplCopyWithImpl(_$NoticeDialogHistoryImpl _value,
      $Res Function(_$NoticeDialogHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? exposedAt = null,
  }) {
    return _then(_$NoticeDialogHistoryImpl(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      exposedAt: null == exposedAt
          ? _value.exposedAt
          : exposedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoticeDialogHistoryImpl extends _NoticeDialogHistory {
  _$NoticeDialogHistoryImpl({required this.version, required this.exposedAt})
      : super._();

  factory _$NoticeDialogHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeDialogHistoryImplFromJson(json);

  @override
  final int version;
  @override
  final DateTime exposedAt;

  @override
  String toString() {
    return 'NoticeDialogHistory(version: $version, exposedAt: $exposedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeDialogHistoryImpl &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.exposedAt, exposedAt) ||
                other.exposedAt == exposedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, version, exposedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeDialogHistoryImplCopyWith<_$NoticeDialogHistoryImpl> get copyWith =>
      __$$NoticeDialogHistoryImplCopyWithImpl<_$NoticeDialogHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeDialogHistoryImplToJson(
      this,
    );
  }
}

abstract class _NoticeDialogHistory extends NoticeDialogHistory {
  factory _NoticeDialogHistory(
      {required final int version,
      required final DateTime exposedAt}) = _$NoticeDialogHistoryImpl;
  _NoticeDialogHistory._() : super._();

  factory _NoticeDialogHistory.fromJson(Map<String, dynamic> json) =
      _$NoticeDialogHistoryImpl.fromJson;

  @override
  int get version;
  @override
  DateTime get exposedAt;
  @override
  @JsonKey(ignore: true)
  _$$NoticeDialogHistoryImplCopyWith<_$NoticeDialogHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
