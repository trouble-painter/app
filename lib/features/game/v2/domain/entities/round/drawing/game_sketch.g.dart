// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_sketch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameSketchImpl _$$GameSketchImplFromJson(Map<String, dynamic> json) =>
    _$GameSketchImpl(
      strokeList: (json['strokeList'] as List<dynamic>)
          .map((e) => GameStroke.fromJson(e as Map<String, dynamic>))
          .toList(),
      canvasSize: const SizeSerializer()
          .fromJson(json['canvasSize'] as Map<String, dynamic>),
      color: const ColorSerializer().fromJson(json['color'] as String),
    );

Map<String, dynamic> _$$GameSketchImplToJson(_$GameSketchImpl instance) =>
    <String, dynamic>{
      'strokeList': instance.strokeList,
      'canvasSize': const SizeSerializer().toJson(instance.canvasSize),
      'color': const ColorSerializer().toJson(instance.color),
    };
