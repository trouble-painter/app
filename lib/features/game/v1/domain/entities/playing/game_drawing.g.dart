// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_drawing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameDrawingImpl _$$GameDrawingImplFromJson(Map<String, dynamic> json) =>
    _$GameDrawingImpl(
      strokeList: (json['strokeList'] as List<dynamic>)
          .map((e) => GameStroke.fromJson(e as Map<String, dynamic>))
          .toList(),
      canvasSize: const SizeSerializer()
          .fromJson(json['canvasSize'] as Map<String, dynamic>),
      color: const ColorSerializer().fromJson(json['color'] as String),
      player: json['player'] as String,
    );

Map<String, dynamic> _$$GameDrawingImplToJson(_$GameDrawingImpl instance) =>
    <String, dynamic>{
      'strokeList': instance.strokeList,
      'canvasSize': const SizeSerializer().toJson(instance.canvasSize),
      'color': const ColorSerializer().toJson(instance.color),
      'player': instance.player,
    };
