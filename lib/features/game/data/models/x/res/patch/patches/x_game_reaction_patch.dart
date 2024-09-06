part of '../../x_game_res.dart';

class XGameReactionPatch extends XGamePatch {
  final XGameReaction reaction;
  XGameReactionPatch({
    required this.reaction,
  }) : super(type: XGamePatchType.reaction);

  @override
  GameState call(GameState state) {
    if (state is GameDrawingState) {
      state.reaction$Ctrl.sink.add(reaction.toEntity());
    }
    return state;
  }

  factory XGameReactionPatch.fromJson(Map<String, dynamic> json) {
    return XGameReactionPatch(
      reaction: XGameReaction.fromJson(json['reaction']),
    );
  }
}
