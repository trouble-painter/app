import 'package:x_pr/core/localization/generated/l10n.dart';

enum GameResultType {
  mafiaWind,
  mafiaWindByCorrect,
  citizenWind;

  String get description => switch (this) {
        GameResultType.mafiaWind => S.current.gameResultMafiaNotFoundDesc,
        GameResultType.mafiaWindByCorrect =>
          S.current.gameResultMafiaCorrectDesc,
        GameResultType.citizenWind => S.current.gameResultMafiaWrongDesc,
      };
  String get emoji => switch (this) {
        GameResultType.mafiaWind => "emoji_sad",
        GameResultType.mafiaWindByCorrect => "emoji_joy",
        GameResultType.citizenWind => "emoji_tada",
      };
}
