import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/waiting/rule_bottom_sheet/game_rule_bottom_sheet_model_impl.dart';
import 'package:trouble_painter/app/pages/game/waiting/rule_bottom_sheet/game_rule_bottom_sheet_model_test.dart';
import 'package:trouble_painter/app/pages/game/waiting/rule_bottom_sheet/widgets/game_rule_category_chip.dart';
import 'package:trouble_painter/app/pages/game/waiting/rule_bottom_sheet/widgets/game_rule_strokes_section.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/buttons/button/button.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/view/base_view.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

/// The host changes the room's rule here. Every change applies at once.
class GameRuleBottomSheet extends ConsumerWidget {
  const GameRuleBottomSheet({super.key});

  static const double _confirmAreaHeight = 102;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUiTestMode = ref.read(ConfigService.$).isUiTestMode;
    return BaseView(
      viewModel: isUiTestMode
          ? GameRuleBottomSheetModelTest.new
          : GameRuleBottomSheetModelImpl.new,
      state: (ref, prevState) {
        return ref.watch(GameService.$) as GameWaitingState;
      },
      builder: (ref, viewModel, state) {
        return SafeArea(
          top: false,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 16,
                  bottom: _confirmAreaHeight,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 32,
                  children: [
                    /// Title & Reset & Close
                    Row(
                      children: [
                        Text(
                          S.current.gameRuleBottomSheetTitle,
                          style: context.typo.header3,
                        ),
                        const Spacer(),
                        Button(
                          icon: 'refresh',
                          onPressed: viewModel.reset,
                        ),
                        const SizedBox(width: 8),
                        Button(
                          icon: 'close',
                          onPressed: () {
                            viewModel.onClosePressed();
                            context.pop();
                          },
                        ),
                      ],
                    ),

                    /// Strokes
                    GameRuleStrokesSection(
                      strokesPerTurn: state.rule.strokesPerTurn,
                      minStrokesPerTurn: viewModel.ruleSpec.minStrokesPerTurn,
                      maxStrokesPerTurn: viewModel.ruleSpec.maxStrokesPerTurn,
                      onChanged: viewModel.changeStrokes,
                    ),

                    /// Keyword language
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.current.gameRuleBottomSheetKeywordLanguage,
                          style: context.typo.subHeader1,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          S.current.gameRuleBottomSheetKeywordLanguageDesc,
                          style: context.typo.caption1.copyWith(
                            color: context.color.subtext5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: viewModel.ruleSpec.keywordLanguages
                              .map((language) {
                            return GameRuleCategoryChip(
                              name: language.nativeName,
                              isSelected:
                                  state.rule.keywordLanguage == language,
                              onPressed: () =>
                                  viewModel.changeKeywordLanguage(language),
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    /// Category
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.current.gameRuleBottomSheetCategory,
                          style: context.typo.subHeader1,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          S.current.gameRuleBottomSheetCategoryDesc,
                          style: context.typo.caption1.copyWith(
                            color: context.color.subtext5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: state.categories.map((category) {
                            return GameRuleCategoryChip(
                              name: category.name,
                              isSelected: state.rule.isSelected(category.id),
                              onPressed: () =>
                                  viewModel.toggleCategory(category),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// Confirm, floating over a fade into the sheet
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 32,
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        context.color.dialogSurface.withValues(alpha: 0),
                        context.color.dialogSurface,
                      ],
                      stops: const [0, 0.4],
                    ),
                  ),
                  child: Button(
                    width: double.infinity,
                    size: ButtonSize.large,
                    text: S.current.confirm,
                    onPressed: () {
                      viewModel.onConfirmPressed();
                      context.pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
