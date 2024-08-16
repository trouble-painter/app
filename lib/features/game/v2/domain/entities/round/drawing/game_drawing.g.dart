// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_drawing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameDrawingImpl _$$GameDrawingImplFromJson(Map<String, dynamic> json) =>
    _$GameDrawingImpl(
      id: json['id'] as String,
      roomId: json['roomId'] as String,
      roundId: json['roundId'] as String,
      sketchList: (json['sketchList'] as List<dynamic>)
          .map((e) => GameSketch.fromJson(e as Map<String, dynamic>))
          .toList(),
      turn: (json['turn'] as num).toInt(),
      step: (json['step'] as num).toInt(),
      turnStartedAt:
          const TimeSerializer().fromJson(json['turnStartedAt'] as String),
      startedAt: const TimeSerializer().fromJson(json['startedAt'] as String),
    );

Map<String, dynamic> _$$GameDrawingImplToJson(_$GameDrawingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roomId': instance.roomId,
      'roundId': instance.roundId,
      'sketchList': instance.sketchList,
      'turn': instance.turn,
      'step': instance.step,
      'turnStartedAt': const TimeSerializer().toJson(instance.turnStartedAt),
      'startedAt': const TimeSerializer().toJson(instance.startedAt),
    };
