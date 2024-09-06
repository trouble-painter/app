import 'package:x_pr/features/config/domain/entities/app_info.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';
import 'package:x_pr/features/config/domain/entities/notification_setting.dart';

class SettingPageState {
  final String profile;
  final String nickname;
  final bool isBgmDisabled;
  final bool isBgmMute;
  final bool isBusy;
  final Language language;
  final AppInfo appInfo;
  final NotificationSetting notificationSetting;

  const SettingPageState({
    this.isBusy = false,
    required this.profile,
    required this.isBgmDisabled,
    required this.isBgmMute,
    required this.nickname,
    required this.language,
    required this.appInfo,
    required this.notificationSetting,
  });

  SettingPageState copyWith({
    String? profile,
    String? nickname,
    bool? isBusy,
    bool? isBgmDisabled,
    bool? isBgmMute,
    Language? language,
    AppInfo? appInfo,
    NotificationSetting? notificationSetting,
  }) {
    return SettingPageState(
      profile: profile ?? this.profile,
      nickname: nickname ?? this.nickname,
      isBusy: isBusy ?? this.isBusy,
      isBgmDisabled: isBgmDisabled ?? this.isBgmDisabled,
      isBgmMute: isBgmMute ?? this.isBgmMute,
      language: language ?? this.language,
      appInfo: appInfo ?? this.appInfo,
      notificationSetting: notificationSetting ?? this.notificationSetting,
    );
  }
}
