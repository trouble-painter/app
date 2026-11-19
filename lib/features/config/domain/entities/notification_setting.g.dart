// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationSetting _$NotificationSettingFromJson(Map<String, dynamic> json) =>
    _NotificationSetting(
      disableQuickStartNoti: json['disableQuickStartNoti'] as bool,
      receiveQuickStartNoti: json['receiveQuickStartNoti'] as bool,
    );

Map<String, dynamic> _$NotificationSettingToJson(
        _NotificationSetting instance) =>
    <String, dynamic>{
      'disableQuickStartNoti': instance.disableQuickStartNoti,
      'receiveQuickStartNoti': instance.receiveQuickStartNoti,
    };
