import 'package:trouble_painter/app/pages/game/waiting/game_waiting_page_model.dart';
import 'package:trouble_painter/features/game/domain/entities/game_step.dart';
import 'package:trouble_painter/features/game/domain/entities/game_user.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';
import 'package:trouble_painter/features/game/domain/usecases/debug_ui_usecase.dart';

class GameWaitingPageModelTest extends GameWaitingViewModel {
  GameWaitingPageModelTest(super.buildState);

  /// Opens the dialog for any other player, host or not.
  @override
  bool onUserPressed(GameUser user) => user.id != state.myId;

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

  /// Brings back the first kicked dummy player.
  @override
  void onEmptyPressed() {
    final joined = state.userList.map((user) => user.id).toSet();
    final comer = ref
        .read(DebugUiUsecase.$)
        .dummyUserList
        .where((user) => !joined.contains(user.id))
        .firstOrNull;
    if (comer == null) return;
    ref.read(GameService.$.notifier).emit(
          state.copyWith(userList: [...state.userList, comer]),
        );
  }

  /// The host never readies.
  @override
  void toggleReady() {
    if (state.isHost) return;
    super.toggleReady();
    ref.read(GameService.$.notifier).emit(
          state.copyWith(
            userList: state.userList.map((user) {
              return user.id == state.myId
                  ? user.copyWith(isReady: !user.isReady)
                  : user;
            }).toList(),
          ),
        );
  }

  /// Ready status is ignored, only the player count matters.
  @override
  bool get canStart => state.hasEnoughPlayers;

  /// Marks everyone but the host as ready, then starts.
  @override
  void start() {
    super.start();
    ref.read(GameService.$.notifier).emit(
          state.copyWith(
            userList: [
              for (final (i, user) in state.userList.indexed)
                user.copyWith(isReady: i != state.hostIndex),
            ],
          ),
        );
    ref.read(GameService.$.notifier).debugStep(GameStep.ready);
  }

  @override
  void toggleHost() {
    final hostIndex = state.isHost ? 1 : 0;
    ref.read(GameService.$.notifier).emit(
          state.copyWith(
            hostIndex: hostIndex,
            userList: [
              for (final (i, user) in state.userList.indexed)
                i == hostIndex ? user.copyWith(isReady: false) : user,
            ],
          ),
        );
  }
}
