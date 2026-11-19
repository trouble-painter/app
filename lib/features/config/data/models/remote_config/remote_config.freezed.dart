// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemoteConfig {
  /// App
  String get aosAppId;
  String get iosAppId;

  /// Urls
  RemoteConfigLang get privacyPolicyUrl;
  RemoteConfigLang get termsOfServiceUrl;
  RemoteConfigLang get noticeUrl;
  RemoteConfigLang get suggestKeywordsUrl;
  String get baseUrl;
  String get baseSocketUrl;
  String get inviteUrl;
  String get instagramUrl;
  String get discordUrl;

  /// Settings
  int get maxDrawingPoints;
  int get drawingThrottleMs;
  int get reactionThrottleMs;
  int get maxGuessLength;
  double get drawOptimizeEpsilion;
  bool get isReactionDisabled;

  /// Bgm
  String get bgmUrl;
  String get gameBgmUrl;
  bool get isBgmDisabled;
  bool get isGameBgmDisabled;
  RemoteConfigLang get bgmLicenseUrl;

  /// Operation
  RemoteConfigMinBuildNumber get minBuildNumber;
  RemoteConfigUpdateDialogData get updateDialogData;
  String get contactUsEmail;
  RemoteConfigNoticeDialogData? get noticeDialogData;
  RemoteConfigMaintenanceDialogData? get maintenanceDialogData;

  /// Admob
  RemoteConfigAdmobId get admobAppId;
  RemoteConfigAdmobId get admobQuickStartRewardId;

  /// Notification
  bool get disableQuickStartNoti;

  /// Developers
  List<String> get devUuidList;

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RemoteConfigCopyWith<RemoteConfig> get copyWith =>
      _$RemoteConfigCopyWithImpl<RemoteConfig>(
          this as RemoteConfig, _$identity);

  /// Serializes this RemoteConfig to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as RemoteConfig;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemoteConfig &&
            (identical(other.aosAppId, _this.aosAppId) ||
                other.aosAppId == _this.aosAppId) &&
            (identical(other.iosAppId, _this.iosAppId) ||
                other.iosAppId == _this.iosAppId) &&
            (identical(other.privacyPolicyUrl, _this.privacyPolicyUrl) ||
                other.privacyPolicyUrl == _this.privacyPolicyUrl) &&
            (identical(other.termsOfServiceUrl, _this.termsOfServiceUrl) ||
                other.termsOfServiceUrl == _this.termsOfServiceUrl) &&
            (identical(other.noticeUrl, _this.noticeUrl) ||
                other.noticeUrl == _this.noticeUrl) &&
            (identical(other.suggestKeywordsUrl, _this.suggestKeywordsUrl) ||
                other.suggestKeywordsUrl == _this.suggestKeywordsUrl) &&
            (identical(other.baseUrl, _this.baseUrl) ||
                other.baseUrl == _this.baseUrl) &&
            (identical(other.baseSocketUrl, _this.baseSocketUrl) ||
                other.baseSocketUrl == _this.baseSocketUrl) &&
            (identical(other.inviteUrl, _this.inviteUrl) ||
                other.inviteUrl == _this.inviteUrl) &&
            (identical(other.instagramUrl, _this.instagramUrl) ||
                other.instagramUrl == _this.instagramUrl) &&
            (identical(other.discordUrl, _this.discordUrl) ||
                other.discordUrl == _this.discordUrl) &&
            (identical(other.maxDrawingPoints, _this.maxDrawingPoints) ||
                other.maxDrawingPoints == _this.maxDrawingPoints) &&
            (identical(other.drawingThrottleMs, _this.drawingThrottleMs) ||
                other.drawingThrottleMs == _this.drawingThrottleMs) &&
            (identical(other.reactionThrottleMs, _this.reactionThrottleMs) ||
                other.reactionThrottleMs == _this.reactionThrottleMs) &&
            (identical(other.maxGuessLength, _this.maxGuessLength) ||
                other.maxGuessLength == _this.maxGuessLength) &&
            (identical(other.drawOptimizeEpsilion, _this.drawOptimizeEpsilion) ||
                other.drawOptimizeEpsilion == _this.drawOptimizeEpsilion) &&
            (identical(other.isReactionDisabled, _this.isReactionDisabled) ||
                other.isReactionDisabled == _this.isReactionDisabled) &&
            (identical(other.bgmUrl, _this.bgmUrl) ||
                other.bgmUrl == _this.bgmUrl) &&
            (identical(other.gameBgmUrl, _this.gameBgmUrl) ||
                other.gameBgmUrl == _this.gameBgmUrl) &&
            (identical(other.isBgmDisabled, _this.isBgmDisabled) ||
                other.isBgmDisabled == _this.isBgmDisabled) &&
            (identical(other.isGameBgmDisabled, _this.isGameBgmDisabled) ||
                other.isGameBgmDisabled == _this.isGameBgmDisabled) &&
            (identical(other.bgmLicenseUrl, _this.bgmLicenseUrl) ||
                other.bgmLicenseUrl == _this.bgmLicenseUrl) &&
            (identical(other.minBuildNumber, _this.minBuildNumber) ||
                other.minBuildNumber == _this.minBuildNumber) &&
            (identical(other.updateDialogData, _this.updateDialogData) ||
                other.updateDialogData == _this.updateDialogData) &&
            (identical(other.contactUsEmail, _this.contactUsEmail) ||
                other.contactUsEmail == _this.contactUsEmail) &&
            (identical(other.noticeDialogData, _this.noticeDialogData) ||
                other.noticeDialogData == _this.noticeDialogData) &&
            (identical(other.maintenanceDialogData, _this.maintenanceDialogData) ||
                other.maintenanceDialogData == _this.maintenanceDialogData) &&
            (identical(other.admobAppId, _this.admobAppId) ||
                other.admobAppId == _this.admobAppId) &&
            (identical(other.admobQuickStartRewardId,
                    _this.admobQuickStartRewardId) ||
                other.admobQuickStartRewardId ==
                    _this.admobQuickStartRewardId) &&
            (identical(
                    other.disableQuickStartNoti, _this.disableQuickStartNoti) ||
                other.disableQuickStartNoti == _this.disableQuickStartNoti) &&
            const DeepCollectionEquality()
                .equals(other.devUuidList, _this.devUuidList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as RemoteConfig;
    return Object.hashAll([
      runtimeType,
      _this.aosAppId,
      _this.iosAppId,
      _this.privacyPolicyUrl,
      _this.termsOfServiceUrl,
      _this.noticeUrl,
      _this.suggestKeywordsUrl,
      _this.baseUrl,
      _this.baseSocketUrl,
      _this.inviteUrl,
      _this.instagramUrl,
      _this.discordUrl,
      _this.maxDrawingPoints,
      _this.drawingThrottleMs,
      _this.reactionThrottleMs,
      _this.maxGuessLength,
      _this.drawOptimizeEpsilion,
      _this.isReactionDisabled,
      _this.bgmUrl,
      _this.gameBgmUrl,
      _this.isBgmDisabled,
      _this.isGameBgmDisabled,
      _this.bgmLicenseUrl,
      _this.minBuildNumber,
      _this.updateDialogData,
      _this.contactUsEmail,
      _this.noticeDialogData,
      _this.maintenanceDialogData,
      _this.admobAppId,
      _this.admobQuickStartRewardId,
      _this.disableQuickStartNoti,
      const DeepCollectionEquality().hash(_this.devUuidList)
    ]);
  }

  @override
  String toString() {
    final _this = this as RemoteConfig;
    return 'RemoteConfig(aosAppId: ${_this.aosAppId}, iosAppId: ${_this.iosAppId}, privacyPolicyUrl: ${_this.privacyPolicyUrl}, termsOfServiceUrl: ${_this.termsOfServiceUrl}, noticeUrl: ${_this.noticeUrl}, suggestKeywordsUrl: ${_this.suggestKeywordsUrl}, baseUrl: ${_this.baseUrl}, baseSocketUrl: ${_this.baseSocketUrl}, inviteUrl: ${_this.inviteUrl}, instagramUrl: ${_this.instagramUrl}, discordUrl: ${_this.discordUrl}, maxDrawingPoints: ${_this.maxDrawingPoints}, drawingThrottleMs: ${_this.drawingThrottleMs}, reactionThrottleMs: ${_this.reactionThrottleMs}, maxGuessLength: ${_this.maxGuessLength}, drawOptimizeEpsilion: ${_this.drawOptimizeEpsilion}, isReactionDisabled: ${_this.isReactionDisabled}, bgmUrl: ${_this.bgmUrl}, gameBgmUrl: ${_this.gameBgmUrl}, isBgmDisabled: ${_this.isBgmDisabled}, isGameBgmDisabled: ${_this.isGameBgmDisabled}, bgmLicenseUrl: ${_this.bgmLicenseUrl}, minBuildNumber: ${_this.minBuildNumber}, updateDialogData: ${_this.updateDialogData}, contactUsEmail: ${_this.contactUsEmail}, noticeDialogData: ${_this.noticeDialogData}, maintenanceDialogData: ${_this.maintenanceDialogData}, admobAppId: ${_this.admobAppId}, admobQuickStartRewardId: ${_this.admobQuickStartRewardId}, disableQuickStartNoti: ${_this.disableQuickStartNoti}, devUuidList: ${_this.devUuidList})';
  }
}

/// @nodoc
abstract mixin class $RemoteConfigCopyWith<$Res> {
  factory $RemoteConfigCopyWith(
          RemoteConfig value, $Res Function(RemoteConfig) _then) =
      _$RemoteConfigCopyWithImpl;
  @useResult
  $Res call(
      {String aosAppId,
      String iosAppId,
      RemoteConfigLang privacyPolicyUrl,
      RemoteConfigLang termsOfServiceUrl,
      RemoteConfigLang noticeUrl,
      RemoteConfigLang suggestKeywordsUrl,
      String baseUrl,
      String baseSocketUrl,
      String inviteUrl,
      String instagramUrl,
      String discordUrl,
      int maxDrawingPoints,
      int drawingThrottleMs,
      int reactionThrottleMs,
      int maxGuessLength,
      double drawOptimizeEpsilion,
      bool isReactionDisabled,
      String bgmUrl,
      String gameBgmUrl,
      bool isBgmDisabled,
      bool isGameBgmDisabled,
      RemoteConfigLang bgmLicenseUrl,
      RemoteConfigMinBuildNumber minBuildNumber,
      RemoteConfigUpdateDialogData updateDialogData,
      String contactUsEmail,
      RemoteConfigNoticeDialogData? noticeDialogData,
      RemoteConfigMaintenanceDialogData? maintenanceDialogData,
      RemoteConfigAdmobId admobAppId,
      RemoteConfigAdmobId admobQuickStartRewardId,
      bool disableQuickStartNoti,
      List<String> devUuidList});

  $RemoteConfigLangCopyWith<$Res> get privacyPolicyUrl;
  $RemoteConfigLangCopyWith<$Res> get termsOfServiceUrl;
  $RemoteConfigLangCopyWith<$Res> get noticeUrl;
  $RemoteConfigLangCopyWith<$Res> get suggestKeywordsUrl;
  $RemoteConfigLangCopyWith<$Res> get bgmLicenseUrl;
  $RemoteConfigMinBuildNumberCopyWith<$Res> get minBuildNumber;
  $RemoteConfigUpdateDialogDataCopyWith<$Res> get updateDialogData;
  $RemoteConfigNoticeDialogDataCopyWith<$Res>? get noticeDialogData;
  $RemoteConfigMaintenanceDialogDataCopyWith<$Res>? get maintenanceDialogData;
  $RemoteConfigAdmobIdCopyWith<$Res> get admobAppId;
  $RemoteConfigAdmobIdCopyWith<$Res> get admobQuickStartRewardId;
}

/// @nodoc
class _$RemoteConfigCopyWithImpl<$Res> implements $RemoteConfigCopyWith<$Res> {
  _$RemoteConfigCopyWithImpl(this._self, this._then);

  final RemoteConfig _self;
  final $Res Function(RemoteConfig) _then;

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aosAppId = null,
    Object? iosAppId = null,
    Object? privacyPolicyUrl = null,
    Object? termsOfServiceUrl = null,
    Object? noticeUrl = null,
    Object? suggestKeywordsUrl = null,
    Object? baseUrl = null,
    Object? baseSocketUrl = null,
    Object? inviteUrl = null,
    Object? instagramUrl = null,
    Object? discordUrl = null,
    Object? maxDrawingPoints = null,
    Object? drawingThrottleMs = null,
    Object? reactionThrottleMs = null,
    Object? maxGuessLength = null,
    Object? drawOptimizeEpsilion = null,
    Object? isReactionDisabled = null,
    Object? bgmUrl = null,
    Object? gameBgmUrl = null,
    Object? isBgmDisabled = null,
    Object? isGameBgmDisabled = null,
    Object? bgmLicenseUrl = null,
    Object? minBuildNumber = null,
    Object? updateDialogData = null,
    Object? contactUsEmail = null,
    Object? noticeDialogData = freezed,
    Object? maintenanceDialogData = freezed,
    Object? admobAppId = null,
    Object? admobQuickStartRewardId = null,
    Object? disableQuickStartNoti = null,
    Object? devUuidList = null,
  }) {
    return _then(RemoteConfig(
      aosAppId: null == aosAppId
          ? _self.aosAppId
          : aosAppId // ignore: cast_nullable_to_non_nullable
              as String,
      iosAppId: null == iosAppId
          ? _self.iosAppId
          : iosAppId // ignore: cast_nullable_to_non_nullable
              as String,
      privacyPolicyUrl: null == privacyPolicyUrl
          ? _self.privacyPolicyUrl
          : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
      termsOfServiceUrl: null == termsOfServiceUrl
          ? _self.termsOfServiceUrl
          : termsOfServiceUrl // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
      noticeUrl: null == noticeUrl
          ? _self.noticeUrl
          : noticeUrl // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
      suggestKeywordsUrl: null == suggestKeywordsUrl
          ? _self.suggestKeywordsUrl
          : suggestKeywordsUrl // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
      baseUrl: null == baseUrl
          ? _self.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      baseSocketUrl: null == baseSocketUrl
          ? _self.baseSocketUrl
          : baseSocketUrl // ignore: cast_nullable_to_non_nullable
              as String,
      inviteUrl: null == inviteUrl
          ? _self.inviteUrl
          : inviteUrl // ignore: cast_nullable_to_non_nullable
              as String,
      instagramUrl: null == instagramUrl
          ? _self.instagramUrl
          : instagramUrl // ignore: cast_nullable_to_non_nullable
              as String,
      discordUrl: null == discordUrl
          ? _self.discordUrl
          : discordUrl // ignore: cast_nullable_to_non_nullable
              as String,
      maxDrawingPoints: null == maxDrawingPoints
          ? _self.maxDrawingPoints
          : maxDrawingPoints // ignore: cast_nullable_to_non_nullable
              as int,
      drawingThrottleMs: null == drawingThrottleMs
          ? _self.drawingThrottleMs
          : drawingThrottleMs // ignore: cast_nullable_to_non_nullable
              as int,
      reactionThrottleMs: null == reactionThrottleMs
          ? _self.reactionThrottleMs
          : reactionThrottleMs // ignore: cast_nullable_to_non_nullable
              as int,
      maxGuessLength: null == maxGuessLength
          ? _self.maxGuessLength
          : maxGuessLength // ignore: cast_nullable_to_non_nullable
              as int,
      drawOptimizeEpsilion: null == drawOptimizeEpsilion
          ? _self.drawOptimizeEpsilion
          : drawOptimizeEpsilion // ignore: cast_nullable_to_non_nullable
              as double,
      isReactionDisabled: null == isReactionDisabled
          ? _self.isReactionDisabled
          : isReactionDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      bgmUrl: null == bgmUrl
          ? _self.bgmUrl
          : bgmUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gameBgmUrl: null == gameBgmUrl
          ? _self.gameBgmUrl
          : gameBgmUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isBgmDisabled: null == isBgmDisabled
          ? _self.isBgmDisabled
          : isBgmDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isGameBgmDisabled: null == isGameBgmDisabled
          ? _self.isGameBgmDisabled
          : isGameBgmDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      bgmLicenseUrl: null == bgmLicenseUrl
          ? _self.bgmLicenseUrl
          : bgmLicenseUrl // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
      minBuildNumber: null == minBuildNumber
          ? _self.minBuildNumber
          : minBuildNumber // ignore: cast_nullable_to_non_nullable
              as RemoteConfigMinBuildNumber,
      updateDialogData: null == updateDialogData
          ? _self.updateDialogData
          : updateDialogData // ignore: cast_nullable_to_non_nullable
              as RemoteConfigUpdateDialogData,
      contactUsEmail: null == contactUsEmail
          ? _self.contactUsEmail
          : contactUsEmail // ignore: cast_nullable_to_non_nullable
              as String,
      noticeDialogData: freezed == noticeDialogData
          ? _self.noticeDialogData
          : noticeDialogData // ignore: cast_nullable_to_non_nullable
              as RemoteConfigNoticeDialogData?,
      maintenanceDialogData: freezed == maintenanceDialogData
          ? _self.maintenanceDialogData
          : maintenanceDialogData // ignore: cast_nullable_to_non_nullable
              as RemoteConfigMaintenanceDialogData?,
      admobAppId: null == admobAppId
          ? _self.admobAppId
          : admobAppId // ignore: cast_nullable_to_non_nullable
              as RemoteConfigAdmobId,
      admobQuickStartRewardId: null == admobQuickStartRewardId
          ? _self.admobQuickStartRewardId
          : admobQuickStartRewardId // ignore: cast_nullable_to_non_nullable
              as RemoteConfigAdmobId,
      disableQuickStartNoti: null == disableQuickStartNoti
          ? _self.disableQuickStartNoti
          : disableQuickStartNoti // ignore: cast_nullable_to_non_nullable
              as bool,
      devUuidList: null == devUuidList
          ? _self.devUuidList
          : devUuidList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get privacyPolicyUrl {
    return $RemoteConfigLangCopyWith<$Res>(_self.privacyPolicyUrl, (value) {
      return _then(_self.copyWith(privacyPolicyUrl: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get termsOfServiceUrl {
    return $RemoteConfigLangCopyWith<$Res>(_self.termsOfServiceUrl, (value) {
      return _then(_self.copyWith(termsOfServiceUrl: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get noticeUrl {
    return $RemoteConfigLangCopyWith<$Res>(_self.noticeUrl, (value) {
      return _then(_self.copyWith(noticeUrl: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get suggestKeywordsUrl {
    return $RemoteConfigLangCopyWith<$Res>(_self.suggestKeywordsUrl, (value) {
      return _then(_self.copyWith(suggestKeywordsUrl: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get bgmLicenseUrl {
    return $RemoteConfigLangCopyWith<$Res>(_self.bgmLicenseUrl, (value) {
      return _then(_self.copyWith(bgmLicenseUrl: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigMinBuildNumberCopyWith<$Res> get minBuildNumber {
    return $RemoteConfigMinBuildNumberCopyWith<$Res>(_self.minBuildNumber,
        (value) {
      return _then(_self.copyWith(minBuildNumber: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigUpdateDialogDataCopyWith<$Res> get updateDialogData {
    return $RemoteConfigUpdateDialogDataCopyWith<$Res>(_self.updateDialogData,
        (value) {
      return _then(_self.copyWith(updateDialogData: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigNoticeDialogDataCopyWith<$Res>? get noticeDialogData {
    if (_self.noticeDialogData == null) {
      return null;
    }

    return $RemoteConfigNoticeDialogDataCopyWith<$Res>(_self.noticeDialogData!,
        (value) {
      return _then(_self.copyWith(noticeDialogData: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigMaintenanceDialogDataCopyWith<$Res>? get maintenanceDialogData {
    if (_self.maintenanceDialogData == null) {
      return null;
    }

    return $RemoteConfigMaintenanceDialogDataCopyWith<$Res>(
        _self.maintenanceDialogData!, (value) {
      return _then(_self.copyWith(maintenanceDialogData: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigAdmobIdCopyWith<$Res> get admobAppId {
    return $RemoteConfigAdmobIdCopyWith<$Res>(_self.admobAppId, (value) {
      return _then(_self.copyWith(admobAppId: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigAdmobIdCopyWith<$Res> get admobQuickStartRewardId {
    return $RemoteConfigAdmobIdCopyWith<$Res>(_self.admobQuickStartRewardId,
        (value) {
      return _then(_self.copyWith(admobQuickStartRewardId: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RemoteConfig].
extension RemoteConfigPatterns on RemoteConfig {
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
    TResult Function(_RemoteConfig value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemoteConfig() when $default != null:
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
    TResult Function(_RemoteConfig value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfig():
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
    TResult? Function(_RemoteConfig value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfig() when $default != null:
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
            String aosAppId,
            String iosAppId,
            RemoteConfigLang privacyPolicyUrl,
            RemoteConfigLang termsOfServiceUrl,
            RemoteConfigLang noticeUrl,
            RemoteConfigLang suggestKeywordsUrl,
            String baseUrl,
            String baseSocketUrl,
            String inviteUrl,
            String instagramUrl,
            String discordUrl,
            int maxDrawingPoints,
            int drawingThrottleMs,
            int reactionThrottleMs,
            int maxGuessLength,
            double drawOptimizeEpsilion,
            bool isReactionDisabled,
            String bgmUrl,
            String gameBgmUrl,
            bool isBgmDisabled,
            bool isGameBgmDisabled,
            RemoteConfigLang bgmLicenseUrl,
            RemoteConfigMinBuildNumber minBuildNumber,
            RemoteConfigUpdateDialogData updateDialogData,
            String contactUsEmail,
            RemoteConfigNoticeDialogData? noticeDialogData,
            RemoteConfigMaintenanceDialogData? maintenanceDialogData,
            RemoteConfigAdmobId admobAppId,
            RemoteConfigAdmobId admobQuickStartRewardId,
            bool disableQuickStartNoti,
            List<String> devUuidList)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemoteConfig() when $default != null:
        return $default(
            _that.aosAppId,
            _that.iosAppId,
            _that.privacyPolicyUrl,
            _that.termsOfServiceUrl,
            _that.noticeUrl,
            _that.suggestKeywordsUrl,
            _that.baseUrl,
            _that.baseSocketUrl,
            _that.inviteUrl,
            _that.instagramUrl,
            _that.discordUrl,
            _that.maxDrawingPoints,
            _that.drawingThrottleMs,
            _that.reactionThrottleMs,
            _that.maxGuessLength,
            _that.drawOptimizeEpsilion,
            _that.isReactionDisabled,
            _that.bgmUrl,
            _that.gameBgmUrl,
            _that.isBgmDisabled,
            _that.isGameBgmDisabled,
            _that.bgmLicenseUrl,
            _that.minBuildNumber,
            _that.updateDialogData,
            _that.contactUsEmail,
            _that.noticeDialogData,
            _that.maintenanceDialogData,
            _that.admobAppId,
            _that.admobQuickStartRewardId,
            _that.disableQuickStartNoti,
            _that.devUuidList);
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
            String aosAppId,
            String iosAppId,
            RemoteConfigLang privacyPolicyUrl,
            RemoteConfigLang termsOfServiceUrl,
            RemoteConfigLang noticeUrl,
            RemoteConfigLang suggestKeywordsUrl,
            String baseUrl,
            String baseSocketUrl,
            String inviteUrl,
            String instagramUrl,
            String discordUrl,
            int maxDrawingPoints,
            int drawingThrottleMs,
            int reactionThrottleMs,
            int maxGuessLength,
            double drawOptimizeEpsilion,
            bool isReactionDisabled,
            String bgmUrl,
            String gameBgmUrl,
            bool isBgmDisabled,
            bool isGameBgmDisabled,
            RemoteConfigLang bgmLicenseUrl,
            RemoteConfigMinBuildNumber minBuildNumber,
            RemoteConfigUpdateDialogData updateDialogData,
            String contactUsEmail,
            RemoteConfigNoticeDialogData? noticeDialogData,
            RemoteConfigMaintenanceDialogData? maintenanceDialogData,
            RemoteConfigAdmobId admobAppId,
            RemoteConfigAdmobId admobQuickStartRewardId,
            bool disableQuickStartNoti,
            List<String> devUuidList)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfig():
        return $default(
            _that.aosAppId,
            _that.iosAppId,
            _that.privacyPolicyUrl,
            _that.termsOfServiceUrl,
            _that.noticeUrl,
            _that.suggestKeywordsUrl,
            _that.baseUrl,
            _that.baseSocketUrl,
            _that.inviteUrl,
            _that.instagramUrl,
            _that.discordUrl,
            _that.maxDrawingPoints,
            _that.drawingThrottleMs,
            _that.reactionThrottleMs,
            _that.maxGuessLength,
            _that.drawOptimizeEpsilion,
            _that.isReactionDisabled,
            _that.bgmUrl,
            _that.gameBgmUrl,
            _that.isBgmDisabled,
            _that.isGameBgmDisabled,
            _that.bgmLicenseUrl,
            _that.minBuildNumber,
            _that.updateDialogData,
            _that.contactUsEmail,
            _that.noticeDialogData,
            _that.maintenanceDialogData,
            _that.admobAppId,
            _that.admobQuickStartRewardId,
            _that.disableQuickStartNoti,
            _that.devUuidList);
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
            String aosAppId,
            String iosAppId,
            RemoteConfigLang privacyPolicyUrl,
            RemoteConfigLang termsOfServiceUrl,
            RemoteConfigLang noticeUrl,
            RemoteConfigLang suggestKeywordsUrl,
            String baseUrl,
            String baseSocketUrl,
            String inviteUrl,
            String instagramUrl,
            String discordUrl,
            int maxDrawingPoints,
            int drawingThrottleMs,
            int reactionThrottleMs,
            int maxGuessLength,
            double drawOptimizeEpsilion,
            bool isReactionDisabled,
            String bgmUrl,
            String gameBgmUrl,
            bool isBgmDisabled,
            bool isGameBgmDisabled,
            RemoteConfigLang bgmLicenseUrl,
            RemoteConfigMinBuildNumber minBuildNumber,
            RemoteConfigUpdateDialogData updateDialogData,
            String contactUsEmail,
            RemoteConfigNoticeDialogData? noticeDialogData,
            RemoteConfigMaintenanceDialogData? maintenanceDialogData,
            RemoteConfigAdmobId admobAppId,
            RemoteConfigAdmobId admobQuickStartRewardId,
            bool disableQuickStartNoti,
            List<String> devUuidList)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemoteConfig() when $default != null:
        return $default(
            _that.aosAppId,
            _that.iosAppId,
            _that.privacyPolicyUrl,
            _that.termsOfServiceUrl,
            _that.noticeUrl,
            _that.suggestKeywordsUrl,
            _that.baseUrl,
            _that.baseSocketUrl,
            _that.inviteUrl,
            _that.instagramUrl,
            _that.discordUrl,
            _that.maxDrawingPoints,
            _that.drawingThrottleMs,
            _that.reactionThrottleMs,
            _that.maxGuessLength,
            _that.drawOptimizeEpsilion,
            _that.isReactionDisabled,
            _that.bgmUrl,
            _that.gameBgmUrl,
            _that.isBgmDisabled,
            _that.isGameBgmDisabled,
            _that.bgmLicenseUrl,
            _that.minBuildNumber,
            _that.updateDialogData,
            _that.contactUsEmail,
            _that.noticeDialogData,
            _that.maintenanceDialogData,
            _that.admobAppId,
            _that.admobQuickStartRewardId,
            _that.disableQuickStartNoti,
            _that.devUuidList);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RemoteConfig extends RemoteConfig {
  _RemoteConfig(
      {required this.aosAppId,
      required this.iosAppId,
      required this.privacyPolicyUrl,
      required this.termsOfServiceUrl,
      required this.noticeUrl,
      required this.suggestKeywordsUrl,
      required this.baseUrl,
      required this.baseSocketUrl,
      required this.inviteUrl,
      required this.instagramUrl,
      required this.discordUrl,
      required this.maxDrawingPoints,
      required this.drawingThrottleMs,
      required this.reactionThrottleMs,
      required this.maxGuessLength,
      required this.drawOptimizeEpsilion,
      required this.isReactionDisabled,
      required this.bgmUrl,
      required this.gameBgmUrl,
      required this.isBgmDisabled,
      required this.isGameBgmDisabled,
      required this.bgmLicenseUrl,
      required this.minBuildNumber,
      required this.updateDialogData,
      required this.contactUsEmail,
      this.noticeDialogData,
      this.maintenanceDialogData,
      required this.admobAppId,
      required this.admobQuickStartRewardId,
      required this.disableQuickStartNoti,
      required List<String> devUuidList})
      : _devUuidList = devUuidList,
        super._();
  factory _RemoteConfig.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigFromJson(json);

  /// App
  @override
  final String aosAppId;
  @override
  final String iosAppId;

  /// Urls
  @override
  final RemoteConfigLang privacyPolicyUrl;
  @override
  final RemoteConfigLang termsOfServiceUrl;
  @override
  final RemoteConfigLang noticeUrl;
  @override
  final RemoteConfigLang suggestKeywordsUrl;
  @override
  final String baseUrl;
  @override
  final String baseSocketUrl;
  @override
  final String inviteUrl;
  @override
  final String instagramUrl;
  @override
  final String discordUrl;

  /// Settings
  @override
  final int maxDrawingPoints;
  @override
  final int drawingThrottleMs;
  @override
  final int reactionThrottleMs;
  @override
  final int maxGuessLength;
  @override
  final double drawOptimizeEpsilion;
  @override
  final bool isReactionDisabled;

  /// Bgm
  @override
  final String bgmUrl;
  @override
  final String gameBgmUrl;
  @override
  final bool isBgmDisabled;
  @override
  final bool isGameBgmDisabled;
  @override
  final RemoteConfigLang bgmLicenseUrl;

  /// Operation
  @override
  final RemoteConfigMinBuildNumber minBuildNumber;
  @override
  final RemoteConfigUpdateDialogData updateDialogData;
  @override
  final String contactUsEmail;
  @override
  final RemoteConfigNoticeDialogData? noticeDialogData;
  @override
  final RemoteConfigMaintenanceDialogData? maintenanceDialogData;

  /// Admob
  @override
  final RemoteConfigAdmobId admobAppId;
  @override
  final RemoteConfigAdmobId admobQuickStartRewardId;

  /// Notification
  @override
  final bool disableQuickStartNoti;

  /// Developers
  final List<String> _devUuidList;

  /// Developers
  @override
  List<String> get devUuidList {
    if (_devUuidList is EqualUnmodifiableListView) return _devUuidList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devUuidList);
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RemoteConfigCopyWith<_RemoteConfig> get copyWith =>
      __$RemoteConfigCopyWithImpl<_RemoteConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RemoteConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RemoteConfig &&
            (identical(other.aosAppId, aosAppId) ||
                other.aosAppId == aosAppId) &&
            (identical(other.iosAppId, iosAppId) ||
                other.iosAppId == iosAppId) &&
            (identical(other.privacyPolicyUrl, privacyPolicyUrl) ||
                other.privacyPolicyUrl == privacyPolicyUrl) &&
            (identical(other.termsOfServiceUrl, termsOfServiceUrl) ||
                other.termsOfServiceUrl == termsOfServiceUrl) &&
            (identical(other.noticeUrl, noticeUrl) ||
                other.noticeUrl == noticeUrl) &&
            (identical(other.suggestKeywordsUrl, suggestKeywordsUrl) ||
                other.suggestKeywordsUrl == suggestKeywordsUrl) &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.baseSocketUrl, baseSocketUrl) ||
                other.baseSocketUrl == baseSocketUrl) &&
            (identical(other.inviteUrl, inviteUrl) ||
                other.inviteUrl == inviteUrl) &&
            (identical(other.instagramUrl, instagramUrl) ||
                other.instagramUrl == instagramUrl) &&
            (identical(other.discordUrl, discordUrl) ||
                other.discordUrl == discordUrl) &&
            (identical(other.maxDrawingPoints, maxDrawingPoints) ||
                other.maxDrawingPoints == maxDrawingPoints) &&
            (identical(other.drawingThrottleMs, drawingThrottleMs) ||
                other.drawingThrottleMs == drawingThrottleMs) &&
            (identical(other.reactionThrottleMs, reactionThrottleMs) ||
                other.reactionThrottleMs == reactionThrottleMs) &&
            (identical(other.maxGuessLength, maxGuessLength) ||
                other.maxGuessLength == maxGuessLength) &&
            (identical(other.drawOptimizeEpsilion, drawOptimizeEpsilion) ||
                other.drawOptimizeEpsilion == drawOptimizeEpsilion) &&
            (identical(other.isReactionDisabled, isReactionDisabled) ||
                other.isReactionDisabled == isReactionDisabled) &&
            (identical(other.bgmUrl, bgmUrl) || other.bgmUrl == bgmUrl) &&
            (identical(other.gameBgmUrl, gameBgmUrl) ||
                other.gameBgmUrl == gameBgmUrl) &&
            (identical(other.isBgmDisabled, isBgmDisabled) ||
                other.isBgmDisabled == isBgmDisabled) &&
            (identical(other.isGameBgmDisabled, isGameBgmDisabled) ||
                other.isGameBgmDisabled == isGameBgmDisabled) &&
            (identical(other.bgmLicenseUrl, bgmLicenseUrl) ||
                other.bgmLicenseUrl == bgmLicenseUrl) &&
            (identical(other.minBuildNumber, minBuildNumber) ||
                other.minBuildNumber == minBuildNumber) &&
            (identical(other.updateDialogData, updateDialogData) ||
                other.updateDialogData == updateDialogData) &&
            (identical(other.contactUsEmail, contactUsEmail) ||
                other.contactUsEmail == contactUsEmail) &&
            (identical(other.noticeDialogData, noticeDialogData) ||
                other.noticeDialogData == noticeDialogData) &&
            (identical(other.maintenanceDialogData, maintenanceDialogData) ||
                other.maintenanceDialogData == maintenanceDialogData) &&
            (identical(other.admobAppId, admobAppId) ||
                other.admobAppId == admobAppId) &&
            (identical(
                    other.admobQuickStartRewardId, admobQuickStartRewardId) ||
                other.admobQuickStartRewardId == admobQuickStartRewardId) &&
            (identical(other.disableQuickStartNoti, disableQuickStartNoti) ||
                other.disableQuickStartNoti == disableQuickStartNoti) &&
            const DeepCollectionEquality()
                .equals(other.devUuidList, _devUuidList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hashAll([
      runtimeType,
      aosAppId,
      iosAppId,
      privacyPolicyUrl,
      termsOfServiceUrl,
      noticeUrl,
      suggestKeywordsUrl,
      baseUrl,
      baseSocketUrl,
      inviteUrl,
      instagramUrl,
      discordUrl,
      maxDrawingPoints,
      drawingThrottleMs,
      reactionThrottleMs,
      maxGuessLength,
      drawOptimizeEpsilion,
      isReactionDisabled,
      bgmUrl,
      gameBgmUrl,
      isBgmDisabled,
      isGameBgmDisabled,
      bgmLicenseUrl,
      minBuildNumber,
      updateDialogData,
      contactUsEmail,
      noticeDialogData,
      maintenanceDialogData,
      admobAppId,
      admobQuickStartRewardId,
      disableQuickStartNoti,
      const DeepCollectionEquality().hash(_devUuidList)
    ]);
  }

  @override
  String toString() {
    return 'RemoteConfig(aosAppId: $aosAppId, iosAppId: $iosAppId, privacyPolicyUrl: $privacyPolicyUrl, termsOfServiceUrl: $termsOfServiceUrl, noticeUrl: $noticeUrl, suggestKeywordsUrl: $suggestKeywordsUrl, baseUrl: $baseUrl, baseSocketUrl: $baseSocketUrl, inviteUrl: $inviteUrl, instagramUrl: $instagramUrl, discordUrl: $discordUrl, maxDrawingPoints: $maxDrawingPoints, drawingThrottleMs: $drawingThrottleMs, reactionThrottleMs: $reactionThrottleMs, maxGuessLength: $maxGuessLength, drawOptimizeEpsilion: $drawOptimizeEpsilion, isReactionDisabled: $isReactionDisabled, bgmUrl: $bgmUrl, gameBgmUrl: $gameBgmUrl, isBgmDisabled: $isBgmDisabled, isGameBgmDisabled: $isGameBgmDisabled, bgmLicenseUrl: $bgmLicenseUrl, minBuildNumber: $minBuildNumber, updateDialogData: $updateDialogData, contactUsEmail: $contactUsEmail, noticeDialogData: $noticeDialogData, maintenanceDialogData: $maintenanceDialogData, admobAppId: $admobAppId, admobQuickStartRewardId: $admobQuickStartRewardId, disableQuickStartNoti: $disableQuickStartNoti, devUuidList: $devUuidList)';
  }
}

/// @nodoc
abstract mixin class _$RemoteConfigCopyWith<$Res>
    implements $RemoteConfigCopyWith<$Res> {
  factory _$RemoteConfigCopyWith(
          _RemoteConfig value, $Res Function(_RemoteConfig) _then) =
      __$RemoteConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String aosAppId,
      String iosAppId,
      RemoteConfigLang privacyPolicyUrl,
      RemoteConfigLang termsOfServiceUrl,
      RemoteConfigLang noticeUrl,
      RemoteConfigLang suggestKeywordsUrl,
      String baseUrl,
      String baseSocketUrl,
      String inviteUrl,
      String instagramUrl,
      String discordUrl,
      int maxDrawingPoints,
      int drawingThrottleMs,
      int reactionThrottleMs,
      int maxGuessLength,
      double drawOptimizeEpsilion,
      bool isReactionDisabled,
      String bgmUrl,
      String gameBgmUrl,
      bool isBgmDisabled,
      bool isGameBgmDisabled,
      RemoteConfigLang bgmLicenseUrl,
      RemoteConfigMinBuildNumber minBuildNumber,
      RemoteConfigUpdateDialogData updateDialogData,
      String contactUsEmail,
      RemoteConfigNoticeDialogData? noticeDialogData,
      RemoteConfigMaintenanceDialogData? maintenanceDialogData,
      RemoteConfigAdmobId admobAppId,
      RemoteConfigAdmobId admobQuickStartRewardId,
      bool disableQuickStartNoti,
      List<String> devUuidList});

  @override
  $RemoteConfigLangCopyWith<$Res> get privacyPolicyUrl;
  @override
  $RemoteConfigLangCopyWith<$Res> get termsOfServiceUrl;
  @override
  $RemoteConfigLangCopyWith<$Res> get noticeUrl;
  @override
  $RemoteConfigLangCopyWith<$Res> get suggestKeywordsUrl;
  @override
  $RemoteConfigLangCopyWith<$Res> get bgmLicenseUrl;
  @override
  $RemoteConfigMinBuildNumberCopyWith<$Res> get minBuildNumber;
  @override
  $RemoteConfigUpdateDialogDataCopyWith<$Res> get updateDialogData;
  @override
  $RemoteConfigNoticeDialogDataCopyWith<$Res>? get noticeDialogData;
  @override
  $RemoteConfigMaintenanceDialogDataCopyWith<$Res>? get maintenanceDialogData;
  @override
  $RemoteConfigAdmobIdCopyWith<$Res> get admobAppId;
  @override
  $RemoteConfigAdmobIdCopyWith<$Res> get admobQuickStartRewardId;
}

/// @nodoc
class __$RemoteConfigCopyWithImpl<$Res>
    implements _$RemoteConfigCopyWith<$Res> {
  __$RemoteConfigCopyWithImpl(this._self, this._then);

  final _RemoteConfig _self;
  final $Res Function(_RemoteConfig) _then;

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? aosAppId = null,
    Object? iosAppId = null,
    Object? privacyPolicyUrl = null,
    Object? termsOfServiceUrl = null,
    Object? noticeUrl = null,
    Object? suggestKeywordsUrl = null,
    Object? baseUrl = null,
    Object? baseSocketUrl = null,
    Object? inviteUrl = null,
    Object? instagramUrl = null,
    Object? discordUrl = null,
    Object? maxDrawingPoints = null,
    Object? drawingThrottleMs = null,
    Object? reactionThrottleMs = null,
    Object? maxGuessLength = null,
    Object? drawOptimizeEpsilion = null,
    Object? isReactionDisabled = null,
    Object? bgmUrl = null,
    Object? gameBgmUrl = null,
    Object? isBgmDisabled = null,
    Object? isGameBgmDisabled = null,
    Object? bgmLicenseUrl = null,
    Object? minBuildNumber = null,
    Object? updateDialogData = null,
    Object? contactUsEmail = null,
    Object? noticeDialogData = freezed,
    Object? maintenanceDialogData = freezed,
    Object? admobAppId = null,
    Object? admobQuickStartRewardId = null,
    Object? disableQuickStartNoti = null,
    Object? devUuidList = null,
  }) {
    return _then(_RemoteConfig(
      aosAppId: null == aosAppId
          ? _self.aosAppId
          : aosAppId // ignore: cast_nullable_to_non_nullable
              as String,
      iosAppId: null == iosAppId
          ? _self.iosAppId
          : iosAppId // ignore: cast_nullable_to_non_nullable
              as String,
      privacyPolicyUrl: null == privacyPolicyUrl
          ? _self.privacyPolicyUrl
          : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
      termsOfServiceUrl: null == termsOfServiceUrl
          ? _self.termsOfServiceUrl
          : termsOfServiceUrl // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
      noticeUrl: null == noticeUrl
          ? _self.noticeUrl
          : noticeUrl // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
      suggestKeywordsUrl: null == suggestKeywordsUrl
          ? _self.suggestKeywordsUrl
          : suggestKeywordsUrl // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
      baseUrl: null == baseUrl
          ? _self.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      baseSocketUrl: null == baseSocketUrl
          ? _self.baseSocketUrl
          : baseSocketUrl // ignore: cast_nullable_to_non_nullable
              as String,
      inviteUrl: null == inviteUrl
          ? _self.inviteUrl
          : inviteUrl // ignore: cast_nullable_to_non_nullable
              as String,
      instagramUrl: null == instagramUrl
          ? _self.instagramUrl
          : instagramUrl // ignore: cast_nullable_to_non_nullable
              as String,
      discordUrl: null == discordUrl
          ? _self.discordUrl
          : discordUrl // ignore: cast_nullable_to_non_nullable
              as String,
      maxDrawingPoints: null == maxDrawingPoints
          ? _self.maxDrawingPoints
          : maxDrawingPoints // ignore: cast_nullable_to_non_nullable
              as int,
      drawingThrottleMs: null == drawingThrottleMs
          ? _self.drawingThrottleMs
          : drawingThrottleMs // ignore: cast_nullable_to_non_nullable
              as int,
      reactionThrottleMs: null == reactionThrottleMs
          ? _self.reactionThrottleMs
          : reactionThrottleMs // ignore: cast_nullable_to_non_nullable
              as int,
      maxGuessLength: null == maxGuessLength
          ? _self.maxGuessLength
          : maxGuessLength // ignore: cast_nullable_to_non_nullable
              as int,
      drawOptimizeEpsilion: null == drawOptimizeEpsilion
          ? _self.drawOptimizeEpsilion
          : drawOptimizeEpsilion // ignore: cast_nullable_to_non_nullable
              as double,
      isReactionDisabled: null == isReactionDisabled
          ? _self.isReactionDisabled
          : isReactionDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      bgmUrl: null == bgmUrl
          ? _self.bgmUrl
          : bgmUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gameBgmUrl: null == gameBgmUrl
          ? _self.gameBgmUrl
          : gameBgmUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isBgmDisabled: null == isBgmDisabled
          ? _self.isBgmDisabled
          : isBgmDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isGameBgmDisabled: null == isGameBgmDisabled
          ? _self.isGameBgmDisabled
          : isGameBgmDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      bgmLicenseUrl: null == bgmLicenseUrl
          ? _self.bgmLicenseUrl
          : bgmLicenseUrl // ignore: cast_nullable_to_non_nullable
              as RemoteConfigLang,
      minBuildNumber: null == minBuildNumber
          ? _self.minBuildNumber
          : minBuildNumber // ignore: cast_nullable_to_non_nullable
              as RemoteConfigMinBuildNumber,
      updateDialogData: null == updateDialogData
          ? _self.updateDialogData
          : updateDialogData // ignore: cast_nullable_to_non_nullable
              as RemoteConfigUpdateDialogData,
      contactUsEmail: null == contactUsEmail
          ? _self.contactUsEmail
          : contactUsEmail // ignore: cast_nullable_to_non_nullable
              as String,
      noticeDialogData: freezed == noticeDialogData
          ? _self.noticeDialogData
          : noticeDialogData // ignore: cast_nullable_to_non_nullable
              as RemoteConfigNoticeDialogData?,
      maintenanceDialogData: freezed == maintenanceDialogData
          ? _self.maintenanceDialogData
          : maintenanceDialogData // ignore: cast_nullable_to_non_nullable
              as RemoteConfigMaintenanceDialogData?,
      admobAppId: null == admobAppId
          ? _self.admobAppId
          : admobAppId // ignore: cast_nullable_to_non_nullable
              as RemoteConfigAdmobId,
      admobQuickStartRewardId: null == admobQuickStartRewardId
          ? _self.admobQuickStartRewardId
          : admobQuickStartRewardId // ignore: cast_nullable_to_non_nullable
              as RemoteConfigAdmobId,
      disableQuickStartNoti: null == disableQuickStartNoti
          ? _self.disableQuickStartNoti
          : disableQuickStartNoti // ignore: cast_nullable_to_non_nullable
              as bool,
      devUuidList: null == devUuidList
          ? _self._devUuidList
          : devUuidList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get privacyPolicyUrl {
    return $RemoteConfigLangCopyWith<$Res>(_self.privacyPolicyUrl, (value) {
      return _then(_self.copyWith(privacyPolicyUrl: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get termsOfServiceUrl {
    return $RemoteConfigLangCopyWith<$Res>(_self.termsOfServiceUrl, (value) {
      return _then(_self.copyWith(termsOfServiceUrl: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get noticeUrl {
    return $RemoteConfigLangCopyWith<$Res>(_self.noticeUrl, (value) {
      return _then(_self.copyWith(noticeUrl: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get suggestKeywordsUrl {
    return $RemoteConfigLangCopyWith<$Res>(_self.suggestKeywordsUrl, (value) {
      return _then(_self.copyWith(suggestKeywordsUrl: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigLangCopyWith<$Res> get bgmLicenseUrl {
    return $RemoteConfigLangCopyWith<$Res>(_self.bgmLicenseUrl, (value) {
      return _then(_self.copyWith(bgmLicenseUrl: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigMinBuildNumberCopyWith<$Res> get minBuildNumber {
    return $RemoteConfigMinBuildNumberCopyWith<$Res>(_self.minBuildNumber,
        (value) {
      return _then(_self.copyWith(minBuildNumber: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigUpdateDialogDataCopyWith<$Res> get updateDialogData {
    return $RemoteConfigUpdateDialogDataCopyWith<$Res>(_self.updateDialogData,
        (value) {
      return _then(_self.copyWith(updateDialogData: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigNoticeDialogDataCopyWith<$Res>? get noticeDialogData {
    if (_self.noticeDialogData == null) {
      return null;
    }

    return $RemoteConfigNoticeDialogDataCopyWith<$Res>(_self.noticeDialogData!,
        (value) {
      return _then(_self.copyWith(noticeDialogData: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigMaintenanceDialogDataCopyWith<$Res>? get maintenanceDialogData {
    if (_self.maintenanceDialogData == null) {
      return null;
    }

    return $RemoteConfigMaintenanceDialogDataCopyWith<$Res>(
        _self.maintenanceDialogData!, (value) {
      return _then(_self.copyWith(maintenanceDialogData: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigAdmobIdCopyWith<$Res> get admobAppId {
    return $RemoteConfigAdmobIdCopyWith<$Res>(_self.admobAppId, (value) {
      return _then(_self.copyWith(admobAppId: value));
    });
  }

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemoteConfigAdmobIdCopyWith<$Res> get admobQuickStartRewardId {
    return $RemoteConfigAdmobIdCopyWith<$Res>(_self.admobQuickStartRewardId,
        (value) {
      return _then(_self.copyWith(admobQuickStartRewardId: value));
    });
  }
}

// dart format on
