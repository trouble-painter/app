import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_quick_start_data.freezed.dart';

/// FCM `data.type` values (protocol.md 8)
enum NotificationType {
  quickStart('QUICK_START');

  const NotificationType(this.wire);
  final String wire;
}

@freezed
abstract class NotificationQuickStartData with _$NotificationQuickStartData {
  factory NotificationQuickStartData({
    required String title,
    required String content,
  }) = _NotificationQuickStartData;

  /// The server writes the text in the `notification` block.
  /// Returns null for a push that is not a quick start.
  static NotificationQuickStartData? fromMessage({
    required Map<String, dynamic> data,
    required String? title,
    required String? body,
  }) {
    if (data['type'] != NotificationType.quickStart.wire) return null;
    return NotificationQuickStartData(title: title ?? '', content: body ?? '');
  }
}
