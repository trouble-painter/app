import 'package:x_pr/core/localization/generated/l10n.dart';

enum GameResultType {
  mafiaWinsByVote,
  mafiaWinsByKeyword,
  citizensWin;

  String get description => switch (this) {
        GameResultType.mafiaWinsByVote => S.current.gameResultMafiaNotFoundDesc,
        GameResultType.mafiaWinsByKeyword =>
          S.current.gameResultMafiaCorrectDesc,
        GameResultType.citizensWin => S.current.gameResultMafiaWrongDesc,
      };
  String get emoji => switch (this) {
        GameResultType.mafiaWinsByVote => "emoji_sad",
        GameResultType.mafiaWinsByKeyword => "emoji_joy",
        GameResultType.citizensWin => "emoji_tada",
      };
}
