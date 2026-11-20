import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:trouble_painter/app/pages/game/waiting/game_waiting_page_model_impl.dart';
import 'package:trouble_painter/app/pages/game/waiting/game_waiting_page_model_test.dart';
import 'package:trouble_painter/app/pages/game/waiting/widgets/game_waiting_app_bar.dart';
import 'package:trouble_painter/app/pages/game/waiting/widgets/game_waiting_buttons.dart';
import 'package:trouble_painter/app/pages/game/waiting/widgets/game_waiting_users.dart';
import 'package:trouble_painter/app/routes/routes.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/anims/anim_switcher.dart';
import 'package:trouble_painter/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/utils/ext/widget_ext.dart';
import 'package:trouble_painter/core/view/base_view.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

class GameWaitingPage extends StatelessWidget {
  const GameWaitingPage(this.isUiTestMode, {super.key});

  final bool isUiTestMode;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: isUiTestMode
          ? GameWaitingPageModelTest.new
          : GameWaitingPageModelImpl.new,
      state: (ref, prevState) {
        return ref.watch(GameService.$) as GameWaitingState;
      },
      initState: (ref, viewModel) => viewModel.init(),
      onStateChanged: (ref, viewModel, state, oldState) {
        if (oldState != null) {
          viewModel.onStateChanged(oldState);
        }
      },
      builder: (ref, viewModel, state) {
        return Scaffold(
          body: SafeArea(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onLongPress: viewModel.toggleHost,
              child: Stack(
                children: [
                  Column(
                    children: [
                      /// Users
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.only(
                            top: 82,
                            bottom: 60,
                          ),
                          child: Column(
                            children: [
                              /// Text
                              AnimSwitcher(
                                state: state.canStart,
                                builder: (canStart) => canStart
                                    ? AnimTransOpacity(
                                        key: const ValueKey(1),
                                        child: Text(
                                          S.current.gameWaitingTitleReady,
                                          textAlign: TextAlign.center,
                                          style: context.typo.header1,
                                        ),
                                      )
                                    : AnimTransOpacity(
                                        key: const ValueKey(2),
                                        child: Text(
                                          S.current.gameWaitingTitleWaiting,
                                          textAlign: TextAlign.center,
                                          style: context.typo.header1,
                                        ),
                                      ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 44,
                                ),
                                child: GameWaitingUsers(
                                  myIndex: state.myIndex,
                                  hostIndex: state.hostIndex,
                                  userList: state.userList,
                                  maxUser: state.maxPlayer,
                                  onPressed: (user) {
                                    if (!viewModel.onUserPressed(user)) return;
                                    context.pushNamed(
                                      Routes.gameKickDialog.name,
                                      extra: {
                                        'nickname': user.nickname,
                                        'onConfirm': () {
                                          context.pop();
                                          viewModel.kick(user);
                                        },
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// Buttons
                      GameWaitingButtons(
                        isHost: state.isHost,
                        isFull: state.maxPlayer == state.userList.length,
                        tooltipText: !state.hasEnoughPlayers
                            ? S.current.gameWaitingCannotStartTip
                            : !state.isAllReady
                                ? S.current.gameWaitingWaitReadyTip
                                : S.current.gameWaitingCanStartTip,
                        canStart: state.canStart,
                        isReady: state.isMyReady,
                        onReadyPressed: viewModel.toggleReady,
                        onStartPressed: viewModel.start,
                        onInvitePressed: () {
                          context.pushNamed(
                            Routes.gameInviteBottomSheet.name,
                            extra: {
                              'roomId': state.roomId,
                              'qrData': viewModel.getDeepLink(),
                              'onShareLinkPressed': viewModel.invite,
                            },
                          );
                        },
                      ),
                    ].conditionalWrap(
                      builder: (child, index) => AnimTransOpacity(
                        delayIndex: index,
                        child: child,
                      ),
                    ),
                  ),

                  /// App Bar
                  GameRoomAppBar(
                    state: state,
                    onRulePressed: () {
                      if (!viewModel.onRulePressed()) return;
                      context.pushNamed(Routes.gameRuleBottomSheet.name);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
