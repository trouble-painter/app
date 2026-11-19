import 'package:flutter_test/flutter_test.dart';
import 'package:trouble_painter/features/config/domain/entities/language.dart';
import 'package:trouble_painter/features/notification/domain/entities/notification_quick_start_data.dart';
import 'package:trouble_painter/features/notification/domain/entities/notification_topic.dart';

void main() {
  test('quick start topics are the server topics per language', () {
    expect(
      NotificationTopic.quickStart(Language.korean).topic,
      'QUICK_START_KO',
    );
    expect(
      NotificationTopic.quickStart(Language.english).topic,
      'QUICK_START_EN',
    );
  });

  test('a quick start push takes its text from the notification block', () {
    final data = NotificationQuickStartData.fromMessage(
      data: {'type': 'QUICK_START', 'locale': 'KO'},
      title: '빠른 시작',
      body: '아보카도님이 기다리고 있어요',
    );
    expect(data?.title, '빠른 시작');
    expect(data?.content, '아보카도님이 기다리고 있어요');
  });

  test('a push of another type is not a quick start', () {
    expect(
      NotificationQuickStartData.fromMessage(
        data: {'type': 'SOMETHING_ELSE'},
        title: 't',
        body: 'b',
      ),
      isNull,
    );
    expect(
      NotificationQuickStartData.fromMessage(data: {}, title: 't', body: 'b'),
      isNull,
    );
  });
}
