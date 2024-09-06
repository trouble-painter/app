// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Config _$ConfigFromJson(Map<String, dynamic> json) {
  return _Config.fromJson(json);
}

/// @nodoc
mixin _$Config {
  String get uuid => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get geminiApiKey => throw _privateConstructorUsedError;
  String get geminiModel => throw _privateConstructorUsedError;
  String get geminiHintPrompt => throw _privateConstructorUsedError;
  String get bgmUrl => throw _privateConstructorUsedError;
  String get gameBgmUrl => throw _privateConstructorUsedError;
  String get contactUsEmail => throw _privateConstructorUsedError;
  Uri get bgmLicenseUrl => throw _privateConstructorUsedError;
  Uri get baseUrl => throw _privateConstructorUsedError;
  Uri get baseSocketUrl => throw _privateConstructorUsedError;
  Uri get errorWebHookUrl => throw _privateConstructorUsedError;
  Uri get quickStartWebHookUrl => throw _privateConstructorUsedError;
  Uri get inviteUrl => throw _privateConstructorUsedError;
  Uri get instagramUrl => throw _privateConstructorUsedError;
  Uri get discordUrl => throw _privateConstructorUsedError;
  Uri get noticeUrl => throw _privateConstructorUsedError;
  Uri get suggestKeywordsUrl => throw _privateConstructorUsedError;
  List<String> get devUuidList => throw _privateConstructorUsedError;
  bool get isUiTestMode => throw _privateConstructorUsedError;
  bool get isFirstRun => throw _privateConstructorUsedError;
  bool get isLightTheme => throw _privateConstructorUsedError;
  bool get isGeminiHint => throw _privateConstructorUsedError;
  bool get isBgmDisabled => throw _privateConstructorUsedError;
  bool get isBgmMute => throw _privateConstructorUsedError;
  bool get isGameBgmDisabled => throw _privateConstructorUsedError;
  bool get isQuickStartWebHook => throw _privateConstructorUsedError;
  Language get language => throw _privateConstructorUsedError;
  AppId get appId => throw _privateConstructorUsedError;
  AppInfo get appInfo => throw _privateConstructorUsedError;
  Uri get termsOfServiceUrl => throw _privateConstructorUsedError;
  Uri get privacyPolicyUrl => throw _privateConstructorUsedError;
  int get drawingThrottleMs => throw _privateConstructorUsedError;
  int get maxDrawingPoints => throw _privateConstructorUsedError;
  int get maxGuessLength => throw _privateConstructorUsedError;
  int get minBuildNumber => throw _privateConstructorUsedError;
  int get quickStartWebHookWaitingSec => throw _privateConstructorUsedError;
  int get waitingBgSocketTimeOut => throw _privateConstructorUsedError;
  int get playingBgSocketTimeOut => throw _privateConstructorUsedError;
  double get drawOptimizeEpsilion => throw _privateConstructorUsedError;
  UpdateDialogData get updateDialogData => throw _privateConstructorUsedError;
  Admob get admob => throw _privateConstructorUsedError;
  NoticeDialogData? get noticeDialogData => throw _privateConstructorUsedError;
  NoticeDialogHistory? get noticeDialogHistory =>
      throw _privateConstructorUsedError;
  MaintenanceDialogData? get maintenanceDialogData =>
      throw _privateConstructorUsedError;
  @TimeSerializer()
  DateTime get installedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigCopyWith<Config> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigCopyWith<$Res> {
  factory $ConfigCopyWith(Config value, $Res Function(Config) then) =
      _$ConfigCopyWithImpl<$Res, Config>;
  @useResult
  $Res call(
      {String uuid,
      String nickname,
      String geminiApiKey,
      String geminiModel,
      String geminiHintPrompt,
      String bgmUrl,
      String gameBgmUrl,
      String contactUsEmail,
      Uri bgmLicenseUrl,
      Uri baseUrl,
      Uri baseSocketUrl,
      Uri errorWebHookUrl,
      Uri quickStartWebHookUrl,
      Uri inviteUrl,
      Uri instagramUrl,
      Uri discordUrl,
      Uri noticeUrl,
      Uri suggestKeywordsUrl,
      List<String> devUuidList,
      bool isUiTestMode,
      bool isFirstRun,
      bool isLightTheme,
      bool isGeminiHint,
      bool isBgmDisabled,
      bool isBgmMute,
      bool isGameBgmDisabled,
      bool isQuickStartWebHook,
      Language language,
      AppId appId,
      AppInfo appInfo,
      Uri termsOfServiceUrl,
      Uri privacyPolicyUrl,
      int drawingThrottleMs,
      int maxDrawingPoints,
      int maxGuessLength,
      int minBuildNumber,
      int quickStartWebHookWaitingSec,
      int waitingBgSocketTimeOut,
      int playingBgSocketTimeOut,
      double drawOptimizeEpsilion,
      UpdateDialogData updateDialogData,
      Admob admob,
      NoticeDialogData? noticeDialogData,
      NoticeDialogHistory? noticeDialogHistory,
      MaintenanceDialogData? maintenanceDialogData,
      @TimeSerializer() DateTime installedAt});

  $AppIdCopyWith<$Res> get appId;
  $AppInfoCopyWith<$Res> get appInfo;
  $UpdateDialogDataCopyWith<$Res> get updateDialogData;
  $AdmobCopyWith<$Res> get admob;
  $NoticeDialogDataCopyWith<$Res>? get noticeDialogData;
  $NoticeDialogHistoryCopyWith<$Res>? get noticeDialogHistory;
  $MaintenanceDialogDataCopyWith<$Res>? get maintenanceDialogData;
}

/// @nodoc
class _$ConfigCopyWithImpl<$Res, $Val extends Config>
    implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? nickname = null,
    Object? geminiApiKey = null,
    Object? geminiModel = null,
    Object? geminiHintPrompt = null,
    Object? bgmUrl = null,
    Object? gameBgmUrl = null,
    Object? contactUsEmail = null,
    Object? bgmLicenseUrl = null,
    Object? baseUrl = null,
    Object? baseSocketUrl = null,
    Object? errorWebHookUrl = null,
    Object? quickStartWebHookUrl = null,
    Object? inviteUrl = null,
    Object? instagramUrl = null,
    Object? discordUrl = null,
    Object? noticeUrl = null,
    Object? suggestKeywordsUrl = null,
    Object? devUuidList = null,
    Object? isUiTestMode = null,
    Object? isFirstRun = null,
    Object? isLightTheme = null,
    Object? isGeminiHint = null,
    Object? isBgmDisabled = null,
    Object? isBgmMute = null,
    Object? isGameBgmDisabled = null,
    Object? isQuickStartWebHook = null,
    Object? language = null,
    Object? appId = null,
    Object? appInfo = null,
    Object? termsOfServiceUrl = null,
    Object? privacyPolicyUrl = null,
    Object? drawingThrottleMs = null,
    Object? maxDrawingPoints = null,
    Object? maxGuessLength = null,
    Object? minBuildNumber = null,
    Object? quickStartWebHookWaitingSec = null,
    Object? waitingBgSocketTimeOut = null,
    Object? playingBgSocketTimeOut = null,
    Object? drawOptimizeEpsilion = null,
    Object? updateDialogData = null,
    Object? admob = null,
    Object? noticeDialogData = freezed,
    Object? noticeDialogHistory = freezed,
    Object? maintenanceDialogData = freezed,
    Object? installedAt = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      geminiApiKey: null == geminiApiKey
          ? _value.geminiApiKey
          : geminiApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      geminiModel: null == geminiModel
          ? _value.geminiModel
          : geminiModel // ignore: cast_nullable_to_non_nullable
              as String,
      geminiHintPrompt: null == geminiHintPrompt
          ? _value.geminiHintPrompt
          : geminiHintPrompt // ignore: cast_nullable_to_non_nullable
              as String,
      bgmUrl: null == bgmUrl
          ? _value.bgmUrl
          : bgmUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gameBgmUrl: null == gameBgmUrl
          ? _value.gameBgmUrl
          : gameBgmUrl // ignore: cast_nullable_to_non_nullable
              as String,
      contactUsEmail: null == contactUsEmail
          ? _value.contactUsEmail
          : contactUsEmail // ignore: cast_nullable_to_non_nullable
              as String,
      bgmLicenseUrl: null == bgmLicenseUrl
          ? _value.bgmLicenseUrl
          : bgmLicenseUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      baseSocketUrl: null == baseSocketUrl
          ? _value.baseSocketUrl
          : baseSocketUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      errorWebHookUrl: null == errorWebHookUrl
          ? _value.errorWebHookUrl
          : errorWebHookUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      quickStartWebHookUrl: null == quickStartWebHookUrl
          ? _value.quickStartWebHookUrl
          : quickStartWebHookUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      inviteUrl: null == inviteUrl
          ? _value.inviteUrl
          : inviteUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      instagramUrl: null == instagramUrl
          ? _value.instagramUrl
          : instagramUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      discordUrl: null == discordUrl
          ? _value.discordUrl
          : discordUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      noticeUrl: null == noticeUrl
          ? _value.noticeUrl
          : noticeUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      suggestKeywordsUrl: null == suggestKeywordsUrl
          ? _value.suggestKeywordsUrl
          : suggestKeywordsUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      devUuidList: null == devUuidList
          ? _value.devUuidList
          : devUuidList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isUiTestMode: null == isUiTestMode
          ? _value.isUiTestMode
          : isUiTestMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstRun: null == isFirstRun
          ? _value.isFirstRun
          : isFirstRun // ignore: cast_nullable_to_non_nullable
              as bool,
      isLightTheme: null == isLightTheme
          ? _value.isLightTheme
          : isLightTheme // ignore: cast_nullable_to_non_nullable
              as bool,
      isGeminiHint: null == isGeminiHint
          ? _value.isGeminiHint
          : isGeminiHint // ignore: cast_nullable_to_non_nullable
              as bool,
      isBgmDisabled: null == isBgmDisabled
          ? _value.isBgmDisabled
          : isBgmDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isBgmMute: null == isBgmMute
          ? _value.isBgmMute
          : isBgmMute // ignore: cast_nullable_to_non_nullable
              as bool,
      isGameBgmDisabled: null == isGameBgmDisabled
          ? _value.isGameBgmDisabled
          : isGameBgmDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isQuickStartWebHook: null == isQuickStartWebHook
          ? _value.isQuickStartWebHook
          : isQuickStartWebHook // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as AppId,
      appInfo: null == appInfo
          ? _value.appInfo
          : appInfo // ignore: cast_nullable_to_non_nullable
              as AppInfo,
      termsOfServiceUrl: null == termsOfServiceUrl
          ? _value.termsOfServiceUrl
          : termsOfServiceUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      privacyPolicyUrl: null == privacyPolicyUrl
          ? _value.privacyPolicyUrl
          : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      drawingThrottleMs: null == drawingThrottleMs
          ? _value.drawingThrottleMs
          : drawingThrottleMs // ignore: cast_nullable_to_non_nullable
              as int,
      maxDrawingPoints: null == maxDrawingPoints
          ? _value.maxDrawingPoints
          : maxDrawingPoints // ignore: cast_nullable_to_non_nullable
              as int,
      maxGuessLength: null == maxGuessLength
          ? _value.maxGuessLength
          : maxGuessLength // ignore: cast_nullable_to_non_nullable
              as int,
      minBuildNumber: null == minBuildNumber
          ? _value.minBuildNumber
          : minBuildNumber // ignore: cast_nullable_to_non_nullable
              as int,
      quickStartWebHookWaitingSec: null == quickStartWebHookWaitingSec
          ? _value.quickStartWebHookWaitingSec
          : quickStartWebHookWaitingSec // ignore: cast_nullable_to_non_nullable
              as int,
      waitingBgSocketTimeOut: null == waitingBgSocketTimeOut
          ? _value.waitingBgSocketTimeOut
          : waitingBgSocketTimeOut // ignore: cast_nullable_to_non_nullable
              as int,
      playingBgSocketTimeOut: null == playingBgSocketTimeOut
          ? _value.playingBgSocketTimeOut
          : playingBgSocketTimeOut // ignore: cast_nullable_to_non_nullable
              as int,
      drawOptimizeEpsilion: null == drawOptimizeEpsilion
          ? _value.drawOptimizeEpsilion
          : drawOptimizeEpsilion // ignore: cast_nullable_to_non_nullable
              as double,
      updateDialogData: null == updateDialogData
          ? _value.updateDialogData
          : updateDialogData // ignore: cast_nullable_to_non_nullable
              as UpdateDialogData,
      admob: null == admob
          ? _value.admob
          : admob // ignore: cast_nullable_to_non_nullable
              as Admob,
      noticeDialogData: freezed == noticeDialogData
          ? _value.noticeDialogData
          : noticeDialogData // ignore: cast_nullable_to_non_nullable
              as NoticeDialogData?,
      noticeDialogHistory: freezed == noticeDialogHistory
          ? _value.noticeDialogHistory
          : noticeDialogHistory // ignore: cast_nullable_to_non_nullable
              as NoticeDialogHistory?,
      maintenanceDialogData: freezed == maintenanceDialogData
          ? _value.maintenanceDialogData
          : maintenanceDialogData // ignore: cast_nullable_to_non_nullable
              as MaintenanceDialogData?,
      installedAt: null == installedAt
          ? _value.installedAt
          : installedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppIdCopyWith<$Res> get appId {
    return $AppIdCopyWith<$Res>(_value.appId, (value) {
      return _then(_value.copyWith(appId: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppInfoCopyWith<$Res> get appInfo {
    return $AppInfoCopyWith<$Res>(_value.appInfo, (value) {
      return _then(_value.copyWith(appInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UpdateDialogDataCopyWith<$Res> get updateDialogData {
    return $UpdateDialogDataCopyWith<$Res>(_value.updateDialogData, (value) {
      return _then(_value.copyWith(updateDialogData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AdmobCopyWith<$Res> get admob {
    return $AdmobCopyWith<$Res>(_value.admob, (value) {
      return _then(_value.copyWith(admob: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NoticeDialogDataCopyWith<$Res>? get noticeDialogData {
    if (_value.noticeDialogData == null) {
      return null;
    }

    return $NoticeDialogDataCopyWith<$Res>(_value.noticeDialogData!, (value) {
      return _then(_value.copyWith(noticeDialogData: value) as $Val);
    });
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

  @override
  @pragma('vm:prefer-inline')
  $MaintenanceDialogDataCopyWith<$Res>? get maintenanceDialogData {
    if (_value.maintenanceDialogData == null) {
      return null;
    }

    return $MaintenanceDialogDataCopyWith<$Res>(_value.maintenanceDialogData!,
        (value) {
      return _then(_value.copyWith(maintenanceDialogData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConfigImplCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$$ConfigImplCopyWith(
          _$ConfigImpl value, $Res Function(_$ConfigImpl) then) =
      __$$ConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String nickname,
      String geminiApiKey,
      String geminiModel,
      String geminiHintPrompt,
      String bgmUrl,
      String gameBgmUrl,
      String contactUsEmail,
      Uri bgmLicenseUrl,
      Uri baseUrl,
      Uri baseSocketUrl,
      Uri errorWebHookUrl,
      Uri quickStartWebHookUrl,
      Uri inviteUrl,
      Uri instagramUrl,
      Uri discordUrl,
      Uri noticeUrl,
      Uri suggestKeywordsUrl,
      List<String> devUuidList,
      bool isUiTestMode,
      bool isFirstRun,
      bool isLightTheme,
      bool isGeminiHint,
      bool isBgmDisabled,
      bool isBgmMute,
      bool isGameBgmDisabled,
      bool isQuickStartWebHook,
      Language language,
      AppId appId,
      AppInfo appInfo,
      Uri termsOfServiceUrl,
      Uri privacyPolicyUrl,
      int drawingThrottleMs,
      int maxDrawingPoints,
      int maxGuessLength,
      int minBuildNumber,
      int quickStartWebHookWaitingSec,
      int waitingBgSocketTimeOut,
      int playingBgSocketTimeOut,
      double drawOptimizeEpsilion,
      UpdateDialogData updateDialogData,
      Admob admob,
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
  $NoticeDialogDataCopyWith<$Res>? get noticeDialogData;
  @override
  $NoticeDialogHistoryCopyWith<$Res>? get noticeDialogHistory;
  @override
  $MaintenanceDialogDataCopyWith<$Res>? get maintenanceDialogData;
}

/// @nodoc
class __$$ConfigImplCopyWithImpl<$Res>
    extends _$ConfigCopyWithImpl<$Res, _$ConfigImpl>
    implements _$$ConfigImplCopyWith<$Res> {
  __$$ConfigImplCopyWithImpl(
      _$ConfigImpl _value, $Res Function(_$ConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? nickname = null,
    Object? geminiApiKey = null,
    Object? geminiModel = null,
    Object? geminiHintPrompt = null,
    Object? bgmUrl = null,
    Object? gameBgmUrl = null,
    Object? contactUsEmail = null,
    Object? bgmLicenseUrl = null,
    Object? baseUrl = null,
    Object? baseSocketUrl = null,
    Object? errorWebHookUrl = null,
    Object? quickStartWebHookUrl = null,
    Object? inviteUrl = null,
    Object? instagramUrl = null,
    Object? discordUrl = null,
    Object? noticeUrl = null,
    Object? suggestKeywordsUrl = null,
    Object? devUuidList = null,
    Object? isUiTestMode = null,
    Object? isFirstRun = null,
    Object? isLightTheme = null,
    Object? isGeminiHint = null,
    Object? isBgmDisabled = null,
    Object? isBgmMute = null,
    Object? isGameBgmDisabled = null,
    Object? isQuickStartWebHook = null,
    Object? language = null,
    Object? appId = null,
    Object? appInfo = null,
    Object? termsOfServiceUrl = null,
    Object? privacyPolicyUrl = null,
    Object? drawingThrottleMs = null,
    Object? maxDrawingPoints = null,
    Object? maxGuessLength = null,
    Object? minBuildNumber = null,
    Object? quickStartWebHookWaitingSec = null,
    Object? waitingBgSocketTimeOut = null,
    Object? playingBgSocketTimeOut = null,
    Object? drawOptimizeEpsilion = null,
    Object? updateDialogData = null,
    Object? admob = null,
    Object? noticeDialogData = freezed,
    Object? noticeDialogHistory = freezed,
    Object? maintenanceDialogData = freezed,
    Object? installedAt = null,
  }) {
    return _then(_$ConfigImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      geminiApiKey: null == geminiApiKey
          ? _value.geminiApiKey
          : geminiApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      geminiModel: null == geminiModel
          ? _value.geminiModel
          : geminiModel // ignore: cast_nullable_to_non_nullable
              as String,
      geminiHintPrompt: null == geminiHintPrompt
          ? _value.geminiHintPrompt
          : geminiHintPrompt // ignore: cast_nullable_to_non_nullable
              as String,
      bgmUrl: null == bgmUrl
          ? _value.bgmUrl
          : bgmUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gameBgmUrl: null == gameBgmUrl
          ? _value.gameBgmUrl
          : gameBgmUrl // ignore: cast_nullable_to_non_nullable
              as String,
      contactUsEmail: null == contactUsEmail
          ? _value.contactUsEmail
          : contactUsEmail // ignore: cast_nullable_to_non_nullable
              as String,
      bgmLicenseUrl: null == bgmLicenseUrl
          ? _value.bgmLicenseUrl
          : bgmLicenseUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      baseSocketUrl: null == baseSocketUrl
          ? _value.baseSocketUrl
          : baseSocketUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      errorWebHookUrl: null == errorWebHookUrl
          ? _value.errorWebHookUrl
          : errorWebHookUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      quickStartWebHookUrl: null == quickStartWebHookUrl
          ? _value.quickStartWebHookUrl
          : quickStartWebHookUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      inviteUrl: null == inviteUrl
          ? _value.inviteUrl
          : inviteUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      instagramUrl: null == instagramUrl
          ? _value.instagramUrl
          : instagramUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      discordUrl: null == discordUrl
          ? _value.discordUrl
          : discordUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      noticeUrl: null == noticeUrl
          ? _value.noticeUrl
          : noticeUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      suggestKeywordsUrl: null == suggestKeywordsUrl
          ? _value.suggestKeywordsUrl
          : suggestKeywordsUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      devUuidList: null == devUuidList
          ? _value._devUuidList
          : devUuidList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isUiTestMode: null == isUiTestMode
          ? _value.isUiTestMode
          : isUiTestMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstRun: null == isFirstRun
          ? _value.isFirstRun
          : isFirstRun // ignore: cast_nullable_to_non_nullable
              as bool,
      isLightTheme: null == isLightTheme
          ? _value.isLightTheme
          : isLightTheme // ignore: cast_nullable_to_non_nullable
              as bool,
      isGeminiHint: null == isGeminiHint
          ? _value.isGeminiHint
          : isGeminiHint // ignore: cast_nullable_to_non_nullable
              as bool,
      isBgmDisabled: null == isBgmDisabled
          ? _value.isBgmDisabled
          : isBgmDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isBgmMute: null == isBgmMute
          ? _value.isBgmMute
          : isBgmMute // ignore: cast_nullable_to_non_nullable
              as bool,
      isGameBgmDisabled: null == isGameBgmDisabled
          ? _value.isGameBgmDisabled
          : isGameBgmDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isQuickStartWebHook: null == isQuickStartWebHook
          ? _value.isQuickStartWebHook
          : isQuickStartWebHook // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as AppId,
      appInfo: null == appInfo
          ? _value.appInfo
          : appInfo // ignore: cast_nullable_to_non_nullable
              as AppInfo,
      termsOfServiceUrl: null == termsOfServiceUrl
          ? _value.termsOfServiceUrl
          : termsOfServiceUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      privacyPolicyUrl: null == privacyPolicyUrl
          ? _value.privacyPolicyUrl
          : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      drawingThrottleMs: null == drawingThrottleMs
          ? _value.drawingThrottleMs
          : drawingThrottleMs // ignore: cast_nullable_to_non_nullable
              as int,
      maxDrawingPoints: null == maxDrawingPoints
          ? _value.maxDrawingPoints
          : maxDrawingPoints // ignore: cast_nullable_to_non_nullable
              as int,
      maxGuessLength: null == maxGuessLength
          ? _value.maxGuessLength
          : maxGuessLength // ignore: cast_nullable_to_non_nullable
              as int,
      minBuildNumber: null == minBuildNumber
          ? _value.minBuildNumber
          : minBuildNumber // ignore: cast_nullable_to_non_nullable
              as int,
      quickStartWebHookWaitingSec: null == quickStartWebHookWaitingSec
          ? _value.quickStartWebHookWaitingSec
          : quickStartWebHookWaitingSec // ignore: cast_nullable_to_non_nullable
              as int,
      waitingBgSocketTimeOut: null == waitingBgSocketTimeOut
          ? _value.waitingBgSocketTimeOut
          : waitingBgSocketTimeOut // ignore: cast_nullable_to_non_nullable
              as int,
      playingBgSocketTimeOut: null == playingBgSocketTimeOut
          ? _value.playingBgSocketTimeOut
          : playingBgSocketTimeOut // ignore: cast_nullable_to_non_nullable
              as int,
      drawOptimizeEpsilion: null == drawOptimizeEpsilion
          ? _value.drawOptimizeEpsilion
          : drawOptimizeEpsilion // ignore: cast_nullable_to_non_nullable
              as double,
      updateDialogData: null == updateDialogData
          ? _value.updateDialogData
          : updateDialogData // ignore: cast_nullable_to_non_nullable
              as UpdateDialogData,
      admob: null == admob
          ? _value.admob
          : admob // ignore: cast_nullable_to_non_nullable
              as Admob,
      noticeDialogData: freezed == noticeDialogData
          ? _value.noticeDialogData
          : noticeDialogData // ignore: cast_nullable_to_non_nullable
              as NoticeDialogData?,
      noticeDialogHistory: freezed == noticeDialogHistory
          ? _value.noticeDialogHistory
          : noticeDialogHistory // ignore: cast_nullable_to_non_nullable
              as NoticeDialogHistory?,
      maintenanceDialogData: freezed == maintenanceDialogData
          ? _value.maintenanceDialogData
          : maintenanceDialogData // ignore: cast_nullable_to_non_nullable
              as MaintenanceDialogData?,
      installedAt: null == installedAt
          ? _value.installedAt
          : installedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfigImpl extends _Config with DiagnosticableTreeMixin {
  _$ConfigImpl(
      {required this.uuid,
      required this.nickname,
      required this.geminiApiKey,
      required this.geminiModel,
      required this.geminiHintPrompt,
      required this.bgmUrl,
      required this.gameBgmUrl,
      required this.contactUsEmail,
      required this.bgmLicenseUrl,
      required this.baseUrl,
      required this.baseSocketUrl,
      required this.errorWebHookUrl,
      required this.quickStartWebHookUrl,
      required this.inviteUrl,
      required this.instagramUrl,
      required this.discordUrl,
      required this.noticeUrl,
      required this.suggestKeywordsUrl,
      required final List<String> devUuidList,
      required this.isUiTestMode,
      required this.isFirstRun,
      required this.isLightTheme,
      required this.isGeminiHint,
      required this.isBgmDisabled,
      required this.isBgmMute,
      required this.isGameBgmDisabled,
      required this.isQuickStartWebHook,
      required this.language,
      required this.appId,
      required this.appInfo,
      required this.termsOfServiceUrl,
      required this.privacyPolicyUrl,
      required this.drawingThrottleMs,
      required this.maxDrawingPoints,
      required this.maxGuessLength,
      required this.minBuildNumber,
      required this.quickStartWebHookWaitingSec,
      required this.waitingBgSocketTimeOut,
      required this.playingBgSocketTimeOut,
      required this.drawOptimizeEpsilion,
      required this.updateDialogData,
      required this.admob,
      this.noticeDialogData,
      this.noticeDialogHistory,
      this.maintenanceDialogData,
      @TimeSerializer() required this.installedAt})
      : _devUuidList = devUuidList,
        super._();

  factory _$ConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfigImplFromJson(json);

  @override
  final String uuid;
  @override
  final String nickname;
  @override
  final String geminiApiKey;
  @override
  final String geminiModel;
  @override
  final String geminiHintPrompt;
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
  final Uri errorWebHookUrl;
  @override
  final Uri quickStartWebHookUrl;
  @override
  final Uri inviteUrl;
  @override
  final Uri instagramUrl;
  @override
  final Uri discordUrl;
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
  final bool isFirstRun;
  @override
  final bool isLightTheme;
  @override
  final bool isGeminiHint;
  @override
  final bool isBgmDisabled;
  @override
  final bool isBgmMute;
  @override
  final bool isGameBgmDisabled;
  @override
  final bool isQuickStartWebHook;
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
  final int drawingThrottleMs;
  @override
  final int maxDrawingPoints;
  @override
  final int maxGuessLength;
  @override
  final int minBuildNumber;
  @override
  final int quickStartWebHookWaitingSec;
  @override
  final int waitingBgSocketTimeOut;
  @override
  final int playingBgSocketTimeOut;
  @override
  final double drawOptimizeEpsilion;
  @override
  final UpdateDialogData updateDialogData;
  @override
  final Admob admob;
  @override
  final NoticeDialogData? noticeDialogData;
  @override
  final NoticeDialogHistory? noticeDialogHistory;
  @override
  final MaintenanceDialogData? maintenanceDialogData;
  @override
  @TimeSerializer()
  final DateTime installedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Config(uuid: $uuid, nickname: $nickname, geminiApiKey: $geminiApiKey, geminiModel: $geminiModel, geminiHintPrompt: $geminiHintPrompt, bgmUrl: $bgmUrl, gameBgmUrl: $gameBgmUrl, contactUsEmail: $contactUsEmail, bgmLicenseUrl: $bgmLicenseUrl, baseUrl: $baseUrl, baseSocketUrl: $baseSocketUrl, errorWebHookUrl: $errorWebHookUrl, quickStartWebHookUrl: $quickStartWebHookUrl, inviteUrl: $inviteUrl, instagramUrl: $instagramUrl, discordUrl: $discordUrl, noticeUrl: $noticeUrl, suggestKeywordsUrl: $suggestKeywordsUrl, devUuidList: $devUuidList, isUiTestMode: $isUiTestMode, isFirstRun: $isFirstRun, isLightTheme: $isLightTheme, isGeminiHint: $isGeminiHint, isBgmDisabled: $isBgmDisabled, isBgmMute: $isBgmMute, isGameBgmDisabled: $isGameBgmDisabled, isQuickStartWebHook: $isQuickStartWebHook, language: $language, appId: $appId, appInfo: $appInfo, termsOfServiceUrl: $termsOfServiceUrl, privacyPolicyUrl: $privacyPolicyUrl, drawingThrottleMs: $drawingThrottleMs, maxDrawingPoints: $maxDrawingPoints, maxGuessLength: $maxGuessLength, minBuildNumber: $minBuildNumber, quickStartWebHookWaitingSec: $quickStartWebHookWaitingSec, waitingBgSocketTimeOut: $waitingBgSocketTimeOut, playingBgSocketTimeOut: $playingBgSocketTimeOut, drawOptimizeEpsilion: $drawOptimizeEpsilion, updateDialogData: $updateDialogData, admob: $admob, noticeDialogData: $noticeDialogData, noticeDialogHistory: $noticeDialogHistory, maintenanceDialogData: $maintenanceDialogData, installedAt: $installedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Config'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('nickname', nickname))
      ..add(DiagnosticsProperty('geminiApiKey', geminiApiKey))
      ..add(DiagnosticsProperty('geminiModel', geminiModel))
      ..add(DiagnosticsProperty('geminiHintPrompt', geminiHintPrompt))
      ..add(DiagnosticsProperty('bgmUrl', bgmUrl))
      ..add(DiagnosticsProperty('gameBgmUrl', gameBgmUrl))
      ..add(DiagnosticsProperty('contactUsEmail', contactUsEmail))
      ..add(DiagnosticsProperty('bgmLicenseUrl', bgmLicenseUrl))
      ..add(DiagnosticsProperty('baseUrl', baseUrl))
      ..add(DiagnosticsProperty('baseSocketUrl', baseSocketUrl))
      ..add(DiagnosticsProperty('errorWebHookUrl', errorWebHookUrl))
      ..add(DiagnosticsProperty('quickStartWebHookUrl', quickStartWebHookUrl))
      ..add(DiagnosticsProperty('inviteUrl', inviteUrl))
      ..add(DiagnosticsProperty('instagramUrl', instagramUrl))
      ..add(DiagnosticsProperty('discordUrl', discordUrl))
      ..add(DiagnosticsProperty('noticeUrl', noticeUrl))
      ..add(DiagnosticsProperty('suggestKeywordsUrl', suggestKeywordsUrl))
      ..add(DiagnosticsProperty('devUuidList', devUuidList))
      ..add(DiagnosticsProperty('isUiTestMode', isUiTestMode))
      ..add(DiagnosticsProperty('isFirstRun', isFirstRun))
      ..add(DiagnosticsProperty('isLightTheme', isLightTheme))
      ..add(DiagnosticsProperty('isGeminiHint', isGeminiHint))
      ..add(DiagnosticsProperty('isBgmDisabled', isBgmDisabled))
      ..add(DiagnosticsProperty('isBgmMute', isBgmMute))
      ..add(DiagnosticsProperty('isGameBgmDisabled', isGameBgmDisabled))
      ..add(DiagnosticsProperty('isQuickStartWebHook', isQuickStartWebHook))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('appId', appId))
      ..add(DiagnosticsProperty('appInfo', appInfo))
      ..add(DiagnosticsProperty('termsOfServiceUrl', termsOfServiceUrl))
      ..add(DiagnosticsProperty('privacyPolicyUrl', privacyPolicyUrl))
      ..add(DiagnosticsProperty('drawingThrottleMs', drawingThrottleMs))
      ..add(DiagnosticsProperty('maxDrawingPoints', maxDrawingPoints))
      ..add(DiagnosticsProperty('maxGuessLength', maxGuessLength))
      ..add(DiagnosticsProperty('minBuildNumber', minBuildNumber))
      ..add(DiagnosticsProperty(
          'quickStartWebHookWaitingSec', quickStartWebHookWaitingSec))
      ..add(
          DiagnosticsProperty('waitingBgSocketTimeOut', waitingBgSocketTimeOut))
      ..add(
          DiagnosticsProperty('playingBgSocketTimeOut', playingBgSocketTimeOut))
      ..add(DiagnosticsProperty('drawOptimizeEpsilion', drawOptimizeEpsilion))
      ..add(DiagnosticsProperty('updateDialogData', updateDialogData))
      ..add(DiagnosticsProperty('admob', admob))
      ..add(DiagnosticsProperty('noticeDialogData', noticeDialogData))
      ..add(DiagnosticsProperty('noticeDialogHistory', noticeDialogHistory))
      ..add(DiagnosticsProperty('maintenanceDialogData', maintenanceDialogData))
      ..add(DiagnosticsProperty('installedAt', installedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.geminiApiKey, geminiApiKey) ||
                other.geminiApiKey == geminiApiKey) &&
            (identical(other.geminiModel, geminiModel) ||
                other.geminiModel == geminiModel) &&
            (identical(other.geminiHintPrompt, geminiHintPrompt) ||
                other.geminiHintPrompt == geminiHintPrompt) &&
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
            (identical(other.errorWebHookUrl, errorWebHookUrl) ||
                other.errorWebHookUrl == errorWebHookUrl) &&
            (identical(other.quickStartWebHookUrl, quickStartWebHookUrl) ||
                other.quickStartWebHookUrl == quickStartWebHookUrl) &&
            (identical(other.inviteUrl, inviteUrl) ||
                other.inviteUrl == inviteUrl) &&
            (identical(other.instagramUrl, instagramUrl) ||
                other.instagramUrl == instagramUrl) &&
            (identical(other.discordUrl, discordUrl) ||
                other.discordUrl == discordUrl) &&
            (identical(other.noticeUrl, noticeUrl) ||
                other.noticeUrl == noticeUrl) &&
            (identical(other.suggestKeywordsUrl, suggestKeywordsUrl) ||
                other.suggestKeywordsUrl == suggestKeywordsUrl) &&
            const DeepCollectionEquality()
                .equals(other._devUuidList, _devUuidList) &&
            (identical(other.isUiTestMode, isUiTestMode) ||
                other.isUiTestMode == isUiTestMode) &&
            (identical(other.isFirstRun, isFirstRun) ||
                other.isFirstRun == isFirstRun) &&
            (identical(other.isLightTheme, isLightTheme) ||
                other.isLightTheme == isLightTheme) &&
            (identical(other.isGeminiHint, isGeminiHint) ||
                other.isGeminiHint == isGeminiHint) &&
            (identical(other.isBgmDisabled, isBgmDisabled) ||
                other.isBgmDisabled == isBgmDisabled) &&
            (identical(other.isBgmMute, isBgmMute) ||
                other.isBgmMute == isBgmMute) &&
            (identical(other.isGameBgmDisabled, isGameBgmDisabled) ||
                other.isGameBgmDisabled == isGameBgmDisabled) &&
            (identical(other.isQuickStartWebHook, isQuickStartWebHook) ||
                other.isQuickStartWebHook == isQuickStartWebHook) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.appInfo, appInfo) || other.appInfo == appInfo) &&
            (identical(other.termsOfServiceUrl, termsOfServiceUrl) ||
                other.termsOfServiceUrl == termsOfServiceUrl) &&
            (identical(other.privacyPolicyUrl, privacyPolicyUrl) ||
                other.privacyPolicyUrl == privacyPolicyUrl) &&
            (identical(other.drawingThrottleMs, drawingThrottleMs) ||
                other.drawingThrottleMs == drawingThrottleMs) &&
            (identical(other.maxDrawingPoints, maxDrawingPoints) ||
                other.maxDrawingPoints == maxDrawingPoints) &&
            (identical(other.maxGuessLength, maxGuessLength) ||
                other.maxGuessLength == maxGuessLength) &&
            (identical(other.minBuildNumber, minBuildNumber) ||
                other.minBuildNumber == minBuildNumber) &&
            (identical(other.quickStartWebHookWaitingSec, quickStartWebHookWaitingSec) ||
                other.quickStartWebHookWaitingSec ==
                    quickStartWebHookWaitingSec) &&
            (identical(other.waitingBgSocketTimeOut, waitingBgSocketTimeOut) ||
                other.waitingBgSocketTimeOut == waitingBgSocketTimeOut) &&
            (identical(other.playingBgSocketTimeOut, playingBgSocketTimeOut) ||
                other.playingBgSocketTimeOut == playingBgSocketTimeOut) &&
            (identical(other.drawOptimizeEpsilion, drawOptimizeEpsilion) ||
                other.drawOptimizeEpsilion == drawOptimizeEpsilion) &&
            (identical(other.updateDialogData, updateDialogData) ||
                other.updateDialogData == updateDialogData) &&
            (identical(other.admob, admob) || other.admob == admob) &&
            (identical(other.noticeDialogData, noticeDialogData) ||
                other.noticeDialogData == noticeDialogData) &&
            (identical(other.noticeDialogHistory, noticeDialogHistory) ||
                other.noticeDialogHistory == noticeDialogHistory) &&
            (identical(other.maintenanceDialogData, maintenanceDialogData) ||
                other.maintenanceDialogData == maintenanceDialogData) &&
            (identical(other.installedAt, installedAt) ||
                other.installedAt == installedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uuid,
        nickname,
        geminiApiKey,
        geminiModel,
        geminiHintPrompt,
        bgmUrl,
        gameBgmUrl,
        contactUsEmail,
        bgmLicenseUrl,
        baseUrl,
        baseSocketUrl,
        errorWebHookUrl,
        quickStartWebHookUrl,
        inviteUrl,
        instagramUrl,
        discordUrl,
        noticeUrl,
        suggestKeywordsUrl,
        const DeepCollectionEquality().hash(_devUuidList),
        isUiTestMode,
        isFirstRun,
        isLightTheme,
        isGeminiHint,
        isBgmDisabled,
        isBgmMute,
        isGameBgmDisabled,
        isQuickStartWebHook,
        language,
        appId,
        appInfo,
        termsOfServiceUrl,
        privacyPolicyUrl,
        drawingThrottleMs,
        maxDrawingPoints,
        maxGuessLength,
        minBuildNumber,
        quickStartWebHookWaitingSec,
        waitingBgSocketTimeOut,
        playingBgSocketTimeOut,
        drawOptimizeEpsilion,
        updateDialogData,
        admob,
        noticeDialogData,
        noticeDialogHistory,
        maintenanceDialogData,
        installedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigImplCopyWith<_$ConfigImpl> get copyWith =>
      __$$ConfigImplCopyWithImpl<_$ConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigImplToJson(
      this,
    );
  }
}

abstract class _Config extends Config {
  factory _Config(
      {required final String uuid,
      required final String nickname,
      required final String geminiApiKey,
      required final String geminiModel,
      required final String geminiHintPrompt,
      required final String bgmUrl,
      required final String gameBgmUrl,
      required final String contactUsEmail,
      required final Uri bgmLicenseUrl,
      required final Uri baseUrl,
      required final Uri baseSocketUrl,
      required final Uri errorWebHookUrl,
      required final Uri quickStartWebHookUrl,
      required final Uri inviteUrl,
      required final Uri instagramUrl,
      required final Uri discordUrl,
      required final Uri noticeUrl,
      required final Uri suggestKeywordsUrl,
      required final List<String> devUuidList,
      required final bool isUiTestMode,
      required final bool isFirstRun,
      required final bool isLightTheme,
      required final bool isGeminiHint,
      required final bool isBgmDisabled,
      required final bool isBgmMute,
      required final bool isGameBgmDisabled,
      required final bool isQuickStartWebHook,
      required final Language language,
      required final AppId appId,
      required final AppInfo appInfo,
      required final Uri termsOfServiceUrl,
      required final Uri privacyPolicyUrl,
      required final int drawingThrottleMs,
      required final int maxDrawingPoints,
      required final int maxGuessLength,
      required final int minBuildNumber,
      required final int quickStartWebHookWaitingSec,
      required final int waitingBgSocketTimeOut,
      required final int playingBgSocketTimeOut,
      required final double drawOptimizeEpsilion,
      required final UpdateDialogData updateDialogData,
      required final Admob admob,
      final NoticeDialogData? noticeDialogData,
      final NoticeDialogHistory? noticeDialogHistory,
      final MaintenanceDialogData? maintenanceDialogData,
      @TimeSerializer() required final DateTime installedAt}) = _$ConfigImpl;
  _Config._() : super._();

  factory _Config.fromJson(Map<String, dynamic> json) = _$ConfigImpl.fromJson;

  @override
  String get uuid;
  @override
  String get nickname;
  @override
  String get geminiApiKey;
  @override
  String get geminiModel;
  @override
  String get geminiHintPrompt;
  @override
  String get bgmUrl;
  @override
  String get gameBgmUrl;
  @override
  String get contactUsEmail;
  @override
  Uri get bgmLicenseUrl;
  @override
  Uri get baseUrl;
  @override
  Uri get baseSocketUrl;
  @override
  Uri get errorWebHookUrl;
  @override
  Uri get quickStartWebHookUrl;
  @override
  Uri get inviteUrl;
  @override
  Uri get instagramUrl;
  @override
  Uri get discordUrl;
  @override
  Uri get noticeUrl;
  @override
  Uri get suggestKeywordsUrl;
  @override
  List<String> get devUuidList;
  @override
  bool get isUiTestMode;
  @override
  bool get isFirstRun;
  @override
  bool get isLightTheme;
  @override
  bool get isGeminiHint;
  @override
  bool get isBgmDisabled;
  @override
  bool get isBgmMute;
  @override
  bool get isGameBgmDisabled;
  @override
  bool get isQuickStartWebHook;
  @override
  Language get language;
  @override
  AppId get appId;
  @override
  AppInfo get appInfo;
  @override
  Uri get termsOfServiceUrl;
  @override
  Uri get privacyPolicyUrl;
  @override
  int get drawingThrottleMs;
  @override
  int get maxDrawingPoints;
  @override
  int get maxGuessLength;
  @override
  int get minBuildNumber;
  @override
  int get quickStartWebHookWaitingSec;
  @override
  int get waitingBgSocketTimeOut;
  @override
  int get playingBgSocketTimeOut;
  @override
  double get drawOptimizeEpsilion;
  @override
  UpdateDialogData get updateDialogData;
  @override
  Admob get admob;
  @override
  NoticeDialogData? get noticeDialogData;
  @override
  NoticeDialogHistory? get noticeDialogHistory;
  @override
  MaintenanceDialogData? get maintenanceDialogData;
  @override
  @TimeSerializer()
  DateTime get installedAt;
  @override
  @JsonKey(ignore: true)
  _$$ConfigImplCopyWith<_$ConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
