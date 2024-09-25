import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/home/home_page_model.dart';
import 'package:x_pr/app/pages/home/home_page_state.dart';
import 'package:x_pr/app/pages/home/widgets/v2/home_page_v2.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/theme/components/lifecycle/lifecycle_listener.dart';
import 'package:x_pr/core/theme/components/loader/loader.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/services/game_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(viewportFraction: 1.0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: HomePageModel.new,
      state: (ref, HomePageState? prevState) {
        return HomePageState(
          playingRoomId: switch (ref.watch(GameService.$)) {
            GameDisconnectedState(playingRoomId: final roomId) => roomId,
            _ => prevState?.playingRoomId,
          },
          nickname: ref.watch(ConfigService.$).nickname,
        );
      },
      initState: (ref, viewModel) => viewModel.init(),
      onStateChanged: (ref, viewModel, state, oldState) {
        final (noticeData, oldNoticeData) = (
          state.noticeDialogData,
          oldState?.noticeDialogData,
        );
        if (noticeData != null && noticeData != oldNoticeData) {
          context.pushNamed(Routes.noticeDialog.name, extra: noticeData);
        }
      },
      builder: (ref, viewModel, state) {
        return LifecycleListener(
          listen: viewModel.didChangeAppLifecycleState,
          child: Loader(
            isBusy: state.isBusy,
            child: HomePageV2(
              state: state,
              viewModel: viewModel,
            ),
          ),
        );
      },
    );
  }
}
