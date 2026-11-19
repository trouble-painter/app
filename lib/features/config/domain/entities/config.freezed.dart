// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Config implements DiagnosticableTreeMixin {
  String get uuid;
  String get nickname;
  String get bgmUrl;
  String get gameBgmUrl;
  String get contactUsEmail;
  Uri get bgmLicenseUrl;
  Uri get baseUrl;
  Uri get baseSocketUrl;
  Uri get inviteUrl;
  Uri get noticeUrl;
  Uri get suggestKeywordsUrl;
  List<String> get devUuidList;
  bool get isUiTestMode;
  bool get isUiTestModeMark;
  bool get isFirstRun;

  /// Whether it's the first attemp for quick start
  bool get isQuickStartFirstRun;
  bool get isLightTheme;
  bool get isBgmDisabled;
  bool get isBgmMute;
  bool get isGameBgmDisabled;
  bool get isReactionDisabled;
  Language get language;
  AppId get appId;
  AppInfo get appInfo;
  Uri get termsOfServiceUrl;
  Uri get privacyPolicyUrl;
  int get minBuildNumber;
  double get drawOptimizeEpsilion;
  UpdateDialogData get updateDialogData;
  Admob get admob;
  NotificationSetting get notificationSetting;
  NoticeDialogData? get noticeDialogData;
  NoticeDialogHistory? get noticeDialogHistory;
  MaintenanceDialogData? get maintenanceDialogData;
  @TimeSerializer()
  DateTime get installedAt;

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConfigCopyWith<Config> get copyWith =>
      _$ConfigCopyWithImpl<Config>(this as Config, _$identity);

  /// Serializes this Config to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    final _this = this as Config;
    properties
      ..add(DiagnosticsProperty('type', 'Config'))
      ..add(DiagnosticsProperty('uuid', _this.uuid))
      ..add(DiagnosticsProperty('nickname', _this.nickname))
      ..add(DiagnosticsProperty('bgmUrl', _this.bgmUrl))
      ..add(DiagnosticsProperty('gameBgmUrl', _this.gameBgmUrl))
      ..add(DiagnosticsProperty('contactUsEmail', _this.contactUsEmail))
      ..add(DiagnosticsProperty('bgmLicenseUrl', _this.bgmLicenseUrl))
      ..add(DiagnosticsProperty('baseUrl', _this.baseUrl))
      ..add(DiagnosticsProperty('baseSocketUrl', _this.baseSocketUrl))
      ..add(DiagnosticsProperty('inviteUrl', _this.inviteUrl))
      ..add(DiagnosticsProperty('noticeUrl', _this.noticeUrl))
      ..add(DiagnosticsProperty('suggestKeywordsUrl', _this.suggestKeywordsUrl))
      ..add(DiagnosticsProperty('devUuidList', _this.devUuidList))
      ..add(DiagnosticsProperty('isUiTestMode', _this.isUiTestMode))
      ..add(DiagnosticsProperty('isUiTestModeMark', _this.isUiTestModeMark))
      ..add(DiagnosticsProperty('isFirstRun', _this.isFirstRun))
      ..add(DiagnosticsProperty(
          'isQuickStartFirstRun', _this.isQuickStartFirstRun))
      ..add(DiagnosticsProperty('isLightTheme', _this.isLightTheme))
      ..add(DiagnosticsProperty('isBgmDisabled', _this.isBgmDisabled))
      ..add(DiagnosticsProperty('isBgmMute', _this.isBgmMute))
      ..add(DiagnosticsProperty('isGameBgmDisabled', _this.isGameBgmDisabled))
      ..add(DiagnosticsProperty('isReactionDisabled', _this.isReactionDisabled))
      ..add(DiagnosticsProperty('language', _this.language))
      ..add(DiagnosticsProperty('appId', _this.appId))
      ..add(DiagnosticsProperty('appInfo', _this.appInfo))
      ..add(DiagnosticsProperty('termsOfServiceUrl', _this.termsOfServiceUrl))
      ..add(DiagnosticsProperty('privacyPolicyUrl', _this.privacyPolicyUrl))
      ..add(DiagnosticsProperty('minBuildNumber', _this.minBuildNumber))
      ..add(DiagnosticsProperty(
          'drawOptimizeEpsilion', _this.drawOptimizeEpsilion))
      ..add(DiagnosticsProperty('updateDialogData', _this.updateDialogData))
      ..add(DiagnosticsProperty('admob', _this.admob))
      ..add(
          DiagnosticsProperty('notificationSetting', _this.notificationSetting))
      ..add(DiagnosticsProperty('noticeDialogData', _this.noticeDialogData))
      ..add(
          DiagnosticsProperty('noticeDialogHistory', _this.noticeDialogHistory))
      ..add(DiagnosticsProperty(
          'maintenanceDialogData', _this.maintenanceDialogData))
      ..add(DiagnosticsProperty('installedAt', _this.installedAt));
  }

  @override
  bool operator ==(Object other) {
    final _this = this as Config;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Config &&
            (identical(other.uuid, _this.uuid) || other.uuid == _this.uuid) &&
            (identical(other.nickname, _this.nickname) ||
                other.nickname == _this.nickname) &&
            (identical(other.bgmUrl, _this.bgmUrl) ||
                other.bgmUrl == _this.bgmUrl) &&
            (identical(other.gameBgmUrl, _this.gameBgmUrl) ||
                other.gameBgmUrl == _this.gameBgmUrl) &&
            (identical(other.contactUsEmail, _this.contactUsEmail) ||
                other.contactUsEmail == _this.contactUsEmail) &&
            (identical(other.bgmLicenseUrl, _this.bgmLicenseUrl) ||
                other.bgmLicenseUrl == _this.bgmLicenseUrl) &&
            (identical(other.baseUrl, _this.baseUrl) ||
                other.baseUrl == _this.baseUrl) &&
            (identical(other.baseSocketUrl, _this.baseSocketUrl) ||
                other.baseSocketUrl == _this.baseSocketUrl) &&
            (identical(other.inviteUrl, _this.inviteUrl) ||
                other.inviteUrl == _this.inviteUrl) &&
            (identical(other.noticeUrl, _this.noticeUrl) ||
                other.noticeUrl == _this.noticeUrl) &&
            (identical(other.suggestKeywordsUrl, _this.suggestKeywordsUrl) ||
                other.suggestKeywordsUrl == _this.suggestKeywordsUrl) &&
            const DeepCollectionEquality()
                .equals(other.devUuidList, _this.devUuidList) &&
            (identical(other.isUiTestMode, _this.isUiTestMode) ||
                other.isUiTestMode == _this.isUiTestMode) &&
            (identical(other.isUiTestModeMark, _this.isUiTestModeMark) ||
                other.isUiTestModeMark == _this.isUiTestModeMark) &&
            (identical(other.isFirstRun, _this.isFirstRun) ||
                other.isFirstRun == _this.isFirstRun) &&
            (identical(other.isQuickStartFirstRun, _this.isQuickStartFirstRun) ||
                other.isQuickStartFirstRun == _this.isQuickStartFirstRun) &&
            (identical(other.isLightTheme, _this.isLightTheme) ||
                other.isLightTheme == _this.isLightTheme) &&
            (identical(other.isBgmDisabled, _this.isBgmDisabled) ||
                other.isBgmDisabled == _this.isBgmDisabled) &&
            (identical(other.isBgmMute, _this.isBgmMute) ||
                other.isBgmMute == _this.isBgmMute) &&
            (identical(other.isGameBgmDisabled, _this.isGameBgmDisabled) ||
                other.isGameBgmDisabled == _this.isGameBgmDisabled) &&
            (identical(other.isReactionDisabled, _this.isReactionDisabled) ||
                other.isReactionDisabled == _this.isReactionDisabled) &&
            (identical(other.language, _this.language) ||
                other.language == _this.language) &&
            (identical(other.appId, _this.appId) ||
                other.appId == _this.appId) &&
            (identical(other.appInfo, _this.appInfo) ||
                other.appInfo == _this.appInfo) &&
            (identical(other.termsOfServiceUrl, _this.termsOfServiceUrl) ||
                other.termsOfServiceUrl == _this.termsOfServiceUrl) &&
            (identical(other.privacyPolicyUrl, _this.privacyPolicyUrl) ||
                other.privacyPolicyUrl == _this.privacyPolicyUrl) &&
            (identical(other.minBuildNumber, _this.minBuildNumber) ||
                other.minBuildNumber == _this.minBuildNumber) &&
            (identical(other.drawOptimizeEpsilion, _this.drawOptimizeEpsilion) ||
                other.drawOptimizeEpsilion == _this.drawOptimizeEpsilion) &&
            (identical(other.updateDialogData, _this.updateDialogData) ||
                other.updateDialogData == _this.updateDialogData) &&
            (identical(other.admob, _this.admob) ||
                other.admob == _this.admob) &&
            (identical(other.notificationSetting, _this.notificationSetting) ||
                other.notificationSetting == _this.notificationSetting) &&
            (identical(other.noticeDialogData, _this.noticeDialogData) ||
                other.noticeDialogData == _this.noticeDialogData) &&
            (identical(other.noticeDialogHistory, _this.noticeDialogHistory) ||
                other.noticeDialogHistory == _this.noticeDialogHistory) &&
            (identical(
                    other.maintenanceDialogData, _this.maintenanceDialogData) ||
                other.maintenanceDialogData == _this.maintenanceDialogData) &&
            (identical(other.installedAt, _this.installedAt) ||
                other.installedAt == _this.installedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as Config;
    return Object.hashAll([
      runtimeType,
      _this.uuid,
      _this.nickname,
      _this.bgmUrl,
      _this.gameBgmUrl,
      _this.contactUsEmail,
      _this.bgmLicenseUrl,
      _this.baseUrl,
      _this.baseSocketUrl,
      _this.inviteUrl,
      _this.noticeUrl,
      _this.suggestKeywordsUrl,
      const DeepCollectionEquality().hash(_this.devUuidList),
      _this.isUiTestMode,
      _this.isUiTestModeMark,
      _this.isFirstRun,
      _this.isQuickStartFirstRun,
      _this.isLightTheme,
      _this.isBgmDisabled,
      _this.isBgmMute,
      _this.isGameBgmDisabled,
      _this.isReactionDisabled,
      _this.language,
      _this.appId,
      _this.appInfo,
      _this.termsOfServiceUrl,
      _this.privacyPolicyUrl,
      _this.minBuildNumber,
      _this.drawOptimizeEpsilion,
      _this.updateDialogData,
      _this.admob,
      _this.notificationSetting,
      _this.noticeDialogData,
      _this.noticeDialogHistory,
      _this.maintenanceDialogData,
      _this.installedAt
    ]);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    final _this = this as Config;
    return 'Config(uuid: ${_this.uuid}, nickname: ${_this.nickname}, bgmUrl: ${_this.bgmUrl}, gameBgmUrl: ${_this.gameBgmUrl}, contactUsEmail: ${_this.contactUsEmail}, bgmLicenseUrl: ${_this.bgmLicenseUrl}, baseUrl: ${_this.baseUrl}, baseSocketUrl: ${_this.baseSocketUrl}, inviteUrl: ${_this.inviteUrl}, noticeUrl: ${_this.noticeUrl}, suggestKeywordsUrl: ${_this.suggestKeywordsUrl}, devUuidList: ${_this.devUuidList}, isUiTestMode: ${_this.isUiTestMode}, isUiTestModeMark: ${_this.isUiTestModeMark}, isFirstRun: ${_this.isFirstRun}, isQuickStartFirstRun: ${_this.isQuickStartFirstRun}, isLightTheme: ${_this.isLightTheme}, isBgmDisabled: ${_this.isBgmDisabled}, isBgmMute: ${_this.isBgmMute}, isGameBgmDisabled: ${_this.isGameBgmDisabled}, isReactionDisabled: ${_this.isReactionDisabled}, language: ${_this.language}, appId: ${_this.appId}, appInfo: ${_this.appInfo}, termsOfServiceUrl: ${_this.termsOfServiceUrl}, privacyPolicyUrl: ${_this.privacyPolicyUrl}, minBuildNumber: ${_this.minBuildNumber}, drawOptimizeEpsilion: ${_this.drawOptimizeEpsilion}, updateDialogData: ${_this.updateDialogData}, admob: ${_this.admob}, notificationSetting: ${_this.notificationSetting}, noticeDialogData: ${_this.noticeDialogData}, noticeDialogHistory: ${_this.noticeDialogHistory}, maintenanceDialogData: ${_this.maintenanceDialogData}, installedAt: ${_this.installedAt})';
  }
}

/// @nodoc
abstract mixin class $ConfigCopyWith<$Res> {
  factory $ConfigCopyWith(Config value, $Res Function(Config) _then) =
      _$ConfigCopyWithImpl;
  @useResult
  $Res call(
      {String uuid,
      String nickname,
      String bgmUrl,
      String gameBgmUrl,
      String contactUsEmail,
      Uri bgmLicenseUrl,
      Uri baseUrl,
      Uri baseSocketUrl,
      Uri inviteUrl,
      Uri noticeUrl,
      Uri suggestKeywordsUrl,
      List<String> devUuidList,
      bool isUiTestMode,
      bool isUiTestModeMark,
      bool isFirstRun,
      bool isQuickStartFirstRun,
      bool isLightTheme,
      bool isBgmDisabled,
      bool isBgmMute,
      bool isGameBgmDisabled,
      bool isReactionDisabled,
      Language language,
      AppId appId,
      AppInfo appInfo,
      Uri termsOfServiceUrl,
      Uri privacyPolicyUrl,
      int minBuildNumber,
      double drawOptimizeEpsilion,
      UpdateDialogData updateDialogData,
      Admob admob,
      NotificationSetting notificationSetting,
      NoticeDialogData? noticeDialogData,
      NoticeDialogHistory? noticeDialogHistory,
      MaintenanceDialogData? maintenanceDialogData,
      @TimeSerializer() DateTime installedAt});

  $AppIdCopyWith<$Res> get appId;
  $AppInfoCopyWith<$Res> get appInfo;
  $UpdateDialogDataCopyWith<$Res> get updateDialogData;
  $AdmobCopyWith<$Res> get admob;
  $NotificationSettingCopyWith<$Res> get notificationSetting;
  $NoticeDialogDataCopyWith<$Res>? get noticeDialogData;
  $NoticeDialogHistoryCopyWith<$Res>? get noticeDialogHistory;
  $MaintenanceDialogDataCopyWith<$Res>? get maintenanceDialogData;
}

/// @nodoc
class _$ConfigCopyWithImpl<$Res> implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._self, this._then);

  final Config _self;
  final $Res Function(Config) _then;

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? nickname = null,
    Object? bgmUrl = null,
    Object? gameBgmUrl = null,
    Object? contactUsEmail = null,
    Object? bgmLicenseUrl = null,
    Object? baseUrl = null,
    Object? baseSocketUrl = null,
    Object? inviteUrl = null,
    Object? noticeUrl = null,
    Object? suggestKeywordsUrl = null,
    Object? devUuidList = null,
    Object? isUiTestMode = null,
    Object? isUiTestModeMark = null,
    Object? isFirstRun = null,
    Object? isQuickStartFirstRun = null,
    Object? isLightTheme = null,
    Object? isBgmDisabled = null,
    Object? isBgmMute = null,
    Object? isGameBgmDisabled = null,
    Object? isReactionDisabled = null,
    Object? language = null,
    Object? appId = null,
    Object? appInfo = null,
    Object? termsOfServiceUrl = null,
    Object? privacyPolicyUrl = null,
    Object? minBuildNumber = null,
    Object? drawOptimizeEpsilion = null,
    Object? updateDialogData = null,
    Object? admob = null,
    Object? notificationSetting = null,
    Object? noticeDialogData = freezed,
    Object? noticeDialogHistory = freezed,
    Object? maintenanceDialogData = freezed,
    Object? installedAt = null,
  }) {
    return _then(Config(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      bgmUrl: null == bgmUrl
          ? _self.bgmUrl
          : bgmUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gameBgmUrl: null == gameBgmUrl
          ? _self.gameBgmUrl
          : gameBgmUrl // ignore: cast_nullable_to_non_nullable
              as String,
      contactUsEmail: null == contactUsEmail
          ? _self.contactUsEmail
          : contactUsEmail // ignore: cast_nullable_to_non_nullable
              as String,
      bgmLicenseUrl: null == bgmLicenseUrl
          ? _self.bgmLicenseUrl
          : bgmLicenseUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      baseUrl: null == baseUrl
          ? _self.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      baseSocketUrl: null == baseSocketUrl
          ? _self.baseSocketUrl
          : baseSocketUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      inviteUrl: null == inviteUrl
          ? _self.inviteUrl
          : inviteUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      noticeUrl: null == noticeUrl
          ? _self.noticeUrl
          : noticeUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      suggestKeywordsUrl: null == suggestKeywordsUrl
          ? _self.suggestKeywordsUrl
          : suggestKeywordsUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      devUuidList: null == devUuidList
          ? _self.devUuidList
          : devUuidList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isUiTestMode: null == isUiTestMode
          ? _self.isUiTestMode
          : isUiTestMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isUiTestModeMark: null == isUiTestModeMark
          ? _self.isUiTestModeMark
          : isUiTestModeMark // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstRun: null == isFirstRun
          ? _self.isFirstRun
          : isFirstRun // ignore: cast_nullable_to_non_nullable
              as bool,
      isQuickStartFirstRun: null == isQuickStartFirstRun
          ? _self.isQuickStartFirstRun
          : isQuickStartFirstRun // ignore: cast_nullable_to_non_nullable
              as bool,
      isLightTheme: null == isLightTheme
          ? _self.isLightTheme
          : isLightTheme // ignore: cast_nullable_to_non_nullable
              as bool,
      isBgmDisabled: null == isBgmDisabled
          ? _self.isBgmDisabled
          : isBgmDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isBgmMute: null == isBgmMute
          ? _self.isBgmMute
          : isBgmMute // ignore: cast_nullable_to_non_nullable
              as bool,
      isGameBgmDisabled: null == isGameBgmDisabled
          ? _self.isGameBgmDisabled
          : isGameBgmDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isReactionDisabled: null == isReactionDisabled
          ? _self.isReactionDisabled
          : isReactionDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
      appId: null == appId
          ? _self.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as AppId,
      appInfo: null == appInfo
          ? _self.appInfo
          : appInfo // ignore: cast_nullable_to_non_nullable
              as AppInfo,
      termsOfServiceUrl: null == termsOfServiceUrl
          ? _self.termsOfServiceUrl
          : termsOfServiceUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      privacyPolicyUrl: null == privacyPolicyUrl
          ? _self.privacyPolicyUrl
          : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      minBuildNumber: null == minBuildNumber
          ? _self.minBuildNumber
          : minBuildNumber // ignore: cast_nullable_to_non_nullable
              as int,
      drawOptimizeEpsilion: null == drawOptimizeEpsilion
          ? _self.drawOptimizeEpsilion
          : drawOptimizeEpsilion // ignore: cast_nullable_to_non_nullable
              as double,
      updateDialogData: null == updateDialogData
          ? _self.updateDialogData
          : updateDialogData // ignore: cast_nullable_to_non_nullable
              as UpdateDialogData,
      admob: null == admob
          ? _self.admob
          : admob // ignore: cast_nullable_to_non_nullable
              as Admob,
      notificationSetting: null == notificationSetting
          ? _self.notificationSetting
          : notificationSetting // ignore: cast_nullable_to_non_nullable
              as NotificationSetting,
      noticeDialogData: freezed == noticeDialogData
          ? _self.noticeDialogData
          : noticeDialogData // ignore: cast_nullable_to_non_nullable
              as NoticeDialogData?,
      noticeDialogHistory: freezed == noticeDialogHistory
          ? _self.noticeDialogHistory
          : noticeDialogHistory // ignore: cast_nullable_to_non_nullable
              as NoticeDialogHistory?,
      maintenanceDialogData: freezed == maintenanceDialogData
          ? _self.maintenanceDialogData
          : maintenanceDialogData // ignore: cast_nullable_to_non_nullable
              as MaintenanceDialogData?,
      installedAt: null == installedAt
          ? _self.installedAt
          : installedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppIdCopyWith<$Res> get appId {
    return $AppIdCopyWith<$Res>(_self.appId, (value) {
      return _then(_self.copyWith(appId: value));
    });
  }

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppInfoCopyWith<$Res> get appInfo {
    return $AppInfoCopyWith<$Res>(_self.appInfo, (value) {
      return _then(_self.copyWith(appInfo: value));
    });
  }

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpdateDialogDataCopyWith<$Res> get updateDialogData {
    return $UpdateDialogDataCopyWith<$Res>(_self.updateDialogData, (value) {
      return _then(_self.copyWith(updateDialogData: value));
    });
  }

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdmobCopyWith<$Res> get admob {
    return $AdmobCopyWith<$Res>(_self.admob, (value) {
      return _then(_self.copyWith(admob: value));
    });
  }

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingCopyWith<$Res> get notificationSetting {
    return $NotificationSettingCopyWith<$Res>(_self.notificationSetting,
        (value) {
      return _then(_self.copyWith(notificationSetting: value));
    });
  }

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NoticeDialogDataCopyWith<$Res>? get noticeDialogData {
    if (_self.noticeDialogData == null) {
      return null;
    }

    return $NoticeDialogDataCopyWith<$Res>(_self.noticeDialogData!, (value) {
      return _then(_self.copyWith(noticeDialogData: value));
    });
  }

  /// Create a copy of Config
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

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaintenanceDialogDataCopyWith<$Res>? get maintenanceDialogData {
    if (_self.maintenanceDialogData == null) {
      return null;
    }

    return $MaintenanceDialogDataCopyWith<$Res>(_self.maintenanceDialogData!,
        (value) {
      return _then(_self.copyWith(maintenanceDialogData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Config].
extension ConfigPatterns on Config {
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
    TResult Function(_Config value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Config() when $default != null:
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
    TResult Function(_Config value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Config():
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
    TResult? Function(_Config value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Config() when $default != null:
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
            String uuid,
            String nickname,
            String bgmUrl,
            String gameBgmUrl,
            String contactUsEmail,
            Uri bgmLicenseUrl,
            Uri baseUrl,
            Uri baseSocketUrl,
            Uri inviteUrl,
            Uri noticeUrl,
            Uri suggestKeywordsUrl,
            List<String> devUuidList,
            bool isUiTestMode,
            bool isUiTestModeMark,
            bool isFirstRun,
            bool isQuickStartFirstRun,
            bool isLightTheme,
            bool isBgmDisabled,
            bool isBgmMute,
            bool isGameBgmDisabled,
            bool isReactionDisabled,
            Language language,
            AppId appId,
            AppInfo appInfo,
            Uri termsOfServiceUrl,
            Uri privacyPolicyUrl,
            int minBuildNumber,
            double drawOptimizeEpsilion,
            UpdateDialogData updateDialogData,
            Admob admob,
            NotificationSetting notificationSetting,
            NoticeDialogData? noticeDialogData,
            NoticeDialogHistory? noticeDialogHistory,
            MaintenanceDialogData? maintenanceDialogData,
            @TimeSerializer() DateTime installedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Config() when $default != null:
        return $default(
            _that.uuid,
            _that.nickname,
            _that.bgmUrl,
            _that.gameBgmUrl,
            _that.contactUsEmail,
            _that.bgmLicenseUrl,
            _that.baseUrl,
            _that.baseSocketUrl,
            _that.inviteUrl,
            _that.noticeUrl,
            _that.suggestKeywordsUrl,
            _that.devUuidList,
            _that.isUiTestMode,
            _that.isUiTestModeMark,
            _that.isFirstRun,
            _that.isQuickStartFirstRun,
            _that.isLightTheme,
            _that.isBgmDisabled,
            _that.isBgmMute,
            _that.isGameBgmDisabled,
            _that.isReactionDisabled,
            _that.language,
            _that.appId,
            _that.appInfo,
            _that.termsOfServiceUrl,
            _that.privacyPolicyUrl,
            _that.minBuildNumber,
            _that.drawOptimizeEpsilion,
            _that.updateDialogData,
            _that.admob,
            _that.notificationSetting,
            _that.noticeDialogData,
            _that.noticeDialogHistory,
            _that.maintenanceDialogData,
            _that.installedAt);
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
            String uuid,
            String nickname,
            String bgmUrl,
            String gameBgmUrl,
            String contactUsEmail,
            Uri bgmLicenseUrl,
            Uri baseUrl,
            Uri baseSocketUrl,
            Uri inviteUrl,
            Uri noticeUrl,
            Uri suggestKeywordsUrl,
            List<String> devUuidList,
            bool isUiTestMode,
            bool isUiTestModeMark,
            bool isFirstRun,
            bool isQuickStartFirstRun,
            bool isLightTheme,
            bool isBgmDisabled,
            bool isBgmMute,
            bool isGameBgmDisabled,
            bool isReactionDisabled,
            Language language,
            AppId appId,
            AppInfo appInfo,
            Uri termsOfServiceUrl,
            Uri privacyPolicyUrl,
            int minBuildNumber,
            double drawOptimizeEpsilion,
            UpdateDialogData updateDialogData,
            Admob admob,
            NotificationSetting notificationSetting,
            NoticeDialogData? noticeDialogData,
            NoticeDialogHistory? noticeDialogHistory,
            MaintenanceDialogData? maintenanceDialogData,
            @TimeSerializer() DateTime installedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Config():
        return $default(
            _that.uuid,
            _that.nickname,
            _that.bgmUrl,
            _that.gameBgmUrl,
            _that.contactUsEmail,
            _that.bgmLicenseUrl,
            _that.baseUrl,
            _that.baseSocketUrl,
            _that.inviteUrl,
            _that.noticeUrl,
            _that.suggestKeywordsUrl,
            _that.devUuidList,
            _that.isUiTestMode,
            _that.isUiTestModeMark,
            _that.isFirstRun,
            _that.isQuickStartFirstRun,
            _that.isLightTheme,
            _that.isBgmDisabled,
            _that.isBgmMute,
            _that.isGameBgmDisabled,
            _that.isReactionDisabled,
            _that.language,
            _that.appId,
            _that.appInfo,
            _that.termsOfServiceUrl,
            _that.privacyPolicyUrl,
            _that.minBuildNumber,
            _that.drawOptimizeEpsilion,
            _that.updateDialogData,
            _that.admob,
            _that.notificationSetting,
            _that.noticeDialogData,
            _that.noticeDialogHistory,
            _that.maintenanceDialogData,
            _that.installedAt);
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
            String uuid,
            String nickname,
            String bgmUrl,
            String gameBgmUrl,
            String contactUsEmail,
            Uri bgmLicenseUrl,
            Uri baseUrl,
            Uri baseSocketUrl,
            Uri inviteUrl,
            Uri noticeUrl,
            Uri suggestKeywordsUrl,
            List<String> devUuidList,
            bool isUiTestMode,
            bool isUiTestModeMark,
            bool isFirstRun,
            bool isQuickStartFirstRun,
            bool isLightTheme,
            bool isBgmDisabled,
            bool isBgmMute,
            bool isGameBgmDisabled,
            bool isReactionDisabled,
            Language language,
            AppId appId,
            AppInfo appInfo,
            Uri termsOfServiceUrl,
            Uri privacyPolicyUrl,
            int minBuildNumber,
            double drawOptimizeEpsilion,
            UpdateDialogData updateDialogData,
            Admob admob,
            NotificationSetting notificationSetting,
            NoticeDialogData? noticeDialogData,
            NoticeDialogHistory? noticeDialogHistory,
            MaintenanceDialogData? maintenanceDialogData,
            @TimeSerializer() DateTime installedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Config() when $default != null:
        return $default(
            _that.uuid,
            _that.nickname,
            _that.bgmUrl,
            _that.gameBgmUrl,
            _that.contactUsEmail,
            _that.bgmLicenseUrl,
            _that.baseUrl,
            _that.baseSocketUrl,
            _that.inviteUrl,
            _that.noticeUrl,
            _that.suggestKeywordsUrl,
            _that.devUuidList,
            _that.isUiTestMode,
            _that.isUiTestModeMark,
            _that.isFirstRun,
            _that.isQuickStartFirstRun,
            _that.isLightTheme,
            _that.isBgmDisabled,
            _that.isBgmMute,
            _that.isGameBgmDisabled,
            _that.isReactionDisabled,
            _that.language,
            _that.appId,
            _that.appInfo,
            _that.termsOfServiceUrl,
            _that.privacyPolicyUrl,
            _that.minBuildNumber,
            _that.drawOptimizeEpsilion,
            _that.updateDialogData,
            _that.admob,
            _that.notificationSetting,
            _that.noticeDialogData,
            _that.noticeDialogHistory,
            _that.maintenanceDialogData,
            _that.installedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Config extends Config with DiagnosticableTreeMixin {
  _Config(
      {required this.uuid,
      required this.nickname,
      required this.bgmUrl,
      required this.gameBgmUrl,
      required this.contactUsEmail,
      required this.bgmLicenseUrl,
      required this.baseUrl,
      required this.baseSocketUrl,
      required this.inviteUrl,
      required this.noticeUrl,
      required this.suggestKeywordsUrl,
      required List<String> devUuidList,
      required this.isUiTestMode,
      required this.isUiTestModeMark,
      required this.isFirstRun,
      required this.isQuickStartFirstRun,
      required this.isLightTheme,
      required this.isBgmDisabled,
      required this.isBgmMute,
      required this.isGameBgmDisabled,
      required this.isReactionDisabled,
      required this.language,
      required this.appId,
      required this.appInfo,
      required this.termsOfServiceUrl,
      required this.privacyPolicyUrl,
      required this.minBuildNumber,
      required this.drawOptimizeEpsilion,
      required this.updateDialogData,
      required this.admob,
      required this.notificationSetting,
      this.noticeDialogData,
      this.noticeDialogHistory,
      this.maintenanceDialogData,
      @TimeSerializer() required this.installedAt})
      : _devUuidList = devUuidList,
        super._();
  factory _Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  @override
  final String uuid;
  @override
  final String nickname;
  @override
  final String bgmUrl;
  @override
  final String gameBgmUrl;
  @override
  final String contactUsEmail;
  @override
  final Uri bgmLicenseUrl;
  @override
  final Uri baseUrl;
  @override
  final Uri baseSocketUrl;
  @override
  final Uri inviteUrl;
  @override
  final Uri noticeUrl;
  @override
  final Uri suggestKeywordsUrl;
  final List<String> _devUuidList;
  @override
  List<String> get devUuidList {
    if (_devUuidList is EqualUnmodifiableListView) return _devUuidList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devUuidList);
  }

  @override
  final bool isUiTestMode;
  @override
  final bool isUiTestModeMark;
  @override
  final bool isFirstRun;

  /// Whether it's the first attemp for quick start
  @override
  final bool isQuickStartFirstRun;
  @override
  final bool isLightTheme;
  @override
  final bool isBgmDisabled;
  @override
  final bool isBgmMute;
  @override
  final bool isGameBgmDisabled;
  @override
  final bool isReactionDisabled;
  @override
  final Language language;
  @override
  final AppId appId;
  @override
  final AppInfo appInfo;
  @override
  final Uri termsOfServiceUrl;
  @override
  final Uri privacyPolicyUrl;
  @override
  final int minBuildNumber;
  @override
  final double drawOptimizeEpsilion;
  @override
  final UpdateDialogData updateDialogData;
  @override
  final Admob admob;
  @override
  final NotificationSetting notificationSetting;
  @override
  final NoticeDialogData? noticeDialogData;
  @override
  final NoticeDialogHistory? noticeDialogHistory;
  @override
  final MaintenanceDialogData? maintenanceDialogData;
  @override
  @TimeSerializer()
  final DateTime installedAt;

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConfigCopyWith<_Config> get copyWith =>
      __$ConfigCopyWithImpl<_Config>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ConfigToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Config'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('nickname', nickname))
      ..add(DiagnosticsProperty('bgmUrl', bgmUrl))
      ..add(DiagnosticsProperty('gameBgmUrl', gameBgmUrl))
      ..add(DiagnosticsProperty('contactUsEmail', contactUsEmail))
      ..add(DiagnosticsProperty('bgmLicenseUrl', bgmLicenseUrl))
      ..add(DiagnosticsProperty('baseUrl', baseUrl))
      ..add(DiagnosticsProperty('baseSocketUrl', baseSocketUrl))
      ..add(DiagnosticsProperty('inviteUrl', inviteUrl))
      ..add(DiagnosticsProperty('noticeUrl', noticeUrl))
      ..add(DiagnosticsProperty('suggestKeywordsUrl', suggestKeywordsUrl))
      ..add(DiagnosticsProperty('devUuidList', devUuidList))
      ..add(DiagnosticsProperty('isUiTestMode', isUiTestMode))
      ..add(DiagnosticsProperty('isUiTestModeMark', isUiTestModeMark))
      ..add(DiagnosticsProperty('isFirstRun', isFirstRun))
      ..add(DiagnosticsProperty('isQuickStartFirstRun', isQuickStartFirstRun))
      ..add(DiagnosticsProperty('isLightTheme', isLightTheme))
      ..add(DiagnosticsProperty('isBgmDisabled', isBgmDisabled))
      ..add(DiagnosticsProperty('isBgmMute', isBgmMute))
      ..add(DiagnosticsProperty('isGameBgmDisabled', isGameBgmDisabled))
      ..add(DiagnosticsProperty('isReactionDisabled', isReactionDisabled))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('appId', appId))
      ..add(DiagnosticsProperty('appInfo', appInfo))
      ..add(DiagnosticsProperty('termsOfServiceUrl', termsOfServiceUrl))
      ..add(DiagnosticsProperty('privacyPolicyUrl', privacyPolicyUrl))
      ..add(DiagnosticsProperty('minBuildNumber', minBuildNumber))
      ..add(DiagnosticsProperty('drawOptimizeEpsilion', drawOptimizeEpsilion))
      ..add(DiagnosticsProperty('updateDialogData', updateDialogData))
      ..add(DiagnosticsProperty('admob', admob))
      ..add(DiagnosticsProperty('notificationSetting', notificationSetting))
      ..add(DiagnosticsProperty('noticeDialogData', noticeDialogData))
      ..add(DiagnosticsProperty('noticeDialogHistory', noticeDialogHistory))
      ..add(DiagnosticsProperty('maintenanceDialogData', maintenanceDialogData))
      ..add(DiagnosticsProperty('installedAt', installedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Config &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.bgmUrl, bgmUrl) || other.bgmUrl == bgmUrl) &&
            (identical(other.gameBgmUrl, gameBgmUrl) ||
                other.gameBgmUrl == gameBgmUrl) &&
            (identical(other.contactUsEmail, contactUsEmail) ||
                other.contactUsEmail == contactUsEmail) &&
            (identical(other.bgmLicenseUrl, bgmLicenseUrl) ||
                other.bgmLicenseUrl == bgmLicenseUrl) &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.baseSocketUrl, baseSocketUrl) ||
                other.baseSocketUrl == baseSocketUrl) &&
            (identical(other.inviteUrl, inviteUrl) ||
                other.inviteUrl == inviteUrl) &&
            (identical(other.noticeUrl, noticeUrl) ||
                other.noticeUrl == noticeUrl) &&
            (identical(other.suggestKeywordsUrl, suggestKeywordsUrl) ||
                other.suggestKeywordsUrl == suggestKeywordsUrl) &&
            const DeepCollectionEquality()
                .equals(other.devUuidList, _devUuidList) &&
            (identical(other.isUiTestMode, isUiTestMode) ||
                other.isUiTestMode == isUiTestMode) &&
            (identical(other.isUiTestModeMark, isUiTestModeMark) ||
                other.isUiTestModeMark == isUiTestModeMark) &&
            (identical(other.isFirstRun, isFirstRun) ||
                other.isFirstRun == isFirstRun) &&
            (identical(other.isQuickStartFirstRun, isQuickStartFirstRun) ||
                other.isQuickStartFirstRun == isQuickStartFirstRun) &&
            (identical(other.isLightTheme, isLightTheme) ||
                other.isLightTheme == isLightTheme) &&
            (identical(other.isBgmDisabled, isBgmDisabled) ||
                other.isBgmDisabled == isBgmDisabled) &&
            (identical(other.isBgmMute, isBgmMute) ||
                other.isBgmMute == isBgmMute) &&
            (identical(other.isGameBgmDisabled, isGameBgmDisabled) ||
                other.isGameBgmDisabled == isGameBgmDisabled) &&
            (identical(other.isReactionDisabled, isReactionDisabled) ||
                other.isReactionDisabled == isReactionDisabled) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.appInfo, appInfo) || other.appInfo == appInfo) &&
            (identical(other.termsOfServiceUrl, termsOfServiceUrl) ||
                other.termsOfServiceUrl == termsOfServiceUrl) &&
            (identical(other.privacyPolicyUrl, privacyPolicyUrl) ||
                other.privacyPolicyUrl == privacyPolicyUrl) &&
            (identical(other.minBuildNumber, minBuildNumber) ||
                other.minBuildNumber == minBuildNumber) &&
            (identical(other.drawOptimizeEpsilion, drawOptimizeEpsilion) ||
                other.drawOptimizeEpsilion == drawOptimizeEpsilion) &&
            (identical(other.updateDialogData, updateDialogData) ||
                other.updateDialogData == updateDialogData) &&
            (identical(other.admob, admob) || other.admob == admob) &&
            (identical(other.notificationSetting, notificationSetting) ||
                other.notificationSetting == notificationSetting) &&
            (identical(other.noticeDialogData, noticeDialogData) ||
                other.noticeDialogData == noticeDialogData) &&
            (identical(other.noticeDialogHistory, noticeDialogHistory) ||
                other.noticeDialogHistory == noticeDialogHistory) &&
            (identical(other.maintenanceDialogData, maintenanceDialogData) ||
                other.maintenanceDialogData == maintenanceDialogData) &&
            (identical(other.installedAt, installedAt) ||
                other.installedAt == installedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hashAll([
      runtimeType,
      uuid,
      nickname,
      bgmUrl,
      gameBgmUrl,
      contactUsEmail,
      bgmLicenseUrl,
      baseUrl,
      baseSocketUrl,
      inviteUrl,
      noticeUrl,
      suggestKeywordsUrl,
      const DeepCollectionEquality().hash(_devUuidList),
      isUiTestMode,
      isUiTestModeMark,
      isFirstRun,
      isQuickStartFirstRun,
      isLightTheme,
      isBgmDisabled,
      isBgmMute,
      isGameBgmDisabled,
      isReactionDisabled,
      language,
      appId,
      appInfo,
      termsOfServiceUrl,
      privacyPolicyUrl,
      minBuildNumber,
      drawOptimizeEpsilion,
      updateDialogData,
      admob,
      notificationSetting,
      noticeDialogData,
      noticeDialogHistory,
      maintenanceDialogData,
      installedAt
    ]);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Config(uuid: $uuid, nickname: $nickname, bgmUrl: $bgmUrl, gameBgmUrl: $gameBgmUrl, contactUsEmail: $contactUsEmail, bgmLicenseUrl: $bgmLicenseUrl, baseUrl: $baseUrl, baseSocketUrl: $baseSocketUrl, inviteUrl: $inviteUrl, noticeUrl: $noticeUrl, suggestKeywordsUrl: $suggestKeywordsUrl, devUuidList: $devUuidList, isUiTestMode: $isUiTestMode, isUiTestModeMark: $isUiTestModeMark, isFirstRun: $isFirstRun, isQuickStartFirstRun: $isQuickStartFirstRun, isLightTheme: $isLightTheme, isBgmDisabled: $isBgmDisabled, isBgmMute: $isBgmMute, isGameBgmDisabled: $isGameBgmDisabled, isReactionDisabled: $isReactionDisabled, language: $language, appId: $appId, appInfo: $appInfo, termsOfServiceUrl: $termsOfServiceUrl, privacyPolicyUrl: $privacyPolicyUrl, minBuildNumber: $minBuildNumber, drawOptimizeEpsilion: $drawOptimizeEpsilion, updateDialogData: $updateDialogData, admob: $admob, notificationSetting: $notificationSetting, noticeDialogData: $noticeDialogData, noticeDialogHistory: $noticeDialogHistory, maintenanceDialogData: $maintenanceDialogData, installedAt: $installedAt)';
  }
}

/// @nodoc
abstract mixin class _$ConfigCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$ConfigCopyWith(_Config value, $Res Function(_Config) _then) =
      __$ConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uuid,
      String nickname,
      String bgmUrl,
      String gameBgmUrl,
      String contactUsEmail,
      Uri bgmLicenseUrl,
      Uri baseUrl,
      Uri baseSocketUrl,
      Uri inviteUrl,
      Uri noticeUrl,
      Uri suggestKeywordsUrl,
      List<String> devUuidList,
      bool isUiTestMode,
      bool isUiTestModeMark,
      bool isFirstRun,
      bool isQuickStartFirstRun,
      bool isLightTheme,
      bool isBgmDisabled,
      bool isBgmMute,
      bool isGameBgmDisabled,
      bool isReactionDisabled,
      Language language,
      AppId appId,
      AppInfo appInfo,
      Uri termsOfServiceUrl,
      Uri privacyPolicyUrl,
      int minBuildNumber,
      double drawOptimizeEpsilion,
      UpdateDialogData updateDialogData,
      Admob admob,
      NotificationSetting notificationSetting,
      NoticeDialogData? noticeDialogData,
      NoticeDialogHistory? noticeDialogHistory,
      MaintenanceDialogData? maintenanceDialogData,
      @TimeSerializer() DateTime installedAt});

  @override
  $AppIdCopyWith<$Res> get appId;
  @override
  $AppInfoCopyWith<$Res> get appInfo;
  @override
  $UpdateDialogDataCopyWith<$Res> get updateDialogData;
  @override
  $AdmobCopyWith<$Res> get admob;
  @override
  $NotificationSettingCopyWith<$Res> get notificationSetting;
  @override
  $NoticeDialogDataCopyWith<$Res>? get noticeDialogData;
  @override
  $NoticeDialogHistoryCopyWith<$Res>? get noticeDialogHistory;
  @override
  $MaintenanceDialogDataCopyWith<$Res>? get maintenanceDialogData;
}

/// @nodoc
class __$ConfigCopyWithImpl<$Res> implements _$ConfigCopyWith<$Res> {
  __$ConfigCopyWithImpl(this._self, this._then);

  final _Config _self;
  final $Res Function(_Config) _then;

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uuid = null,
    Object? nickname = null,
    Object? bgmUrl = null,
    Object? gameBgmUrl = null,
    Object? contactUsEmail = null,
    Object? bgmLicenseUrl = null,
    Object? baseUrl = null,
    Object? baseSocketUrl = null,
    Object? inviteUrl = null,
    Object? noticeUrl = null,
    Object? suggestKeywordsUrl = null,
    Object? devUuidList = null,
    Object? isUiTestMode = null,
    Object? isUiTestModeMark = null,
    Object? isFirstRun = null,
    Object? isQuickStartFirstRun = null,
    Object? isLightTheme = null,
    Object? isBgmDisabled = null,
    Object? isBgmMute = null,
    Object? isGameBgmDisabled = null,
    Object? isReactionDisabled = null,
    Object? language = null,
    Object? appId = null,
    Object? appInfo = null,
    Object? termsOfServiceUrl = null,
    Object? privacyPolicyUrl = null,
    Object? minBuildNumber = null,
    Object? drawOptimizeEpsilion = null,
    Object? updateDialogData = null,
    Object? admob = null,
    Object? notificationSetting = null,
    Object? noticeDialogData = freezed,
    Object? noticeDialogHistory = freezed,
    Object? maintenanceDialogData = freezed,
    Object? installedAt = null,
  }) {
    return _then(_Config(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      bgmUrl: null == bgmUrl
          ? _self.bgmUrl
          : bgmUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gameBgmUrl: null == gameBgmUrl
          ? _self.gameBgmUrl
          : gameBgmUrl // ignore: cast_nullable_to_non_nullable
              as String,
      contactUsEmail: null == contactUsEmail
          ? _self.contactUsEmail
          : contactUsEmail // ignore: cast_nullable_to_non_nullable
              as String,
      bgmLicenseUrl: null == bgmLicenseUrl
          ? _self.bgmLicenseUrl
          : bgmLicenseUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      baseUrl: null == baseUrl
          ? _self.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      baseSocketUrl: null == baseSocketUrl
          ? _self.baseSocketUrl
          : baseSocketUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      inviteUrl: null == inviteUrl
          ? _self.inviteUrl
          : inviteUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      noticeUrl: null == noticeUrl
          ? _self.noticeUrl
          : noticeUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      suggestKeywordsUrl: null == suggestKeywordsUrl
          ? _self.suggestKeywordsUrl
          : suggestKeywordsUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      devUuidList: null == devUuidList
          ? _self._devUuidList
          : devUuidList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isUiTestMode: null == isUiTestMode
          ? _self.isUiTestMode
          : isUiTestMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isUiTestModeMark: null == isUiTestModeMark
          ? _self.isUiTestModeMark
          : isUiTestModeMark // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstRun: null == isFirstRun
          ? _self.isFirstRun
          : isFirstRun // ignore: cast_nullable_to_non_nullable
              as bool,
      isQuickStartFirstRun: null == isQuickStartFirstRun
          ? _self.isQuickStartFirstRun
          : isQuickStartFirstRun // ignore: cast_nullable_to_non_nullable
              as bool,
      isLightTheme: null == isLightTheme
          ? _self.isLightTheme
          : isLightTheme // ignore: cast_nullable_to_non_nullable
              as bool,
      isBgmDisabled: null == isBgmDisabled
          ? _self.isBgmDisabled
          : isBgmDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isBgmMute: null == isBgmMute
          ? _self.isBgmMute
          : isBgmMute // ignore: cast_nullable_to_non_nullable
              as bool,
      isGameBgmDisabled: null == isGameBgmDisabled
          ? _self.isGameBgmDisabled
          : isGameBgmDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isReactionDisabled: null == isReactionDisabled
          ? _self.isReactionDisabled
          : isReactionDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
      appId: null == appId
          ? _self.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as AppId,
      appInfo: null == appInfo
          ? _self.appInfo
          : appInfo // ignore: cast_nullable_to_non_nullable
              as AppInfo,
      termsOfServiceUrl: null == termsOfServiceUrl
          ? _self.termsOfServiceUrl
          : termsOfServiceUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      privacyPolicyUrl: null == privacyPolicyUrl
          ? _self.privacyPolicyUrl
          : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      minBuildNumber: null == minBuildNumber
          ? _self.minBuildNumber
          : minBuildNumber // ignore: cast_nullable_to_non_nullable
              as int,
      drawOptimizeEpsilion: null == drawOptimizeEpsilion
          ? _self.drawOptimizeEpsilion
          : drawOptimizeEpsilion // ignore: cast_nullable_to_non_nullable
              as double,
      updateDialogData: null == updateDialogData
          ? _self.updateDialogData
          : updateDialogData // ignore: cast_nullable_to_non_nullable
              as UpdateDialogData,
      admob: null == admob
          ? _self.admob
          : admob // ignore: cast_nullable_to_non_nullable
              as Admob,
      notificationSetting: null == notificationSetting
          ? _self.notificationSetting
          : notificationSetting // ignore: cast_nullable_to_non_nullable
              as NotificationSetting,
      noticeDialogData: freezed == noticeDialogData
          ? _self.noticeDialogData
          : noticeDialogData // ignore: cast_nullable_to_non_nullable
              as NoticeDialogData?,
      noticeDialogHistory: freezed == noticeDialogHistory
          ? _self.noticeDialogHistory
          : noticeDialogHistory // ignore: cast_nullable_to_non_nullable
              as NoticeDialogHistory?,
      maintenanceDialogData: freezed == maintenanceDialogData
          ? _self.maintenanceDialogData
          : maintenanceDialogData // ignore: cast_nullable_to_non_nullable
              as MaintenanceDialogData?,
      installedAt: null == installedAt
          ? _self.installedAt
          : installedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppIdCopyWith<$Res> get appId {
    return $AppIdCopyWith<$Res>(_self.appId, (value) {
      return _then(_self.copyWith(appId: value));
    });
  }

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppInfoCopyWith<$Res> get appInfo {
    return $AppInfoCopyWith<$Res>(_self.appInfo, (value) {
      return _then(_self.copyWith(appInfo: value));
    });
  }

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpdateDialogDataCopyWith<$Res> get updateDialogData {
    return $UpdateDialogDataCopyWith<$Res>(_self.updateDialogData, (value) {
      return _then(_self.copyWith(updateDialogData: value));
    });
  }

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdmobCopyWith<$Res> get admob {
    return $AdmobCopyWith<$Res>(_self.admob, (value) {
      return _then(_self.copyWith(admob: value));
    });
  }

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingCopyWith<$Res> get notificationSetting {
    return $NotificationSettingCopyWith<$Res>(_self.notificationSetting,
        (value) {
      return _then(_self.copyWith(notificationSetting: value));
    });
  }

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NoticeDialogDataCopyWith<$Res>? get noticeDialogData {
    if (_self.noticeDialogData == null) {
      return null;
    }

    return $NoticeDialogDataCopyWith<$Res>(_self.noticeDialogData!, (value) {
      return _then(_self.copyWith(noticeDialogData: value));
    });
  }

  /// Create a copy of Config
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

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaintenanceDialogDataCopyWith<$Res>? get maintenanceDialogData {
    if (_self.maintenanceDialogData == null) {
      return null;
    }

    return $MaintenanceDialogDataCopyWith<$Res>(_self.maintenanceDialogData!,
        (value) {
      return _then(_self.copyWith(maintenanceDialogData: value));
    });
  }
}

// dart format on
