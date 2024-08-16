part of '../../x_game_res.dart';

class XGameDrawPatch extends XGamePatch {
  final Sketch sketch;
  XGameDrawPatch({
    required this.sketch,
  }) : super(type: XGamePatchType.draw);

  @override
  GameState call(GameState state) {
    return switch (state) {
      GameDrawingState() => state.isMyTurn
          ? throw "My turn, skipping the draw patch."
          : state.copyWith(
              currentSketch: sketch,
            ),
      _ => state,
    };
  }

  factory XGameDrawPatch.fromJson(Map<String, dynamic> json) {
    return XGameDrawPatch(
      sketch: Sketch.fromJson(json['draw']),
    );
  }
}
