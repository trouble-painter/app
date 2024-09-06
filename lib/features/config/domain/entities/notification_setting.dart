import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_setting.freezed.dart';
part 'notification_setting.g.dart';

@freezed
class NotificationSetting with _$NotificationSetting {
  factory NotificationSetting({
    /// Whether to disable the quick startup notification function
    required bool disableQuickStartNoti,

    /// Whether to receive quick start notifications
    required bool receiveQuickStartNoti,
  }) = _NotificationSetting;

  NotificationSetting._();

  factory NotificationSetting.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingFromJson(json);

  factory NotificationSetting.init() => NotificationSetting(
        receiveQuickStartNoti: false,
        disableQuickStartNoti: false,
      );
}
