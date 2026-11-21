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

/// The host changes the room's rule here. Others only see it. Every change applies at once.
class GameRuleBottomSheet extends ConsumerWidget {
  const GameRuleBottomSheet({super.key});

  static const double _confirmAreaHeight = 102;

  /// Height of the title row pinned on top
  static const double _headerHeight = 64;

  /// Height of the fade under the title
  static const double _fadeHeight = 24;

  /// The sheet is always this share of the screen tall. Dragging it down closes it.
  static const double _hostHeightFactor = 0.7;

  /// Non-host sees less, with no confirm button
  static const double _viewerHeightFactor = 0.6;

  static const BorderRadius _radius = BorderRadius.vertical(
    top: Radius.circular(30),
  );

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
        final bottomInset = MediaQuery.paddingOf(context).bottom;
        final heightFactor =
            viewModel.isEditable ? _hostHeightFactor : _viewerHeightFactor;

        /// The sheet's route is transparent and full screen, so a tap on the
        /// empty area above the sheet closes it here.
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: context.pop,
          child: DraggableScrollableSheet(
            initialChildSize: heightFactor,
            minChildSize: 0,
            maxChildSize: heightFactor,
            snap: true,
            builder: (context, scrollController) {
              /// Takes the taps on the sheet itself, so they do not close it
              return GestureDetector(
                onTap: () {},
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: context.color.dialogSurface,
                    borderRadius: _radius,
                  ),
                  child: ClipRRect(
                    borderRadius: _radius,
                    child: Stack(
                      children: [
                        /// Title & Reset pinned over the settings, which scroll
                        /// and drag the sheet through [scrollController]
                        CustomScrollView(
                          controller: scrollController,
                          physics: const AlwaysScrollableScrollPhysics(),
                          slivers: [
                            SliverPersistentHeader(
                              pinned: true,
                              delegate: _PinnedHeaderDelegate(
                                height: _headerHeight,
                                child: Container(
                                  color: context.color.dialogSurface,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        S.current.gameRuleBottomSheetTitle,
                                        style: context.typo.header3,
                                      ),
                                      const Spacer(),
                                      if (viewModel.isEditable)
                                        Button(
                                          icon: 'refresh',
                                          onPressed: viewModel.reset,
                                        )
                                      else
                                        Button(
                                          icon: 'close',
                                          onPressed: () {
                                            viewModel.onClosePressed();
                                            context.pop();
                                          },
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SliverPadding(
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 16,
                                bottom: _confirmAreaHeight + bottomInset,
                              ),
                              sliver: SliverToBoxAdapter(
                                /// Non-host taps hit the [AbsorbPointer] itself, so they
                                /// get a toast instead of changing anything
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: viewModel.isEditable
                                      ? null
                                      : viewModel.onNotHostPressed,
                                  child: AbsorbPointer(
                                    absorbing: !viewModel.isEditable,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: 32,
                                      children: [
                                        /// Strokes
                                        GameRuleStrokesSection(
                                          strokesPerTurn:
                                              state.rule.strokesPerTurn,
                                          minStrokesPerTurn: viewModel
                                              .ruleSpec.minStrokesPerTurn,
                                          maxStrokesPerTurn: viewModel
                                              .ruleSpec.maxStrokesPerTurn,
                                          onChanged: viewModel.changeStrokes,
                                        ),

                                        /// Keyword language
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              S.current
                                                  .gameRuleBottomSheetKeywordLanguage,
                                              style: context.typo.subHeader1,
                                            ),
                                            const SizedBox(height: 16),
                                            Wrap(
                                              spacing: 8,
                                              runSpacing: 8,
                                              children: viewModel
                                                  .ruleSpec.keywordLanguages
                                                  .map((language) {
                                                return GameRuleCategoryChip(
                                                  name: language.nativeName,
                                                  isSelected: state.rule
                                                          .keywordLanguage ==
                                                      language,
                                                  onPressed: () => viewModel
                                                      .changeKeywordLanguage(
                                                    language,
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ],
                                        ),

                                        /// Category
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              S.current
                                                  .gameRuleBottomSheetCategory,
                                              style: context.typo.subHeader1,
                                            ),
                                            const SizedBox(height: 16),
                                            Wrap(
                                              spacing: 8,
                                              runSpacing: 8,
                                              children: state.categories
                                                  .map((category) {
                                                return GameRuleCategoryChip(
                                                  name: category.name,
                                                  isSelected: state.rule
                                                      .isSelected(category.id),
                                                  onPressed: () => viewModel
                                                      .toggleCategory(category),
                                                );
                                              }).toList(),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        /// Fade where the settings scroll away under the title
                        Positioned(
                          left: 0,
                          right: 0,
                          top: _headerHeight,
                          height: _fadeHeight,
                          child: IgnorePointer(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    context.color.dialogSurface,
                                    context.color.dialogSurface
                                        .withValues(alpha: 0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        /// Confirm (host only), floating over a fade into the sheet
                        if (viewModel.isEditable)
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 32,
                                bottom: 16 + bottomInset,
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    context.color.dialogSurface
                                        .withValues(alpha: 0),
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
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

/// Keeps [child] at [height] on top of a scroll view.
class _PinnedHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _PinnedHeaderDelegate({required this.height, required this.child});

  final double height;
  final Widget child;

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox(height: height, child: child);
  }

  @override
  bool shouldRebuild(_PinnedHeaderDelegate oldDelegate) {
    return oldDelegate.height != height || oldDelegate.child != child;
  }
}
