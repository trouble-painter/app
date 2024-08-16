// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_dialog_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateDialogDataImpl _$$UpdateDialogDataImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateDialogDataImpl(
      title: json['title'] as String,
      button: json['button'] as String,
      url: Uri.parse(json['url'] as String),
    );

Map<String, dynamic> _$$UpdateDialogDataImplToJson(
        _$UpdateDialogDataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'button': instance.button,
      'url': instance.url.toString(),
    };
