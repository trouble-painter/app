import 'package:x_pr/app/pages/home/home_page_model.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_step.dart';

class HomePageModelTest extends HomePageModel {
  HomePageModelTest(super.initState);

  @override
  Future<bool> enter([String? roomId]) async {
    await gameService.debugStep(GameStep.waiting);
    return true;
  }
}
