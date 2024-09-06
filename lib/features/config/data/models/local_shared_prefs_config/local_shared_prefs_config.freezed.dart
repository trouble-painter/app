// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_shared_prefs_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocalSharedPrefsConfig _$LocalSharedPrefsConfigFromJson(
    Map<String, dynamic> json) {
  return _LocalSharedPrefsConfig.fromJson(json);
}

/// @nodoc
mixin _$LocalSharedPrefsConfig {
  /// Is first run or not
  bool get isFirstRun => throw _privateConstructorUsedError;

  /// App install time
  DateTime get installedAt => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  bool get isLightTheme => throw _privateConstructorUsedError;
  bool get isUiTestMode => throw _privateConstructorUsedError;
  bool get isBgmMute => throw _privateConstructorUsedError;
  bool get receiveQuickStartNoti => throw _privateConstructorUsedError;
  Language? get language => throw _privateConstructorUsedError;
  NoticeDialogHistory? get noticeDialogHistory =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalSharedPrefsConfigCopyWith<LocalSharedPrefsConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalSharedPrefsConfigCopyWith<$Res> {
  factory $LocalSharedPrefsConfigCopyWith(LocalSharedPrefsConfig value,
          $Res Function(LocalSharedPrefsConfig) then) =
      _$LocalSharedPrefsConfigCopyWithImpl<$Res, LocalSharedPrefsConfig>;
  @useResult
  $Res call(
      {bool isFirstRun,
      DateTime installedAt,
      String uuid,
      String nickname,
      bool isLightTheme,
      bool isUiTestMode,
      bool isBgmMute,
      bool receiveQuickStartNoti,
      Language? language,
      NoticeDialogHistory? noticeDialogHistory});

  $NoticeDialogHistoryCopyWith<$Res>? get noticeDialogHistory;
}

/// @nodoc
class _$LocalSharedPrefsConfigCopyWithImpl<$Res,
        $Val extends LocalSharedPrefsConfig>
    implements $LocalSharedPrefsConfigCopyWith<$Res> {
  _$LocalSharedPrefsConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFirstRun = null,
    Object? installedAt = null,
    Object? uuid = null,
    Object? nickname = null,
    Object? isLightTheme = null,
    Object? isUiTestMode = null,
    Object? isBgmMute = null,
    Object? receiveQuickStartNoti = null,
    Object? language = freezed,
    Object? noticeDialogHistory = freezed,
  }) {
    return _then(_value.copyWith(
      isFirstRun: null == isFirstRun
          ? _value.isFirstRun
          : isFirstRun // ignore: cast_nullable_to_non_nullable
              as bool,
      installedAt: null == installedAt
          ? _value.installedAt
          : installedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      isLightTheme: null == isLightTheme
          ? _value.isLightTheme
          : isLightTheme // ignore: cast_nullable_to_non_nullable
              as bool,
      isUiTestMode: null == isUiTestMode
          ? _value.isUiTestMode
          : isUiTestMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isBgmMute: null == isBgmMute
          ? _value.isBgmMute
          : isBgmMute // ignore: cast_nullable_to_non_nullable
              as bool,
      receiveQuickStartNoti: null == receiveQuickStartNoti
          ? _value.receiveQuickStartNoti
          : receiveQuickStartNoti // ignore: cast_nullable_to_non_nullable
              as bool,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language?,
      noticeDialogHistory: freezed == noticeDialogHistory
          ? _value.noticeDialogHistory
          : noticeDialogHistory // ignore: cast_nullable_to_non_nullable
              as NoticeDialogHistory?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NoticeDialogHistoryCopyWith<$Res>? get noticeDialogHistory {
    if (_value.noticeDialogHistory == null) {
      return null;
    }

    return $NoticeDialogHistoryCopyWith<$Res>(_value.noticeDialogHistory!,
        (value) {
      return _then(_value.copyWith(noticeDialogHistory: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocalSharedPrefsConfigImplCopyWith<$Res>
    implements $LocalSharedPrefsConfigCopyWith<$Res> {
  factory _$$LocalSharedPrefsConfigImplCopyWith(
          _$LocalSharedPrefsConfigImpl value,
          $Res Function(_$LocalSharedPrefsConfigImpl) then) =
      __$$LocalSharedPrefsConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFirstRun,
      DateTime installedAt,
      String uuid,
      String nickname,
      bool isLightTheme,
      bool isUiTestMode,
      bool isBgmMute,
      bool receiveQuickStartNoti,
      Language? language,
      NoticeDialogHistory? noticeDialogHistory});

  @override
  $NoticeDialogHistoryCopyWith<$Res>? get noticeDialogHistory;
}

/// @nodoc
class __$$LocalSharedPrefsConfigImplCopyWithImpl<$Res>
    extends _$LocalSharedPrefsConfigCopyWithImpl<$Res,
        _$LocalSharedPrefsConfigImpl>
    implements _$$LocalSharedPrefsConfigImplCopyWith<$Res> {
  __$$LocalSharedPrefsConfigImplCopyWithImpl(
      _$LocalSharedPrefsConfigImpl _value,
      $Res Function(_$LocalSharedPrefsConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFirstRun = null,
    Object? installedAt = null,
    Object? uuid = null,
    Object? nickname = null,
    Object? isLightTheme = null,
    Object? isUiTestMode = null,
    Object? isBgmMute = null,
    Object? receiveQuickStartNoti = null,
    Object? language = freezed,
    Object? noticeDialogHistory = freezed,
  }) {
    return _then(_$LocalSharedPrefsConfigImpl(
      isFirstRun: null == isFirstRun
          ? _value.isFirstRun
          : isFirstRun // ignore: cast_nullable_to_non_nullable
              as bool,
      installedAt: null == installedAt
          ? _value.installedAt
          : installedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      isLightTheme: null == isLightTheme
          ? _value.isLightTheme
          : isLightTheme // ignore: cast_nullable_to_non_nullable
              as bool,
      isUiTestMode: null == isUiTestMode
          ? _value.isUiTestMode
          : isUiTestMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isBgmMute: null == isBgmMute
          ? _value.isBgmMute
          : isBgmMute // ignore: cast_nullable_to_non_nullable
              as bool,
      receiveQuickStartNoti: null == receiveQuickStartNoti
          ? _value.receiveQuickStartNoti
          : receiveQuickStartNoti // ignore: cast_nullable_to_non_nullable
              as bool,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language?,
      noticeDialogHistory: freezed == noticeDialogHistory
          ? _value.noticeDialogHistory
          : noticeDialogHistory // ignore: cast_nullable_to_non_nullable
              as NoticeDialogHistory?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalSharedPrefsConfigImpl implements _LocalSharedPrefsConfig {
  const _$LocalSharedPrefsConfigImpl(
      {required this.isFirstRun,
      required this.installedAt,
      required this.uuid,
      required this.nickname,
      required this.isLightTheme,
      required this.isUiTestMode,
      required this.isBgmMute,
      required this.receiveQuickStartNoti,
      this.language,
      this.noticeDialogHistory});

  factory _$LocalSharedPrefsConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalSharedPrefsConfigImplFromJson(json);

  /// Is first run or not
  @override
  final bool isFirstRun;

  /// App install time
  @override
  final DateTime installedAt;
  @override
  final String uuid;
  @override
  final String nickname;
  @override
  final bool isLightTheme;
  @override
  final bool isUiTestMode;
  @override
  final bool isBgmMute;
  @override
  final bool receiveQuickStartNoti;
  @override
  final Language? language;
  @override
  final NoticeDialogHistory? noticeDialogHistory;

  @override
  String toString() {
    return 'LocalSharedPrefsConfig(isFirstRun: $isFirstRun, installedAt: $installedAt, uuid: $uuid, nickname: $nickname, isLightTheme: $isLightTheme, isUiTestMode: $isUiTestMode, isBgmMute: $isBgmMute, receiveQuickStartNoti: $receiveQuickStartNoti, language: $language, noticeDialogHistory: $noticeDialogHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalSharedPrefsConfigImpl &&
            (identical(other.isFirstRun, isFirstRun) ||
                other.isFirstRun == isFirstRun) &&
            (identical(other.installedAt, installedAt) ||
                other.installedAt == installedAt) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.isLightTheme, isLightTheme) ||
                other.isLightTheme == isLightTheme) &&
            (identical(other.isUiTestMode, isUiTestMode) ||
                other.isUiTestMode == isUiTestMode) &&
            (identical(other.isBgmMute, isBgmMute) ||
                other.isBgmMute == isBgmMute) &&
            (identical(other.receiveQuickStartNoti, receiveQuickStartNoti) ||
                other.receiveQuickStartNoti == receiveQuickStartNoti) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.noticeDialogHistory, noticeDialogHistory) ||
                other.noticeDialogHistory == noticeDialogHistory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFirstRun,
      installedAt,
      uuid,
      nickname,
      isLightTheme,
      isUiTestMode,
      isBgmMute,
      receiveQuickStartNoti,
      language,
      noticeDialogHistory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalSharedPrefsConfigImplCopyWith<_$LocalSharedPrefsConfigImpl>
      get copyWith => __$$LocalSharedPrefsConfigImplCopyWithImpl<
          _$LocalSharedPrefsConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalSharedPrefsConfigImplToJson(
      this,
    );
  }
}

abstract class _LocalSharedPrefsConfig implements LocalSharedPrefsConfig {
  const factory _LocalSharedPrefsConfig(
          {required final bool isFirstRun,
          required final DateTime installedAt,
          required final String uuid,
          required final String nickname,
          required final bool isLightTheme,
          required final bool isUiTestMode,
          required final bool isBgmMute,
          required final bool receiveQuickStartNoti,
          final Language? language,
          final NoticeDialogHistory? noticeDialogHistory}) =
      _$LocalSharedPrefsConfigImpl;

  factory _LocalSharedPrefsConfig.fromJson(Map<String, dynamic> json) =
      _$LocalSharedPrefsConfigImpl.fromJson;

  @override

  /// Is first run or not
  bool get isFirstRun;
  @override

  /// App install time
  DateTime get installedAt;
  @override
  String get uuid;
  @override
  String get nickname;
  @override
  bool get isLightTheme;
  @override
  bool get isUiTestMode;
  @override
  bool get isBgmMute;
  @override
  bool get receiveQuickStartNoti;
  @override
  Language? get language;
  @override
  NoticeDialogHistory? get noticeDialogHistory;
  @override
  @JsonKey(ignore: true)
  _$$LocalSharedPrefsConfigImplCopyWith<_$LocalSharedPrefsConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}
