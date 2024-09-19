import 'package:x_pr/app/pages/game/waiting/game_waiting_page_model.dart';
import 'package:x_pr/features/game/domain/entities/game_step.dart';
import 'package:x_pr/features/game/domain/entities/game_user.dart';
import 'package:x_pr/features/game/domain/services/game_service.dart';

class GameWaitingPageModelTest extends GameWaitingViewModel {
  GameWaitingPageModelTest(super.buildState);

  @override
  void kick(GameUser kickUser) {
    ref.read(GameService.$.notifier).emit(
          state.copyWith(
            userList: state.userList.where((user) {
              return user.id != kickUser.id;
            }).toList(),
          ),
        );
  }

  @override
  void start() {
    super.start();
    ref.read(GameService.$.notifier).debugStep(GameStep.ready);
  }

  @override
  void toggleHost() {
    ref.read(GameService.$.notifier).emit(
          state.copyWith(
            hostIndex: state.isHost ? 1 : 0,
          ),
        );
  }
}
