import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';
import 'package:x_pr/features/game/v2/domain/entities/common/game_category.dart';

part 'game_keyword.freezed.dart';
part 'game_keyword.g.dart';

@freezed
class GameKeyword with _$GameKeyword {
  factory GameKeyword({
    required GameCategory category,
    required String ko,
    required String en,
  }) = _GameKeyword;
  const GameKeyword._();

  factory GameKeyword.fromJson(Map<String, dynamic> json) =>
      _$GameKeywordFromJson(json);

  String get intl {
    return Intl.getCurrentLocale() == Language.korean.locale.languageCode
        ? ko
        : en;
  }
}
