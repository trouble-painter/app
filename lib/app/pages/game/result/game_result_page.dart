import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/result/game_result_page_model_impl.dart';
import 'package:x_pr/app/pages/game/result/game_result_page_model_test.dart';
import 'package:x_pr/app/pages/game/result/v2/game_result_v2.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/services/game_service.dart';

class GameResultPage extends StatelessWidget {
  const GameResultPage(this.isUiTestMode, {super.key});

  final bool isUiTestMode;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: isUiTestMode
          ? GameResultPageModelTest.new
          : GameResultPageModelImpl.new,
      state: (ref, prevState) => ref.watch(GameService.$) as GameResultState,
      initState: (ref, viewModel) => viewModel.init(),
      builder: (ref, viewModel, state) {
        return GameResultV2(
          viewModel: viewModel,
          state: state,
        );
      },
    );
  }
}
