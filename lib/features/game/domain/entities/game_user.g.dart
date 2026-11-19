// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameUser _$GameUserFromJson(Map<String, dynamic> json) => _GameUser(
      id: (json['id'] as num).toInt(),
      nickname: json['nickname'] as String,
      isConnect: json['isConnect'] as bool,
      color: const ColorSerializer().fromJson(json['colorCode'] as String),
    );

Map<String, dynamic> _$GameUserToJson(_GameUser instance) => <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'isConnect': instance.isConnect,
      'colorCode': const ColorSerializer().toJson(instance.color),
    };
