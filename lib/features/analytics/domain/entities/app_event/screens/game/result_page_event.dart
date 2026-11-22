part of '../../app_event.dart';

sealed class ResultPageEvent extends AppEvent {
  const ResultPageEvent() : super(AppEventScreen.resultPage);
}

/// Citizens win
class ResultPageCitizensWinEvent extends ResultPageEvent {}

/// Mafia wins by keyword
class ResultPageMafiaWinsByKeywordEvent extends ResultPageEvent {}

/// Mafia wins by vote
class ResultPageMafiaWinsByVoteEvent extends ResultPageEvent {}

/// A player picked below the canvas to see their strokes
class ResultPageUserSelectedEvent extends ResultPageEvent {
  final bool isMafia;

  /// Whether it came from tapping the canvas, not the player below it
  final bool isFromCanvas;

  ResultPageUserSelectedEvent({
    required this.isMafia,
    required this.isFromCanvas,
  });

  @override
  Map<String, Object> toJson() =>
      {"isMafia": isMafia, "isFromCanvas": isFromCanvas};
}

/// The picked player tapped again to turn their strokes off
class ResultPageUserDeselectedEvent extends ResultPageEvent {
  final bool isMafia;

  /// Whether it came from tapping the canvas, not the player below it
  final bool isFromCanvas;

  ResultPageUserDeselectedEvent({
    required this.isMafia,
    required this.isFromCanvas,
  });

  @override
  Map<String, Object> toJson() =>
      {"isMafia": isMafia, "isFromCanvas": isFromCanvas};
}

/// In-app review requested
class ResultPageInAppReviewRequestEvent extends ResultPageEvent {}
