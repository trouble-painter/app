// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_dialog_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateDialogData _$UpdateDialogDataFromJson(Map<String, dynamic> json) =>
    _UpdateDialogData(
      title: json['title'] as String,
      button: json['button'] as String,
      url: Uri.parse(json['url'] as String),
    );

Map<String, dynamic> _$UpdateDialogDataToJson(_UpdateDialogData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'button': instance.button,
      'url': instance.url.toString(),
    };
