// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_shared_prefs_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalSharedPrefsConfig {
  /// Is first run or not
  bool get isFirstRun;

  /// App install time
  DateTime get installedAt;
  String get uuid;
  String get nickname;
  bool get isLightTheme;
  bool get isUiTestMode;
  bool get isUiTestModeMark;
  bool get isBgmMute;
  bool get receiveQuickStartNoti;
  bool get isQuickStartFirstRun;
  Language? get language;
  NoticeDialogHistory? get noticeDialogHistory;

  /// Last in-app review request time; null if never requested
  DateTime? get lastInAppReviewRequestedAt;

  /// Create a copy of LocalSharedPrefsConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocalSharedPrefsConfigCopyWith<LocalSharedPrefsConfig> get copyWith =>
      _$LocalSharedPrefsConfigCopyWithImpl<LocalSharedPrefsConfig>(
          this as LocalSharedPrefsConfig, _$identity);

  /// Serializes this LocalSharedPrefsConfig to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as LocalSharedPrefsConfig;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocalSharedPrefsConfig &&
            (identical(other.isFirstRun, _this.isFirstRun) ||
                other.isFirstRun == _this.isFirstRun) &&
            (identical(other.installedAt, _this.installedAt) ||
                other.installedAt == _this.installedAt) &&
            (identical(other.uuid, _this.uuid) || other.uuid == _this.uuid) &&
            (identical(other.nickname, _this.nickname) ||
                other.nickname == _this.nickname) &&
            (identical(other.isLightTheme, _this.isLightTheme) ||
                other.isLightTheme == _this.isLightTheme) &&
            (identical(other.isUiTestMode, _this.isUiTestMode) ||
                other.isUiTestMode == _this.isUiTestMode) &&
            (identical(other.isUiTestModeMark, _this.isUiTestModeMark) ||
                other.isUiTestModeMark == _this.isUiTestModeMark) &&
            (identical(other.isBgmMute, _this.isBgmMute) ||
                other.isBgmMute == _this.isBgmMute) &&
            (identical(
                    other.receiveQuickStartNoti, _this.receiveQuickStartNoti) ||
                other.receiveQuickStartNoti == _this.receiveQuickStartNoti) &&
            (identical(
                    other.isQuickStartFirstRun, _this.isQuickStartFirstRun) ||
                other.isQuickStartFirstRun == _this.isQuickStartFirstRun) &&
            (identical(other.language, _this.language) ||
                other.language == _this.language) &&
            (identical(other.noticeDialogHistory, _this.noticeDialogHistory) ||
                other.noticeDialogHistory == _this.noticeDialogHistory) &&
            (identical(other.lastInAppReviewRequestedAt,
                    _this.lastInAppReviewRequestedAt) ||
                other.lastInAppReviewRequestedAt ==
                    _this.lastInAppReviewRequestedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as LocalSharedPrefsConfig;
    return Object.hash(
        runtimeType,
        _this.isFirstRun,
        _this.installedAt,
        _this.uuid,
        _this.nickname,
        _this.isLightTheme,
        _this.isUiTestMode,
        _this.isUiTestModeMark,
        _this.isBgmMute,
        _this.receiveQuickStartNoti,
        _this.isQuickStartFirstRun,
        _this.language,
        _this.noticeDialogHistory,
        _this.lastInAppReviewRequestedAt);
  }

  @override
  String toString() {
    final _this = this as LocalSharedPrefsConfig;
    return 'LocalSharedPrefsConfig(isFirstRun: ${_this.isFirstRun}, installedAt: ${_this.installedAt}, uuid: ${_this.uuid}, nickname: ${_this.nickname}, isLightTheme: ${_this.isLightTheme}, isUiTestMode: ${_this.isUiTestMode}, isUiTestModeMark: ${_this.isUiTestModeMark}, isBgmMute: ${_this.isBgmMute}, receiveQuickStartNoti: ${_this.receiveQuickStartNoti}, isQuickStartFirstRun: ${_this.isQuickStartFirstRun}, language: ${_this.language}, noticeDialogHistory: ${_this.noticeDialogHistory}, lastInAppReviewRequestedAt: ${_this.lastInAppReviewRequestedAt})';
  }
}

/// @nodoc
abstract mixin class $LocalSharedPrefsConfigCopyWith<$Res> {
  factory $LocalSharedPrefsConfigCopyWith(LocalSharedPrefsConfig value,
          $Res Function(LocalSharedPrefsConfig) _then) =
      _$LocalSharedPrefsConfigCopyWithImpl;
  @useResult
  $Res call(
      {bool isFirstRun,
      DateTime installedAt,
      String uuid,
      String nickname,
      bool isLightTheme,
      bool isUiTestMode,
      bool isUiTestModeMark,
      bool isBgmMute,
      bool receiveQuickStartNoti,
      bool isQuickStartFirstRun,
      Language? language,
      NoticeDialogHistory? noticeDialogHistory,
      DateTime? lastInAppReviewRequestedAt});

  $NoticeDialogHistoryCopyWith<$Res>? get noticeDialogHistory;
}

/// @nodoc
class _$LocalSharedPrefsConfigCopyWithImpl<$Res>
    implements $LocalSharedPrefsConfigCopyWith<$Res> {
  _$LocalSharedPrefsConfigCopyWithImpl(this._self, this._then);

  final LocalSharedPrefsConfig _self;
  final $Res Function(LocalSharedPrefsConfig) _then;

  /// Create a copy of LocalSharedPrefsConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFirstRun = null,
    Object? installedAt = null,
    Object? uuid = null,
    Object? nickname = null,
    Object? isLightTheme = null,
    Object? isUiTestMode = null,
    Object? isUiTestModeMark = null,
    Object? isBgmMute = null,
    Object? receiveQuickStartNoti = null,
    Object? isQuickStartFirstRun = null,
    Object? language = freezed,
    Object? noticeDialogHistory = freezed,
    Object? lastInAppReviewRequestedAt = freezed,
  }) {
    return _then(LocalSharedPrefsConfig(
      isFirstRun: null == isFirstRun
          ? _self.isFirstRun
          : isFirstRun // ignore: cast_nullable_to_non_nullable
              as bool,
      installedAt: null == installedAt
          ? _self.installedAt
          : installedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      isLightTheme: null == isLightTheme
          ? _self.isLightTheme
          : isLightTheme // ignore: cast_nullable_to_non_nullable
              as bool,
      isUiTestMode: null == isUiTestMode
          ? _self.isUiTestMode
          : isUiTestMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isUiTestModeMark: null == isUiTestModeMark
          ? _self.isUiTestModeMark
          : isUiTestModeMark // ignore: cast_nullable_to_non_nullable
              as bool,
      isBgmMute: null == isBgmMute
          ? _self.isBgmMute
          : isBgmMute // ignore: cast_nullable_to_non_nullable
              as bool,
      receiveQuickStartNoti: null == receiveQuickStartNoti
          ? _self.receiveQuickStartNoti
          : receiveQuickStartNoti // ignore: cast_nullable_to_non_nullable
              as bool,
      isQuickStartFirstRun: null == isQuickStartFirstRun
          ? _self.isQuickStartFirstRun
          : isQuickStartFirstRun // ignore: cast_nullable_to_non_nullable
              as bool,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language?,
      noticeDialogHistory: freezed == noticeDialogHistory
          ? _self.noticeDialogHistory
          : noticeDialogHistory // ignore: cast_nullable_to_non_nullable
              as NoticeDialogHistory?,
      lastInAppReviewRequestedAt: freezed == lastInAppReviewRequestedAt
          ? _self.lastInAppReviewRequestedAt
          : lastInAppReviewRequestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of LocalSharedPrefsConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NoticeDialogHistoryCopyWith<$Res>? get noticeDialogHistory {
    if (_self.noticeDialogHistory == null) {
      return null;
    }

    return $NoticeDialogHistoryCopyWith<$Res>(_self.noticeDialogHistory!,
        (value) {
      return _then(_self.copyWith(noticeDialogHistory: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LocalSharedPrefsConfig].
extension LocalSharedPrefsConfigPatterns on LocalSharedPrefsConfig {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LocalSharedPrefsConfig value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocalSharedPrefsConfig() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LocalSharedPrefsConfig value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalSharedPrefsConfig():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LocalSharedPrefsConfig value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalSharedPrefsConfig() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            bool isFirstRun,
            DateTime installedAt,
            String uuid,
            String nickname,
            bool isLightTheme,
            bool isUiTestMode,
            bool isUiTestModeMark,
            bool isBgmMute,
            bool receiveQuickStartNoti,
            bool isQuickStartFirstRun,
            Language? language,
            NoticeDialogHistory? noticeDialogHistory,
            DateTime? lastInAppReviewRequestedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocalSharedPrefsConfig() when $default != null:
        return $default(
            _that.isFirstRun,
            _that.installedAt,
            _that.uuid,
            _that.nickname,
            _that.isLightTheme,
            _that.isUiTestMode,
            _that.isUiTestModeMark,
            _that.isBgmMute,
            _that.receiveQuickStartNoti,
            _that.isQuickStartFirstRun,
            _that.language,
            _that.noticeDialogHistory,
            _that.lastInAppReviewRequestedAt);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            bool isFirstRun,
            DateTime installedAt,
            String uuid,
            String nickname,
            bool isLightTheme,
            bool isUiTestMode,
            bool isUiTestModeMark,
            bool isBgmMute,
            bool receiveQuickStartNoti,
            bool isQuickStartFirstRun,
            Language? language,
            NoticeDialogHistory? noticeDialogHistory,
            DateTime? lastInAppReviewRequestedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalSharedPrefsConfig():
        return $default(
            _that.isFirstRun,
            _that.installedAt,
            _that.uuid,
            _that.nickname,
            _that.isLightTheme,
            _that.isUiTestMode,
            _that.isUiTestModeMark,
            _that.isBgmMute,
            _that.receiveQuickStartNoti,
            _that.isQuickStartFirstRun,
            _that.language,
            _that.noticeDialogHistory,
            _that.lastInAppReviewRequestedAt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            bool isFirstRun,
            DateTime installedAt,
            String uuid,
            String nickname,
            bool isLightTheme,
            bool isUiTestMode,
            bool isUiTestModeMark,
            bool isBgmMute,
            bool receiveQuickStartNoti,
            bool isQuickStartFirstRun,
            Language? language,
            NoticeDialogHistory? noticeDialogHistory,
            DateTime? lastInAppReviewRequestedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalSharedPrefsConfig() when $default != null:
        return $default(
            _that.isFirstRun,
            _that.installedAt,
            _that.uuid,
            _that.nickname,
            _that.isLightTheme,
            _that.isUiTestMode,
            _that.isUiTestModeMark,
            _that.isBgmMute,
            _that.receiveQuickStartNoti,
            _that.isQuickStartFirstRun,
            _that.language,
            _that.noticeDialogHistory,
            _that.lastInAppReviewRequestedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LocalSharedPrefsConfig implements LocalSharedPrefsConfig {
  const _LocalSharedPrefsConfig(
      {required this.isFirstRun,
      required this.installedAt,
      required this.uuid,
      required this.nickname,
      required this.isLightTheme,
      required this.isUiTestMode,
      required this.isUiTestModeMark,
      required this.isBgmMute,
      required this.receiveQuickStartNoti,
      required this.isQuickStartFirstRun,
      this.language,
      this.noticeDialogHistory,
      this.lastInAppReviewRequestedAt});
  factory _LocalSharedPrefsConfig.fromJson(Map<String, dynamic> json) =>
      _$LocalSharedPrefsConfigFromJson(json);

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
  final bool isUiTestModeMark;
  @override
  final bool isBgmMute;
  @override
  final bool receiveQuickStartNoti;
  @override
  final bool isQuickStartFirstRun;
  @override
  final Language? language;
  @override
  final NoticeDialogHistory? noticeDialogHistory;

  /// Last in-app review request time; null if never requested
  @override
  final DateTime? lastInAppReviewRequestedAt;

  /// Create a copy of LocalSharedPrefsConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocalSharedPrefsConfigCopyWith<_LocalSharedPrefsConfig> get copyWith =>
      __$LocalSharedPrefsConfigCopyWithImpl<_LocalSharedPrefsConfig>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocalSharedPrefsConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocalSharedPrefsConfig &&
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
            (identical(other.isUiTestModeMark, isUiTestModeMark) ||
                other.isUiTestModeMark == isUiTestModeMark) &&
            (identical(other.isBgmMute, isBgmMute) ||
                other.isBgmMute == isBgmMute) &&
            (identical(other.receiveQuickStartNoti, receiveQuickStartNoti) ||
                other.receiveQuickStartNoti == receiveQuickStartNoti) &&
            (identical(other.isQuickStartFirstRun, isQuickStartFirstRun) ||
                other.isQuickStartFirstRun == isQuickStartFirstRun) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.noticeDialogHistory, noticeDialogHistory) ||
                other.noticeDialogHistory == noticeDialogHistory) &&
            (identical(other.lastInAppReviewRequestedAt,
                    lastInAppReviewRequestedAt) ||
                other.lastInAppReviewRequestedAt ==
                    lastInAppReviewRequestedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        isFirstRun,
        installedAt,
        uuid,
        nickname,
        isLightTheme,
        isUiTestMode,
        isUiTestModeMark,
        isBgmMute,
        receiveQuickStartNoti,
        isQuickStartFirstRun,
        language,
        noticeDialogHistory,
        lastInAppReviewRequestedAt);
  }

  @override
  String toString() {
    return 'LocalSharedPrefsConfig(isFirstRun: $isFirstRun, installedAt: $installedAt, uuid: $uuid, nickname: $nickname, isLightTheme: $isLightTheme, isUiTestMode: $isUiTestMode, isUiTestModeMark: $isUiTestModeMark, isBgmMute: $isBgmMute, receiveQuickStartNoti: $receiveQuickStartNoti, isQuickStartFirstRun: $isQuickStartFirstRun, language: $language, noticeDialogHistory: $noticeDialogHistory, lastInAppReviewRequestedAt: $lastInAppReviewRequestedAt)';
  }
}

/// @nodoc
abstract mixin class _$LocalSharedPrefsConfigCopyWith<$Res>
    implements $LocalSharedPrefsConfigCopyWith<$Res> {
  factory _$LocalSharedPrefsConfigCopyWith(_LocalSharedPrefsConfig value,
          $Res Function(_LocalSharedPrefsConfig) _then) =
      __$LocalSharedPrefsConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isFirstRun,
      DateTime installedAt,
      String uuid,
      String nickname,
      bool isLightTheme,
      bool isUiTestMode,
      bool isUiTestModeMark,
      bool isBgmMute,
      bool receiveQuickStartNoti,
      bool isQuickStartFirstRun,
      Language? language,
      NoticeDialogHistory? noticeDialogHistory,
      DateTime? lastInAppReviewRequestedAt});

  @override
  $NoticeDialogHistoryCopyWith<$Res>? get noticeDialogHistory;
}

/// @nodoc
class __$LocalSharedPrefsConfigCopyWithImpl<$Res>
    implements _$LocalSharedPrefsConfigCopyWith<$Res> {
  __$LocalSharedPrefsConfigCopyWithImpl(this._self, this._then);

  final _LocalSharedPrefsConfig _self;
  final $Res Function(_LocalSharedPrefsConfig) _then;

  /// Create a copy of LocalSharedPrefsConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isFirstRun = null,
    Object? installedAt = null,
    Object? uuid = null,
    Object? nickname = null,
    Object? isLightTheme = null,
    Object? isUiTestMode = null,
    Object? isUiTestModeMark = null,
    Object? isBgmMute = null,
    Object? receiveQuickStartNoti = null,
    Object? isQuickStartFirstRun = null,
    Object? language = freezed,
    Object? noticeDialogHistory = freezed,
    Object? lastInAppReviewRequestedAt = freezed,
  }) {
    return _then(_LocalSharedPrefsConfig(
      isFirstRun: null == isFirstRun
          ? _self.isFirstRun
          : isFirstRun // ignore: cast_nullable_to_non_nullable
              as bool,
      installedAt: null == installedAt
          ? _self.installedAt
          : installedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      isLightTheme: null == isLightTheme
          ? _self.isLightTheme
          : isLightTheme // ignore: cast_nullable_to_non_nullable
              as bool,
      isUiTestMode: null == isUiTestMode
          ? _self.isUiTestMode
          : isUiTestMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isUiTestModeMark: null == isUiTestModeMark
          ? _self.isUiTestModeMark
          : isUiTestModeMark // ignore: cast_nullable_to_non_nullable
              as bool,
      isBgmMute: null == isBgmMute
          ? _self.isBgmMute
          : isBgmMute // ignore: cast_nullable_to_non_nullable
              as bool,
      receiveQuickStartNoti: null == receiveQuickStartNoti
          ? _self.receiveQuickStartNoti
          : receiveQuickStartNoti // ignore: cast_nullable_to_non_nullable
              as bool,
      isQuickStartFirstRun: null == isQuickStartFirstRun
          ? _self.isQuickStartFirstRun
          : isQuickStartFirstRun // ignore: cast_nullable_to_non_nullable
              as bool,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language?,
      noticeDialogHistory: freezed == noticeDialogHistory
          ? _self.noticeDialogHistory
          : noticeDialogHistory // ignore: cast_nullable_to_non_nullable
              as NoticeDialogHistory?,
      lastInAppReviewRequestedAt: freezed == lastInAppReviewRequestedAt
          ? _self.lastInAppReviewRequestedAt
          : lastInAppReviewRequestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of LocalSharedPrefsConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NoticeDialogHistoryCopyWith<$Res>? get noticeDialogHistory {
    if (_self.noticeDialogHistory == null) {
      return null;
    }

    return $NoticeDialogHistoryCopyWith<$Res>(_self.noticeDialogHistory!,
        (value) {
      return _then(_self.copyWith(noticeDialogHistory: value));
    });
  }
}

// dart format on
