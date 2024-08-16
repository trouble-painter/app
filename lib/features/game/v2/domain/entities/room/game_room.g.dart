// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameRoomImpl _$$GameRoomImplFromJson(Map<String, dynamic> json) =>
    _$GameRoomImpl(
      id: json['id'] as String,
      hostId: json['hostId'] as String,
      maxPlayers: (json['maxPlayers'] as num).toInt(),
      players: (json['players'] as List<dynamic>)
          .map((e) => GamePlayer.fromJson(e as Map<String, dynamic>))
          .toList(),
      setting:
          GameRoundSetting.fromJson(json['setting'] as Map<String, dynamic>),
      createdAt: const TimeSerializer().fromJson(json['createdAt'] as String),
      roundId: json['roundId'] as String?,
    );

Map<String, dynamic> _$$GameRoomImplToJson(_$GameRoomImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hostId': instance.hostId,
      'maxPlayers': instance.maxPlayers,
      'players': instance.players,
      'setting': instance.setting,
      'createdAt': const TimeSerializer().toJson(instance.createdAt),
      'roundId': instance.roundId,
    };
