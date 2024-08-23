part of '../../app_event.dart';

sealed class DrawingPageEvent extends AppEvent {
  const DrawingPageEvent() : super(AppEventScreen.drawingPage);
}

class DrawingEventInfo {
  final int round;
  final int turn;
  final int remainSec;
  final int nStroke;
  final int nPoints;
  final int lineLength;

  DrawingEventInfo({
    required this.round,
    required this.turn,
    required this.remainSec,
    required this.nStroke,
    required this.nPoints,
    required this.lineLength,
  });

  Map<String, Object> toJson() => {
        "round": round,
        "turn": turn,
        "remainSec": remainSec,
        "nStroke": nStroke,
        "nPoints": nPoints,
        "lineLength": lineLength,
      };
}

/// Exposure
class DrawingPageExposureEvent extends DrawingPageEvent {}

/// Max stroke
class DrawingPageMaxStrokeEvent extends DrawingPageEvent {
  final DrawingEventInfo drawingInfo;

  DrawingPageMaxStrokeEvent({required this.drawingInfo});

  @override
  Map<String, Object> toJson() => drawingInfo.toJson();
}

/// Drawing point down
class DrawingPagePointDownEvent extends DrawingPageEvent {
  final DrawingEventInfo drawingInfo;

  DrawingPagePointDownEvent({required this.drawingInfo});

  @override
  Map<String, Object> toJson() => drawingInfo.toJson();
}

/// Drawing point up
class DrawingPagePointUpEvent extends DrawingPageEvent {
  final DrawingEventInfo drawingInfo;

  DrawingPagePointUpEvent({required this.drawingInfo});

  @override
  Map<String, Object> toJson() => drawingInfo.toJson();
}

/// Clear click
class DrawingPageClearClickEvent extends DrawingPageEvent {
  final DrawingEventInfo drawingInfo;

  DrawingPageClearClickEvent({required this.drawingInfo});

  @override
  Map<String, Object> toJson() => drawingInfo.toJson();
}

/// Done click
class DrawingPageDoneClickEvent extends DrawingPageEvent {
  final DrawingEventInfo drawingInfo;

  DrawingPageDoneClickEvent({required this.drawingInfo});

  @override
  Map<String, Object> toJson() => drawingInfo.toJson();
}
