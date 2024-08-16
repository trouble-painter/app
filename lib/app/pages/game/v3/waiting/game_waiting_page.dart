import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v3/waiting/game_waiting_page_model_impl.dart';
import 'package:x_pr/app/pages/game/v3/waiting/game_waiting_page_model_test.dart';
import 'package:x_pr/app/pages/game/v3/waiting/widgets/game_waiting_app_bar.dart';
import 'package:x_pr/app/pages/game/v3/waiting/widgets/game_waiting_buttons.dart';
import 'package:x_pr/app/pages/game/v3/waiting/widgets/game_waiting_users.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/anims/anim_switcher.dart';
import 'package:x_pr/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/utils/ext/widget_ext.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/v3/domain/service/game_service.dart';

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
                                  onPressed: viewModel.kick,
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
                        tooltipText: state.canStart
                            ? S.current.gameWaitingCanStartTip
                            : S.current.gameWaitingCannotStartTip,
                        canStart: state.canStart,
                        onStartPressed: viewModel.start,
                        onInvitePressed: viewModel.invite,
                      ),
                    ].conditionalWrap(
                      builder: (child, index) => AnimTransOpacity(
                        delayIndex: index,
                        child: child,
                      ),
                    ),
                  ),

                  /// App Bar
                  const GameRoomAppBar(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
