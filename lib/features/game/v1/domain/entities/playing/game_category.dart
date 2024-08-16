import 'package:intl/intl.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';

enum GameCategory {
  animal("Animal", "동물"),
  object("Object", "물건");

  const GameCategory(this.en, this.ko);
  final String en;
  final String ko;


  String get intl {
    return Intl.getCurrentLocale() == Language.korean.locale.languageCode
        ? ko
        : en;
  }
}
