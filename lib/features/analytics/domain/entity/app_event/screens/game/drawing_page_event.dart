part of '../../app_event.dart';

sealed class DrawingPageEvent extends AppEvent {
  const DrawingPageEvent() : super(AppEventScreen.drawingPage);
}

class DrawingEventInfo {
  final int round;
  final int turn;
  final int remainTurnMs;
  final int nStroke;
  final int nPoints;
  final int strokeLength;
  final Size canvasSize;

  DrawingEventInfo({
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
        "canvasHeight": canvasSize.height
      };
}

/// Exposure
class DrawingPageExposureEvent extends DrawingPageEvent {}

/// Stroke start
class DrawingPageStrokeStartEvent extends DrawingPageEvent {
  final DrawingEventInfo drawingEventInfo;

  DrawingPageStrokeStartEvent(this.drawingEventInfo);

  @override
  Map<String, Object> toJson() => drawingEventInfo.toJson();
}

/// Stroke end
class DrawingPageStrokeEndEvent extends DrawingPageEvent {
  final DrawingEventInfo drawingEventInfo;

  DrawingPageStrokeEndEvent(this.drawingEventInfo);

  @override
  Map<String, Object> toJson() => drawingEventInfo.toJson();
}

/// Clear click
class DrawingPageClearClickEvent extends DrawingPageEvent {
  final DrawingEventInfo drawingEventInfo;

  DrawingPageClearClickEvent(this.drawingEventInfo);

  @override
  Map<String, Object> toJson() => drawingEventInfo.toJson();
}

/// End turn click
class DrawingPageEndTurnClickEvent extends DrawingPageEvent {
  final DrawingEventInfo drawingEventInfo;

  DrawingPageEndTurnClickEvent(this.drawingEventInfo);

  @override
  Map<String, Object> toJson() => drawingEventInfo.toJson();
}
