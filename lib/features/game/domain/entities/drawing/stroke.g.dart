// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Stroke _$StrokeFromJson(Map<String, dynamic> json) => _Stroke(
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

Map<String, dynamic> _$StrokeToJson(_Stroke instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      't': instance.t,
    };
