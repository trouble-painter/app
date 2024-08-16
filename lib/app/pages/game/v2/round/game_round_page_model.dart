import 'dart:async';

import 'package:x_pr/app/pages/game/v2/round/game_round_page_state.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v2/data/repository/round/game_round_repository.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round_step.dart';

class GameRoundPageModel extends BaseViewModel<GameRoundPageState> {
  static late var $;
  GameRoundPageModel(super.buildState);

  GameRoundRepository get gameRoundRepository {
    return ref.read(GameRoundRepository.$);
  }

  bool get isGameDevMode {
    return ref.read(ConfigService.$).isGameDevMode;
  }

  StreamSubscription? subs;

  Future<void> subscribeRound(String roundId) async {
    switch (await gameRoundRepository.subscribe(roundId)) {
      case Success(value: final stream):
        final uuid = ref.read(ConfigService.$).uuid;
        subs = stream.listen((round) async {
          Logger.d('👂 [Rounds] | $round');
          final me = round.players.firstWhere((player) => player.id == uuid);
          state = GameRoundLoadedState(round, me);
        });
        return;
      case Failure():
        state = GameRoundFailureState();
        return;
      case Cancel():
        return;
    }
  }

  Future<void> changeStep(String roundId, GameRoundStep step) async {
    await gameRoundRepository.updateStep(
      roundId,
      step,
    );
  }

  @override
  void dispose() {
    subs?.cancel();
    super.dispose();
  }
}
