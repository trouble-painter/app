import 'package:x_pr/app/pages/game/guess/game_guess_page_model.dart';
import 'package:x_pr/features/game/domain/entities/game_req/game_req.dart';

class GameGuessPageModelImpl extends GameGuessPageModel {
  GameGuessPageModelImpl(super.buildState);

  @override
  void onAnswerChanged(String keyword) {
    gameService.request(GameAnswerReq(answer: keyword));
  }

  @override
  void submitAnswer(String keyword, {required bool isEnterPressed}) {
    super.submitAnswer(keyword, isEnterPressed: isEnterPressed);
    gameService.request(GameSubmitAnswerReq(answer: keyword));
  }
}
