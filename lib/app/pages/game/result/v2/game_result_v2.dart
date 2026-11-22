import 'dart:ui' show ImageFilter;

import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/result/game_result_page_model.dart';
import 'package:trouble_painter/app/pages/game/result/v2/game_result_picture.dart';
import 'package:trouble_painter/app/pages/game/result/v2/game_result_reason.dart';
import 'package:trouble_painter/app/pages/game/result/v2/game_result_title.dart';
import 'package:trouble_painter/app/pages/game/result/widgets/game_result_sketches.dart';
import 'package:trouble_painter/app/pages/game/widgets/game_exit_button.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:trouble_painter/core/theme/components/buttons/button/button.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/utils/ext/widget_ext.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';

class GameResultV2 extends StatelessWidget {
  const GameResultV2({
    super.key,
    required this.viewModel,
    required this.state,
  });

  final GameResultPageModel viewModel;
  final GameResultState state;

  static const double _buttonMargin = 20;

  /// How far above the button the white fade starts
  static const double _fadeHeight = 16;

  /// The blur ramps up over this many bands of [_bandSigma] each.
  static const int _blurBands = 2;
  static const double _bandSigma = 1.5;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final buttonBottom = bottomInset > 0 ? bottomInset : _buttonMargin;
    final buttonArea = ButtonSize.large.height + buttonBottom + _buttonMargin;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 56),

                  /// Title
                  GameResultTitle(
                    isMeWin: state.isMeWin,
                  ),

                  /// Why I won or lost
                  GameResultReason(
                    reason:
                        viewModel.resultType.reason(isMeMafia: state.isMeMafia),
                    isMeWin: state.isMeWin,
                  ),

                  /// Picture
                  GameResultPicture(
                    isMafiaWin: state.isMafiaWin,
                    mafia: state.mafia,
                    onTap: viewModel.changeResultType,
                  ),

                  /// Canvas on the easel
                  GameResultSketches(
                    sketchList: state.sketchList,
                    category: state.category,
                    keyword: state.keyword,
                    mafia: state.mafia,
                    myId: state.myId,
                    mafiaAnswer: state.mafiaAnswer,
                    userList: state.userList,
                    onUserSelected: viewModel.onUserSelected,
                    onUserDeselected: viewModel.onUserDeselected,
                    bottomSpace: buttonArea,
                  ),
                ].conditionalWrap(
                  builder: (child, index) => AnimTransOpacity(
                    delayIndex: index,
                    child: child,
                  ),
                ),
              ),
            ),

            /// White fade with blur behind the button, both growing downward
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: buttonBottom + ButtonSize.large.height + _fadeHeight,
              child: IgnorePointer(
                child: LayoutBuilder(
                  builder: (context, constraints) => Stack(
                    children: [
                      /// Each band blurs a little more of what is under the one before.
                      for (int i = 0; i < _blurBands; i++)
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          height: constraints.maxHeight *
                              (_blurBands - i) /
                              _blurBands,
                          child: ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: _bandSigma,
                                sigmaY: _bandSigma,
                              ),
                              child: const SizedBox.expand(),
                            ),
                          ),
                        ),
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: const [0, 0.25, 0.5, 0.75],
                              colors: [
                                for (final alpha in const [
                                  0.0,
                                  0.3,
                                  0.75,
                                  1.0,
                                ])
                                  context.color.surface
                                      .withValues(alpha: alpha),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Play again
            Positioned(
              left: _buttonMargin,
              right: _buttonMargin,
              bottom: buttonBottom,
              child: Button(
                text: S.current.gameResultPlayAgain,
                textStyle: context.typo.header2,
                size: ButtonSize.large,
                width: double.infinity,
                shadow: context.deco.shadow,
                onPressed: viewModel.playAgain,
              ),
            ),

            /// AppBar
            Positioned(
              top: 12,
              left: 0,
              right: 16,
              child: const Row(
                children: [
                  Spacer(),
                  GameExitButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
