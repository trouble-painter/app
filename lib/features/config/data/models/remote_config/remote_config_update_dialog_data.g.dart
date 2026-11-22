// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_update_dialog_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RemoteConfigUpdateDialogData _$RemoteConfigUpdateDialogDataFromJson(
        Map<String, dynamic> json) =>
    _RemoteConfigUpdateDialogData(
      title: RemoteConfigLang.fromJson(json['title'] as Map<String, dynamic>),
      button: RemoteConfigLang.fromJson(json['button'] as Map<String, dynamic>),
      url: RemoteConfigLang.fromJson(json['url'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteConfigUpdateDialogDataToJson(
        _RemoteConfigUpdateDialogData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'button': instance.button,
      'url': instance.url,
    };
