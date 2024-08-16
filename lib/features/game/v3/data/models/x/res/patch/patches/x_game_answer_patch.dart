part of '../../x_game_res.dart';

class XGameAnswerPatch extends XGamePatch {
  final String answer;
  XGameAnswerPatch({
    required this.answer,
  }) : super(type: XGamePatchType.answer);

  @override
  GameState call(GameState state) {
    return switch (state) {
      GameGuessState() => state.copyWith(
          mafiaAnswer: answer,
        ),
      _ => state,
    };
  }

  factory XGameAnswerPatch.fromJson(Map<String, dynamic> json) {
    return XGameAnswerPatch(
      answer: json['answer'],
    );
  }
}
