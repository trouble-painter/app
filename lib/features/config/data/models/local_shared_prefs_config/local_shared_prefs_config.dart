import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';
import 'package:x_pr/features/config/domain/entities/notice_dialog_history.dart';

part 'local_shared_prefs_config.freezed.dart';
part 'local_shared_prefs_config.g.dart';

@freezed
class LocalSharedPrefsConfig with _$LocalSharedPrefsConfig {
  const factory LocalSharedPrefsConfig({
    /// Is first run or not
    required bool isFirstRun,

    /// App install time
    required DateTime installedAt,
    required String uuid,
    required String nickname,
    required bool isLightTheme,
    required bool isUiTestMode,
    required bool isUiTestModeMark,
    required bool isBgmMute,
    required bool receiveQuickStartNoti,
    required bool isQuickStartFirstRun,
    Language? language,
    NoticeDialogHistory? noticeDialogHistory,
  }) = _LocalSharedPrefsConfig;

  factory LocalSharedPrefsConfig.fromJson(Map<String, dynamic> json) =>
      _$LocalSharedPrefsConfigFromJson(json);

  factory LocalSharedPrefsConfig.fromConfig(Config config) {
    return LocalSharedPrefsConfig(
      isFirstRun: config.isFirstRun,
      isQuickStartFirstRun: config.isQuickStartFirstRun,
      installedAt: config.installedAt,
      uuid: config.uuid,
      nickname: config.nickname,
      isLightTheme: config.isLightTheme,
      isUiTestMode: config.isUiTestMode,
      isUiTestModeMark: config.isUiTestModeMark,
      language: config.language,
      isBgmMute: config.isBgmMute,
      noticeDialogHistory: config.noticeDialogHistory,
      receiveQuickStartNoti: config.notificationSetting.receiveQuickStartNoti,
    );
  }

  factory LocalSharedPrefsConfig.init() => LocalSharedPrefsConfig(
        nickname: "",
        uuid: const Uuid().v1(),
        isFirstRun: true,
        isUiTestMode: false,
        isUiTestModeMark: true,
        isLightTheme: false,
        isBgmMute: false,
        receiveQuickStartNoti: false,
        isQuickStartFirstRun: true,
        installedAt: NetworkTime.now,
      );
}
