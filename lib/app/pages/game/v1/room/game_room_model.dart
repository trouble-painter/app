import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/game/v1/domain/service/game_service_v1.dart';
import 'package:x_pr/features/game/v1/domain/service/game_service_state.dart';

class GameRoomModel extends BaseViewModel<GameServiceState> {
  GameRoomModel(super.buildState);

  /// Enter the room
  void enter(String roomId) {
    ref.read(GameServiceV1.$.notifier).enter(roomId);
  }
}
