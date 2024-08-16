// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_keyword.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameKeywordImpl _$$GameKeywordImplFromJson(Map<String, dynamic> json) =>
    _$GameKeywordImpl(
      category: $enumDecode(_$GameCategoryEnumMap, json['category']),
      ko: json['ko'] as String,
      en: json['en'] as String,
    );

Map<String, dynamic> _$$GameKeywordImplToJson(_$GameKeywordImpl instance) =>
    <String, dynamic>{
      'category': _$GameCategoryEnumMap[instance.category]!,
      'ko': instance.ko,
      'en': instance.en,
    };

const _$GameCategoryEnumMap = {
  GameCategory.animal: 'animal',
  GameCategory.object: 'object',
};
