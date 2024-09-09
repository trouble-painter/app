import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_quick_start_data.freezed.dart';
part 'notification_quick_start_data.g.dart';

@freezed
class NotificationQuickStartData with _$NotificationQuickStartData {
  factory NotificationQuickStartData({
    required String title,
    required String content,
  }) = _NotificationQuickStartData;

  factory NotificationQuickStartData.fromJson(Map<String, dynamic> json) =>
      _$NotificationQuickStartDataFromJson(json);
}
