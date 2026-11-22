import 'dart:async';

import 'package:app_badge_plus/app_badge_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/utils/log/logger.dart';
import 'package:trouble_painter/features/config/domain/entities/language.dart';
import 'package:trouble_painter/features/config/domain/entities/notification_setting.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/notification/domain/entities/notification_topic.dart';
import 'package:trouble_painter/features/notification/domain/usecases/notification_get_init_message_usecase.dart';
import 'package:trouble_painter/features/notification/domain/usecases/notification_on_bg_message_usecase.dart';
import 'package:trouble_painter/features/notification/domain/usecases/notification_on_message_usecase.dart';
import 'package:trouble_painter/features/notification/domain/usecases/notification_request_permission_usecase.dart';
import 'package:trouble_painter/features/notification/domain/usecases/notification_subscribe_topic_usecase.dart';
import 'package:trouble_painter/features/notification/domain/usecases/notification_unsubscribe_topic_usecase.dart';

class NotificationService extends Notifier<NotificationSetting> {
  static final $ = NotifierProvider<NotificationService, NotificationSetting>(
    NotificationService.new,
  );

  @override
  NotificationSetting build() {
    return ref.watch(ConfigService.$).notificationSetting;
  }

  late ConfigService configService = ref.read(ConfigService.$.notifier);

  Future<StreamSubscription> listenBgMessage(
    Future<void> Function(RemoteMessage message) callback,
  ) {
    /// Background
    return ref.read(NotificationOnBgMessageUsecase.$).call(
          NotificationOnBgMessageParam(callback),
        );
  }

  Future<StreamSubscription> listenMessage(
    Future<void> Function(RemoteMessage message) callback,
  ) {
    /// Foreground
    return ref.read(NotificationOnMessageUsecase.$).call(
          NotificationOnMessageParam(callback),
        );
  }

  Future<RemoteMessage?> getInitMessage() {
    return ref.read(NotificationGetInitMessageUsecase.$).call();
  }

  Future<AuthorizationStatus> requestPermission() {
    return ref.read(NotificationRequestPermissionUsecase.$).call();
  }

  Future<bool> changeQuickStartNotiLanguage(Language language) async {
    /// Unsubscribe
    final results = await Future.wait(
      [
        for (final topic in NotificationTopic.values)
          ref.read(NotificationUnsubscribeTopicUsecaseUsecase.$).call(topic),
      ],
    );
    final bool isSuccess = !results.contains(false);
    if (isSuccess) {
      /// Subscribe
      final subscribeTopic = NotificationTopic.quickStart(language);
      return await ref
          .read(NotificationSubscribeTopicUsecaseUsecase.$)
          .call(subscribeTopic);
    } else {
      return false;
    }
  }

  Future<bool> subscribeQuickStartNotification() async {
    final subscribeTopic = NotificationTopic.quickStart(
      ref.read(ConfigService.$).language,
    );
    final bool isSuccess = await ref
        .read(NotificationSubscribeTopicUsecaseUsecase.$)
        .call(subscribeTopic);
    if (isSuccess) {
      final result = await configService.updateReceiveQuickStartNoti(true);
      return result.isSuccess;
    } else {
      return false;
    }
  }

  Future<bool> unsubscribeQuickStartNotification() async {
    final results = await Future.wait(
      [
        for (final topic in NotificationTopic.values)
          ref.read(NotificationUnsubscribeTopicUsecaseUsecase.$).call(topic),
      ],
    );
    final bool isSuccess = !results.contains(false);
    if (isSuccess) {
      final result = await configService.updateReceiveQuickStartNoti(false);
      return result.isSuccess;
    } else {
      return false;
    }
  }

  Future<void> clearBadge() async {
    try {
      if (await AppBadgePlus.isSupported()) {
        /// Clear badge
        await AppBadgePlus.updateBadge(0);
      }
    } catch (e, s) {
      Logger.e('Failed to clearBadge', e, s);
    }
  }
}
