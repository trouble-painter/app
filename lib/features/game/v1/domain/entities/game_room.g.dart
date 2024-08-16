// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameRoomImpl _$$GameRoomImplFromJson(Map<String, dynamic> json) =>
    _$GameRoomImpl(
      id: json['id'] as String,
      host: json['host'] as String,
      maxPlayers: (json['maxPlayers'] as num).toInt(),
      timeLimitSec: (json['timeLimitSec'] as num).toInt(),
      players: (json['players'] as List<dynamic>)
          .map((e) => GamePlayer.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: $enumDecode(_$GameRoomStateEnumMap, json['state']),
      createdAt: const TimeSerializer().fromJson(json['createdAt'] as String),
      spy: json['spy'] as String,
      keyword: GameKeyword.fromJson(json['keyword'] as Map<String, dynamic>),
      strokeLeft: (json['strokeLeft'] as num).toInt(),
      currentDrawingOrder: (json['currentDrawingOrder'] as num).toInt(),
      drawingOrder: (json['drawingOrder'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$GameRoomImplToJson(_$GameRoomImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'host': instance.host,
      'maxPlayers': instance.maxPlayers,
      'timeLimitSec': instance.timeLimitSec,
      'players': instance.players,
      'state': _$GameRoomStateEnumMap[instance.state]!,
      'createdAt': const TimeSerializer().toJson(instance.createdAt),
      'spy': instance.spy,
      'keyword': instance.keyword,
      'strokeLeft': instance.strokeLeft,
      'currentDrawingOrder': instance.currentDrawingOrder,
      'drawingOrder': instance.drawingOrder,
    };

const _$GameRoomStateEnumMap = {
  GameRoomState.waiting: 'waiting',
  GameRoomState.assigning: 'assigning',
  GameRoomState.playing: 'playing',
  GameRoomState.voting: 'voting',
};
