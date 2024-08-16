// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameUserImpl _$$GameUserImplFromJson(Map<String, dynamic> json) =>
    _$GameUserImpl(
      id: (json['id'] as num).toInt(),
      nickname: json['nickname'] as String,
      isConnect: json['isConnect'] as bool,
      color: const ColorSerializer().fromJson(json['colorCode'] as String),
    );

Map<String, dynamic> _$$GameUserImplToJson(_$GameUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'isConnect': instance.isConnect,
      'colorCode': const ColorSerializer().toJson(instance.color),
    };
