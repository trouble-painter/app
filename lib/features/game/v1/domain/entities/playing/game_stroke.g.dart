// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_stroke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameStrokeImpl _$$GameStrokeImplFromJson(Map<String, dynamic> json) =>
    _$GameStrokeImpl(
      x: (json['x'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      y: (json['y'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      t: (json['t'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$GameStrokeImplToJson(_$GameStrokeImpl instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      't': instance.t,
    };
