// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GamePlayerImpl _$$GamePlayerImplFromJson(Map<String, dynamic> json) =>
    _$GamePlayerImpl(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      color: const ColorSerializer().fromJson(json['color'] as String),
    );

Map<String, dynamic> _$$GamePlayerImplToJson(_$GamePlayerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'color': const ColorSerializer().toJson(instance.color),
    };
