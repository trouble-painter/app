import 'package:x_pr/app/pages/game/v3/waiting/game_waiting_page_model.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_step.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_user.dart';
import 'package:x_pr/features/game/v3/domain/service/game_service.dart';
import 'package:x_pr/features/game/v3/domain/usecase/debug_ui_usecase.dart';

class GameWaitingPageModelTest extends GameWaitingViewModel {
  GameWaitingPageModelTest(super.buildState);

  @override
  Future<void> invite() async {
    if (state.userList.length == state.maxPlayer) {
      return;
    }
    ref.read(GameService.$.notifier).emit(
          state.copyWith(
            userList: [
              ...state.userList,
              DebugUiUsecase.dummyUserList.where((user) {
                return !state.userList.contains(user);
              }).first,
            ],
          ),
        );
  }

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
