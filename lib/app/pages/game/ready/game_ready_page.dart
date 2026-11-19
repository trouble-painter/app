import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/ready/game_ready_page_model_impl.dart';
import 'package:trouble_painter/app/pages/game/ready/game_ready_page_model_test.dart';
import 'package:trouble_painter/app/pages/game/ready/widgets/game_ready_app_bar.dart';
import 'package:trouble_painter/app/pages/game/ready/widgets/game_ready_background.dart';
import 'package:trouble_painter/app/pages/game/ready/widgets/game_ready_keyword.dart';
import 'package:trouble_painter/app/pages/game/ready/widgets/game_ready_role.dart';
import 'package:trouble_painter/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:trouble_painter/core/utils/ext/widget_ext.dart';
import 'package:trouble_painter/core/view/base_view.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

class GameReadyPage extends StatelessWidget {
  const GameReadyPage(this.isUiTestMode, {super.key});

  final bool isUiTestMode;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: isUiTestMode
          ? GameReadyPageModelTest.new
          : GameReadyPageModelImpl.new,
      state: (ref, prevState) => ref.watch(GameService.$) as GameReadyState,
      initState: (ref, viewModel) => viewModel.init(),
      builder: (ref, viewModel, state) {
        return Scaffold(
          body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: viewModel.toggleRole,
            onLongPress: viewModel.goToDrawingStep,
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  /// AppBar
                  GameReadyAppBar(
                    totalMs: state.readyMs,
                    startedAt: state.startedAt,
                  ),

                  /// Role
                  GameReadyRole(isMafia: state.isMafia),
                  const SizedBox(height: 30),

                  /// Category & Keyword
                  GameReadyKeyword(
                    category: state.category,
                    keyword: state.keyword,
                    isMafia: state.isMafia,
                  ),
                  const SizedBox(height: 34),

                  /// Character
                  Expanded(
                    child: GameReadyBackground(
                      isMafia: state.isMafia,
                      isTerrain: true,
                      isGradient: true,
                    ),
                  ),
                ].conditionalWrap(
                  builder: (child, index) => AnimTransOpacity(
                    delayIndex: index,
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
