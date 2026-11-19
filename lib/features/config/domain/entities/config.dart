import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trouble_painter/core/utils/env/env.dart';
import 'package:trouble_painter/core/utils/env/flavor.dart';
import 'package:trouble_painter/core/utils/serializer/time_serializer.dart';
import 'package:trouble_painter/core/utils/time/network_time_ext.dart';
import 'package:trouble_painter/features/config/domain/entities/admob.dart';
import 'package:trouble_painter/features/config/domain/entities/app_id.dart';
import 'package:trouble_painter/features/config/domain/entities/app_info.dart';
import 'package:trouble_painter/features/config/domain/entities/language.dart';
import 'package:trouble_painter/features/config/domain/entities/maintenance_dialog_data.dart';
import 'package:trouble_painter/features/config/domain/entities/notice_dialog_data.dart';
import 'package:trouble_painter/features/config/domain/entities/notice_dialog_history.dart';
import 'package:trouble_painter/features/config/domain/entities/notification_setting.dart';
import 'package:trouble_painter/features/config/domain/entities/update_dialog_data.dart';

part 'config.freezed.dart';
part 'config.g.dart';

@freezed
abstract class Config with _$Config {
  factory Config({
    required String uuid,
    required String nickname,
    required String bgmUrl,
    required String gameBgmUrl,
    required String contactUsEmail,
    required Uri bgmLicenseUrl,
    required Uri baseUrl,
    required Uri baseSocketUrl,
    required Uri inviteUrl,
    required Uri instagramUrl,
    required Uri discordUrl,
    required Uri noticeUrl,
    required Uri suggestKeywordsUrl,
    required List<String> devUuidList,
    required bool isUiTestMode,
    required bool isUiTestModeMark,
    required bool isFirstRun,

    /// Whether it's the first attemp for quick start
    required bool isQuickStartFirstRun,
    required bool isLightTheme,
    required bool isBgmDisabled,
    required bool isBgmMute,
    required bool isGameBgmDisabled,
    required bool isReactionDisabled,

    required Language language,
    required AppId appId,
    required AppInfo appInfo,
    required Uri termsOfServiceUrl,
    required Uri privacyPolicyUrl,
    required int drawingThrottleMs,
    required int maxDrawingPoints,
    required int maxGuessLength,
    required int minBuildNumber,
    required int reactionThrottleMs,
    required double drawOptimizeEpsilion,
    required UpdateDialogData updateDialogData,
    required Admob admob,
    required NotificationSetting notificationSetting,
    NoticeDialogData? noticeDialogData,
    NoticeDialogHistory? noticeDialogHistory,
    MaintenanceDialogData? maintenanceDialogData,
    @TimeSerializer() required DateTime installedAt,
  }) = _Config;

  Config._();

  bool get isDeveloper =>
      kDebugMode || Env.FLAVOR == Flavor.dev || devUuidList.contains(uuid);

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  factory Config.init() => Config(
        uuid: "",
        nickname: "",
        bgmUrl: "",
        gameBgmUrl: "",
        contactUsEmail: "",
        bgmLicenseUrl: Uri.parse(""),
        baseUrl: Uri.parse(Env.BASE_URL),
        baseSocketUrl: Uri.parse(Env.BASE_SOCKET_URL),
        inviteUrl: Uri.parse(Env.INVITE_URL),
        termsOfServiceUrl: Uri.parse(""),
        privacyPolicyUrl: Uri.parse(""),
        instagramUrl: Uri.parse(""),
        noticeUrl: Uri.parse(""),
        suggestKeywordsUrl: Uri.parse(""),
        discordUrl: Uri.parse(""),
        devUuidList: const [],
        isFirstRun: true,
        isQuickStartFirstRun: true,
        isLightTheme: false,
        isUiTestMode: false,
        isUiTestModeMark: true,
        isBgmDisabled: false,
        isBgmMute: false,
        isGameBgmDisabled: false,
        isReactionDisabled: false,
        installedAt: NetworkTime.now,
        appInfo: AppInfo.fromEmpty(),
        appId: AppId.fromEmpty(),
        language: Language.defaultLanguage,
        reactionThrottleMs: 0,
        drawingThrottleMs: 0,
        drawOptimizeEpsilion: 0,
        maxGuessLength: 100,
        maxDrawingPoints: 100000,
        minBuildNumber: -1,
        updateDialogData: UpdateDialogData.fromEmpty(),
        admob: Admob.empty(),
        notificationSetting: NotificationSetting.init(),
      );
}
