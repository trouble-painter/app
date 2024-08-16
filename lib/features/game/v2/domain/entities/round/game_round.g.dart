// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_round.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameRoundImpl _$$GameRoundImplFromJson(Map<String, dynamic> json) =>
    _$GameRoundImpl(
      id: json['id'] as String,
      roomId: json['roomId'] as String,
      spyAnswer: json['spyAnswer'] as String,
      voting: (json['voting'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), (e as num).toInt()),
      ),
      hostId: json['hostId'] as String,
      spyId: json['spyId'] as String,
      secondsLeft: (json['secondsLeft'] as num).toInt(),
      keyword: GameKeyword.fromJson(json['keyword'] as Map<String, dynamic>),
      players: (json['players'] as List<dynamic>)
          .map((e) => GamePlayer.fromJson(e as Map<String, dynamic>))
          .toList(),
      setting:
          GameRoundSetting.fromJson(json['setting'] as Map<String, dynamic>),
      step: $enumDecode(_$GameRoundStepEnumMap, json['step']),
      startedAt: const TimeSerializer().fromJson(json['startedAt'] as String),
      drawingId: json['drawingId'] as String?,
    );

Map<String, dynamic> _$$GameRoundImplToJson(_$GameRoundImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roomId': instance.roomId,
      'spyAnswer': instance.spyAnswer,
      'voting': instance.voting.map((k, e) => MapEntry(k.toString(), e)),
      'hostId': instance.hostId,
      'spyId': instance.spyId,
      'secondsLeft': instance.secondsLeft,
      'keyword': instance.keyword,
      'players': instance.players,
      'setting': instance.setting,
      'step': _$GameRoundStepEnumMap[instance.step]!,
      'startedAt': const TimeSerializer().toJson(instance.startedAt),
      'drawingId': instance.drawingId,
    };

const _$GameRoundStepEnumMap = {
  GameRoundStep.waiting: 'waiting',
  GameRoundStep.drawing: 'drawing',
  GameRoundStep.voting: 'voting',
  GameRoundStep.answering: 'answering',
  GameRoundStep.ending: 'ending',
};
