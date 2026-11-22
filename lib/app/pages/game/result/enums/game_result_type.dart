import 'package:trouble_painter/core/localization/generated/l10n.dart';

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

  /// Why I won or lost, by which side I am on.
  String reason({required bool isMeMafia}) => switch ((this, isMeMafia)) {
        (GameResultType.mafiaWinsByVote, true) =>
          S.current.gameResultReasonMafiaUnnoticed,
        (GameResultType.mafiaWinsByVote, false) =>
          S.current.gameResultReasonCitizenNotFound,
        (GameResultType.mafiaWinsByKeyword, true) =>
          S.current.gameResultReasonMafiaGuessed,
        (GameResultType.mafiaWinsByKeyword, false) =>
          S.current.gameResultReasonCitizenMafiaGuessed,
        (GameResultType.citizensWin, true) =>
          S.current.gameResultReasonMafiaWrong,
        (GameResultType.citizensWin, false) =>
          S.current.gameResultReasonCitizenCaught,
      };

  String get emoji => switch (this) {
        GameResultType.mafiaWinsByVote => "emoji_sad",
        GameResultType.mafiaWinsByKeyword => "emoji_joy",
        GameResultType.citizensWin => "emoji_tada",
      };
}
