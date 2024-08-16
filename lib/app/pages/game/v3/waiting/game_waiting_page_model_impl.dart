import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:x_pr/app/pages/game/v3/waiting/game_waiting_page_model.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/utils/env/env.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_req/game_req.dart';
import 'package:x_pr/features/game/v3/domain/service/game_service.dart';

class GameWaitingPageModelImpl extends GameWaitingViewModel {
  GameWaitingPageModelImpl(super.buildState);

  @override
  void start() {
    final gameService = ref.read(GameService.$.notifier);
    gameService.request(
      GameStartReq(roomId: gameService.currentRoomId),
    );
  }

  @override
  Future<void> invite() async {
    final inviteUrl = ref.read(ConfigService.$).inviteUrl;
    final roomId = state.roomId;
    final link = inviteUrl.replace(
      queryParameters: {
        "room": roomId,
        if (Env.FLAVOR.isDev) "flavor": "dev",
      },
    ).toString();
    final text = S.current.gameWaitingInviteMessage(roomId, link);
    await Clipboard.setData(ClipboardData(text: text));
    Toast.showText(S.current.copied);
    await Share.share(text);
  }
}
