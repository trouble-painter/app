// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_round_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameRoundSettingImpl _$$GameRoundSettingImplFromJson(
        Map<String, dynamic> json) =>
    _$GameRoundSettingImpl(
      waitingSec: (json['waitingSec'] as num).toInt(),
      drawingSecLimit: (json['drawingSecLimit'] as num).toInt(),
      drawingStokeLimit: (json['drawingStokeLimit'] as num).toInt(),
      stepLimit: (json['stepLimit'] as num).toInt(),
      votingSecLimit: (json['votingSecLimit'] as num).toInt(),
      spyAnsweringSecLimit: (json['spyAnsweringSecLimit'] as num).toInt(),
    );

Map<String, dynamic> _$$GameRoundSettingImplToJson(
        _$GameRoundSettingImpl instance) =>
    <String, dynamic>{
      'waitingSec': instance.waitingSec,
      'drawingSecLimit': instance.drawingSecLimit,
      'drawingStokeLimit': instance.drawingStokeLimit,
      'stepLimit': instance.stepLimit,
      'votingSecLimit': instance.votingSecLimit,
      'spyAnsweringSecLimit': instance.spyAnsweringSecLimit,
    };
