import 'package:x_pr/app/pages/game/v3/guess/game_guess_page_model.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_req/game_req.dart';

class GameGuessPageModelImpl extends GameGuessPageModel {
  GameGuessPageModelImpl(super.buildState);

  @override
  void onAnswerChanged(String keyword) {
    gameService.request(GameAnswerReq(answer: keyword));
  }

  @override
  void submitAnswer(String keyword) {
    gameService.request(GameSubmitAnswerReq(answer: keyword));
  }
}
