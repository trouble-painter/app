import 'package:freezed_annotation/freezed_annotation.dart';
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
    String? uuid,
    String? nickname,
    bool? isLightTheme,
    bool? isGameDevMode,
    bool? isUiTestMode,
    bool? isBgmMute,
    Language? language,
    NoticeDialogHistory? noticeDialogHistory,
  }) = _LocalSharedPrefsConfig;

  factory LocalSharedPrefsConfig.fromJson(Map<String, dynamic> json) =>
      _$LocalSharedPrefsConfigFromJson(json);

  factory LocalSharedPrefsConfig.fromConfig(Config config) {
    return LocalSharedPrefsConfig(
      isFirstRun: config.isFirstRun,
      installedAt: config.installedAt,
      uuid: config.uuid,
      nickname: config.nickname,
      isLightTheme: config.isLightTheme,
      isGameDevMode: config.isGameDevMode,
      isUiTestMode: config.isUiTestMode,
      language: config.language,
      isBgmMute: config.isBgmMute,
      noticeDialogHistory: config.noticeDialogHistory,
    );
  }

  factory LocalSharedPrefsConfig.init() => LocalSharedPrefsConfig(
        isFirstRun: true,
        isGameDevMode: false,
        isUiTestMode: false,
        installedAt: NetworkTime.now,
      );
}
