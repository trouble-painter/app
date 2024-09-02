part of '../../app_event.dart';

sealed class DrawingPageEvent extends AppEvent {
  const DrawingPageEvent() : super(AppEventScreen.drawingPage);
}

class DrawingPageEventInfo {
  final int round;
  final int turn;
  final int remainTurnMs;
  final int nStroke;
  final int nPoints;
  final int strokeLength;
  final Size canvasSize;

  DrawingPageEventInfo({
    required this.round,
    required this.turn,
    required this.remainTurnMs,
    required this.nStroke,
    required this.nPoints,
    required this.strokeLength,
    required this.canvasSize,
  });

  Map<String, Object> toJson() => {
        "round": round,
        "turn": turn,
        "remainTurnMs": remainTurnMs,
        "nStroke": nStroke,
        "nPoints": nPoints,
        "strokeLength": strokeLength,
        "canvasWidth": canvasSize.width,
        "canvasHeight": canvasSize.height,
      };
}

/// Exposure
class DrawingPageExposureEvent extends DrawingPageEvent {}

/// Stroke start
class DrawingPageStrokeStartEvent extends DrawingPageEvent {
  final DrawingPageEventInfo drawingEventInfo;

  DrawingPageStrokeStartEvent(this.drawingEventInfo);

  @override
  Map<String, Object> toJson() => drawingEventInfo.toJson();
}

/// Stroke end
class DrawingPageStrokeEndEvent extends DrawingPageEvent {
  final DrawingPageEventInfo drawingEventInfo;

  DrawingPageStrokeEndEvent(this.drawingEventInfo);

  @override
  Map<String, Object> toJson() => drawingEventInfo.toJson();
}

/// Clear click
class DrawingPageClearClickEvent extends DrawingPageEvent {
  final DrawingPageEventInfo drawingEventInfo;

  DrawingPageClearClickEvent(this.drawingEventInfo);

  @override
  Map<String, Object> toJson() => drawingEventInfo.toJson();
}

/// End turn click
class DrawingPageEndTurnClickEvent extends DrawingPageEvent {
  final DrawingPageEventInfo drawingEventInfo;

  DrawingPageEndTurnClickEvent(this.drawingEventInfo);

  @override
  Map<String, Object> toJson() => drawingEventInfo.toJson();
}

/// Reaction click
class DrawingPageReactionClickEvent extends DrawingPageEvent {
  final GameReaction reaction;

  DrawingPageReactionClickEvent(this.reaction);

  @override
  Map<String, Object> toJson() => {
        "reaction": reaction.name,
      };
}
