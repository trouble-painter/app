// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationSetting _$NotificationSettingFromJson(Map<String, dynamic> json) {
  return _NotificationSetting.fromJson(json);
}

/// @nodoc
mixin _$NotificationSetting {
  /// Whether to disable the quick startup notification function
  bool get disableQuickStartNoti => throw _privateConstructorUsedError;

  /// Whether to receive quick start notifications
  bool get receiveQuickStartNoti => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationSettingCopyWith<NotificationSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingCopyWith<$Res> {
  factory $NotificationSettingCopyWith(
          NotificationSetting value, $Res Function(NotificationSetting) then) =
      _$NotificationSettingCopyWithImpl<$Res, NotificationSetting>;
  @useResult
  $Res call({bool disableQuickStartNoti, bool receiveQuickStartNoti});
}

/// @nodoc
class _$NotificationSettingCopyWithImpl<$Res, $Val extends NotificationSetting>
    implements $NotificationSettingCopyWith<$Res> {
  _$NotificationSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disableQuickStartNoti = null,
    Object? receiveQuickStartNoti = null,
  }) {
    return _then(_value.copyWith(
      disableQuickStartNoti: null == disableQuickStartNoti
          ? _value.disableQuickStartNoti
          : disableQuickStartNoti // ignore: cast_nullable_to_non_nullable
              as bool,
      receiveQuickStartNoti: null == receiveQuickStartNoti
          ? _value.receiveQuickStartNoti
          : receiveQuickStartNoti // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationSettingImplCopyWith<$Res>
    implements $NotificationSettingCopyWith<$Res> {
  factory _$$NotificationSettingImplCopyWith(_$NotificationSettingImpl value,
          $Res Function(_$NotificationSettingImpl) then) =
      __$$NotificationSettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool disableQuickStartNoti, bool receiveQuickStartNoti});
}

/// @nodoc
class __$$NotificationSettingImplCopyWithImpl<$Res>
    extends _$NotificationSettingCopyWithImpl<$Res, _$NotificationSettingImpl>
    implements _$$NotificationSettingImplCopyWith<$Res> {
  __$$NotificationSettingImplCopyWithImpl(_$NotificationSettingImpl _value,
      $Res Function(_$NotificationSettingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disableQuickStartNoti = null,
    Object? receiveQuickStartNoti = null,
  }) {
    return _then(_$NotificationSettingImpl(
      disableQuickStartNoti: null == disableQuickStartNoti
          ? _value.disableQuickStartNoti
          : disableQuickStartNoti // ignore: cast_nullable_to_non_nullable
              as bool,
      receiveQuickStartNoti: null == receiveQuickStartNoti
          ? _value.receiveQuickStartNoti
          : receiveQuickStartNoti // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSettingImpl extends _NotificationSetting {
  _$NotificationSettingImpl(
      {required this.disableQuickStartNoti,
      required this.receiveQuickStartNoti})
      : super._();

  factory _$NotificationSettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSettingImplFromJson(json);

  /// Whether to disable the quick startup notification function
  @override
  final bool disableQuickStartNoti;

  /// Whether to receive quick start notifications
  @override
  final bool receiveQuickStartNoti;

  @override
  String toString() {
    return 'NotificationSetting(disableQuickStartNoti: $disableQuickStartNoti, receiveQuickStartNoti: $receiveQuickStartNoti)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSettingImpl &&
            (identical(other.disableQuickStartNoti, disableQuickStartNoti) ||
                other.disableQuickStartNoti == disableQuickStartNoti) &&
            (identical(other.receiveQuickStartNoti, receiveQuickStartNoti) ||
                other.receiveQuickStartNoti == receiveQuickStartNoti));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, disableQuickStartNoti, receiveQuickStartNoti);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSettingImplCopyWith<_$NotificationSettingImpl> get copyWith =>
      __$$NotificationSettingImplCopyWithImpl<_$NotificationSettingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationSettingImplToJson(
      this,
    );
  }
}

abstract class _NotificationSetting extends NotificationSetting {
  factory _NotificationSetting(
      {required final bool disableQuickStartNoti,
      required final bool receiveQuickStartNoti}) = _$NotificationSettingImpl;
  _NotificationSetting._() : super._();

  factory _NotificationSetting.fromJson(Map<String, dynamic> json) =
      _$NotificationSettingImpl.fromJson;

  @override

  /// Whether to disable the quick startup notification function
  bool get disableQuickStartNoti;
  @override

  /// Whether to receive quick start notifications
  bool get receiveQuickStartNoti;
  @override
  @JsonKey(ignore: true)
  _$$NotificationSettingImplCopyWith<_$NotificationSettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
