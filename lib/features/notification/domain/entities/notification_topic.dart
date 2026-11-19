import 'package:trouble_painter/features/config/domain/entities/language.dart';

/// FCM topics the server sends to (protocol.md 8)
enum NotificationTopic {
  quickStartKo('QUICK_START_KO', Language.korean),
  quickStartEn('QUICK_START_EN', Language.english);

  const NotificationTopic(this.topic, this.language);

  final String topic;
  final Language language;

  factory NotificationTopic.quickStart(Language language) =>
      values.firstWhere((topic) => topic.language == language);
}
