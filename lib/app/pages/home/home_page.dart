import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/home/home_page_model.dart';
import 'package:trouble_painter/app/pages/home/home_page_state.dart';
import 'package:trouble_painter/app/pages/home/v2/home_page_v2.dart';
import 'package:trouble_painter/app/routes/routes.dart';
import 'package:trouble_painter/core/theme/components/lifecycle/lifecycle_listener.dart';
import 'package:trouble_painter/core/theme/components/loader/loader.dart';
import 'package:trouble_painter/core/view/base_view.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

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
