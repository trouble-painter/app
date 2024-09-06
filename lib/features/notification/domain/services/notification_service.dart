import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/features/config/domain/entities/notification_setting.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/notification/domain/entities/notification_topic.dart';
import 'package:x_pr/features/notification/domain/usecases/notification_request_permission_usecase.dart';
import 'package:x_pr/features/notification/domain/usecases/notification_subscribe_topic_usecase.dart';
import 'package:x_pr/features/notification/domain/usecases/notification_unsubscribe_topic_usecase.dart';

class NotificationService extends Notifier<NotificationSetting> {
  static final $ = NotifierProvider<NotificationService, NotificationSetting>(
    NotificationService.new,
  );

  @override
  NotificationSetting build() {
    return ref.watch(ConfigService.$).notificationSetting;
  }

  ConfigService get configService => ref.read(ConfigService.$.notifier);

  Future<AuthorizationStatus> requestPermission() {
    return ref.read(NotificationRequestPermissionUsecase.$).call();
  }

  Future<Result<void>> subscribe(NotificationTopic topic) async {
    final isSuccess =
        await ref.read(NotificationSubscribeTopicUsecaseUsecase.$).call(topic);
    if (isSuccess) {
      return configService.updateReceiveQuickStartNoti(true);
    } else {
      return const Failure();
    }
  }

  Future<Result<void>> unsubscribe(NotificationTopic topic) async {
    final isSuccess = await ref
        .read(NotificationUnsubscribeTopicUsecaseUsecase.$)
        .call(topic);
    if (isSuccess) {
      return configService.updateReceiveQuickStartNoti(false);
    } else {
      return const Failure();
    }
  }
}
