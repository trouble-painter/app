import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/features/game/v2/domain/entities/common/game_category.dart';
import 'package:x_pr/features/game/v2/domain/entities/common/game_keyword.dart';

class GameKeywordSource {
  static final $ = AutoDisposeProvider<GameKeywordSource>((ref) {
    return GameKeywordSource();
  });

  final List<GameKeyword> all = [
    /// Animal
    GameKeyword(category: GameCategory.animal, ko: "사자", en: "Lion"),
    GameKeyword(category: GameCategory.animal, ko: "호랑이", en: "Tiger"),
    GameKeyword(category: GameCategory.animal, ko: "곰", en: "Bear"),
    GameKeyword(category: GameCategory.animal, ko: "코끼리", en: "Elephant"),
    GameKeyword(category: GameCategory.animal, ko: "기린", en: "Giraffe"),
    GameKeyword(category: GameCategory.animal, ko: "캥거루", en: "Kangaroo"),
    GameKeyword(category: GameCategory.animal, ko: "고래", en: "Whale"),
    GameKeyword(category: GameCategory.animal, ko: "상어", en: "Shark"),
    GameKeyword(category: GameCategory.animal, ko: "늑대", en: "Wolf"),
    GameKeyword(category: GameCategory.animal, ko: "여우", en: "Fox"),
    GameKeyword(category: GameCategory.animal, ko: "코알라", en: "Koala"),
    GameKeyword(category: GameCategory.animal, ko: "치타", en: "Cheetah"),
    GameKeyword(category: GameCategory.animal, ko: "하마", en: "Hippo"),
    GameKeyword(category: GameCategory.animal, ko: "얼룩말", en: "Zebra"),
    GameKeyword(category: GameCategory.animal, ko: "수달", en: "Otter"),
    GameKeyword(category: GameCategory.animal, ko: "원숭이", en: "Monkey"),
    GameKeyword(category: GameCategory.animal, ko: "침팬지", en: "Chimpanzee"),
    GameKeyword(category: GameCategory.animal, ko: "코뿔소", en: "Rhinoceros"),
    GameKeyword(category: GameCategory.animal, ko: "다람쥐", en: "Squirrel"),
    GameKeyword(category: GameCategory.animal, ko: "독수리", en: "Eagle"),
    GameKeyword(category: GameCategory.animal, ko: "부엉이", en: "Owl"),
    GameKeyword(category: GameCategory.animal, ko: "앵무새", en: "Parrot"),
    GameKeyword(category: GameCategory.animal, ko: "악어", en: "Crocodile"),
    GameKeyword(category: GameCategory.animal, ko: "거북이", en: "Turtle"),
    GameKeyword(category: GameCategory.animal, ko: "뱀", en: "Snake"),
    GameKeyword(category: GameCategory.animal, ko: "두더지", en: "Mole"),
    GameKeyword(category: GameCategory.animal, ko: "사슴", en: "Deer"),

    /// Object
    GameKeyword(category: GameCategory.object, ko: "연필", en: "Pencil"),
    GameKeyword(category: GameCategory.object, ko: "노트", en: "Note"),
    GameKeyword(category: GameCategory.object, ko: "컵", en: "Cup"),
    GameKeyword(category: GameCategory.object, ko: "접시", en: "Plate"),
    GameKeyword(category: GameCategory.object, ko: "숟가락", en: "Spoon"),
    GameKeyword(category: GameCategory.object, ko: "포크", en: "Fork"),
    GameKeyword(category: GameCategory.object, ko: "나이프", en: "Knife"),
    GameKeyword(category: GameCategory.object, ko: "의자", en: "Chair"),
    GameKeyword(category: GameCategory.object, ko: "책", en: "Book"),
    GameKeyword(category: GameCategory.object, ko: "램프", en: "Lamp"),
    GameKeyword(category: GameCategory.object, ko: "컴퓨터", en: "Computer"),
    GameKeyword(category: GameCategory.object, ko: "안경", en: "Glasses"),
    GameKeyword(category: GameCategory.object, ko: "시계", en: "Clock"),
    GameKeyword(category: GameCategory.object, ko: "열쇠", en: "Key"),
    GameKeyword(category: GameCategory.object, ko: "우산", en: "Umbrella"),
    GameKeyword(category: GameCategory.object, ko: "신발", en: "Shoes"),
    GameKeyword(category: GameCategory.object, ko: "모자", en: "Hat"),
    GameKeyword(category: GameCategory.object, ko: "셔츠", en: "Shirt"),
    GameKeyword(category: GameCategory.object, ko: "바지", en: "Pants"),
    GameKeyword(category: GameCategory.object, ko: "가방", en: "Bag"),
    GameKeyword(category: GameCategory.object, ko: "꽃병", en: "Vase"),
    GameKeyword(category: GameCategory.object, ko: "베개", en: "Pillow"),
    GameKeyword(category: GameCategory.object, ko: "이불", en: "Bedding"),
    GameKeyword(category: GameCategory.object, ko: "치약", en: "Toothpaste"),
    GameKeyword(category: GameCategory.object, ko: "칫솔", en: "Toothbrush"),
    GameKeyword(category: GameCategory.object, ko: "손목시계", en: "Watch"),
    GameKeyword(category: GameCategory.object, ko: "리모컨", en: "Remote"),
    GameKeyword(category: GameCategory.object, ko: "가위", en: "Scissors"),
    GameKeyword(category: GameCategory.object, ko: "자", en: "Ruler"),
  ];

  GameKeyword random() {
    return all[Random().nextInt(all.length)];
  }
}
