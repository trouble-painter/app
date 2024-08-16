// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'x_game_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$XGameOptionImpl _$$XGameOptionImplFromJson(Map<String, dynamic> json) =>
    _$XGameOptionImpl(
      minimum: (json['minimum'] as num).toInt(),
      maximum: (json['maximum'] as num).toInt(),
      readyTime: (json['readyTime'] as num).toInt(),
      introAnimationTime: (json['introAnimationTime'] as num).toInt(),
      roundAnimationTime: (json['roundAnimationTime'] as num).toInt(),
      round: (json['round'] as num).toInt(),
      turnTime: (json['turnTime'] as num).toInt(),
      endTime: (json['endTime'] as num).toInt(),
      turnCount: (json['turnCount'] as num).toInt(),
      voteTime: (json['voteTime'] as num).toInt(),
      answerTime: (json['answerTime'] as num).toInt(),
    );

Map<String, dynamic> _$$XGameOptionImplToJson(_$XGameOptionImpl instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'maximum': instance.maximum,
      'readyTime': instance.readyTime,
      'introAnimationTime': instance.introAnimationTime,
      'roundAnimationTime': instance.roundAnimationTime,
      'round': instance.round,
      'turnTime': instance.turnTime,
      'endTime': instance.endTime,
      'turnCount': instance.turnCount,
      'voteTime': instance.voteTime,
      'answerTime': instance.answerTime,
    };
