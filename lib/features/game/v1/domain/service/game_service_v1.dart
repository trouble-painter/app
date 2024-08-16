import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';
import 'package:x_pr/features/game/v1/domain/service/game_service_state.dart';
import 'package:x_pr/features/game/v1/domain/usecase/waiting/game_left_usecase.dart';
import 'package:x_pr/features/game/v1/domain/usecase/waiting/game_subscribe_usecase.dart';

class GameServiceV1 extends AutoDisposeNotifier<GameServiceState> {
  static final $ = AutoDisposeNotifierProvider<GameServiceV1, GameServiceState>(
    GameServiceV1.new,
  );

  final String label = "🎮";

  @override
  GameServiceState build() {
    return PreGameState();
  }

  Future<void> enter(String roomId) async {
    switch (await ref.read(GameSubscribeUsecase.$).call(roomId)) {
      /// Subscribe
      case Success(value: Stream<GameRoom> stream):
        Logger.d("$label Start subscription");
        final uuid = ref.read(ConfigService.$).uuid;
        final subs = stream.listen((room) {
          Logger.d("$label listen : $room");
          state = InGameState(
            room,
            room.players.firstWhere((player) => player.id == uuid),
          );
        });
        ref.onDispose(() {
          Logger.d("$label Stop subscription");
          subs.cancel();
          if (state is InGameState) {
            left((state as InGameState).room);
          }
        });
        break;
      default:
        state = PreGameState();
        break;
    }
  }

  Future<void> left(GameRoom room) async {
    final uid = ref.read(ConfigService.$).uuid;
    Logger.d("$label player($uid) left the room(${room.id})");
    final player = room.players.firstWhere((player) => player.id == uid);
    final param = GameLeftUsecaseParam(room, player);
    await ref.read(GameLeftUsecase.$).call(param);
  }
}
