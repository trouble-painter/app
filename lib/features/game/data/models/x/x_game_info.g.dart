// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'x_game_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$XGameInfoImpl _$$XGameInfoImplFromJson(Map<String, dynamic> json) =>
    _$XGameInfoImpl(
      mafiaUserId: (json['mafiaUserId'] as num).toInt(),
      roomId: json['roomId'] as String,
      category: json['category'] as String,
      answer: json['answer'] as String,
      isRandomMatching: json['isRandomMatching'] as bool,
      turnList: (json['turnList'] as List<dynamic>)
          .map((e) => XGameUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      option: XGameOption.fromJson(json['gameOption'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$XGameInfoImplToJson(_$XGameInfoImpl instance) =>
    <String, dynamic>{
      'mafiaUserId': instance.mafiaUserId,
      'roomId': instance.roomId,
      'category': instance.category,
      'answer': instance.answer,
      'isRandomMatching': instance.isRandomMatching,
      'turnList': instance.turnList,
      'gameOption': instance.option,
    };
