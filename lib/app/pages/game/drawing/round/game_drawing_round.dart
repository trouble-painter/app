import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/drawing/round/game_drawing_round_model.dart';
import 'package:x_pr/app/pages/game/drawing/round/game_drawing_round_state.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/profile/profile_citizen.dart';
import 'package:x_pr/core/theme/components/text/styled_text/styled_text.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/utils/ext/num_ext.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';
import 'package:x_pr/features/game/domain/entities/game_user.dart';

class GameDrawingRound extends StatefulWidget {
  const GameDrawingRound({
    super.key,
    required this.user,
    required this.language,
    required this.myTurn,
    required this.currentRound,
    required this.initAnimMs,
    required this.roundAnimMs,
    required this.turnStartedAt,
  });

  final GameUser user;
  final Language language;
  final int myTurn;
  final int currentRound;
  final int initAnimMs;
  final int roundAnimMs;
  final DateTime turnStartedAt;

  @override
  State<GameDrawingRound> createState() => _GameDrawingRoundState();
}

class _GameDrawingRoundState extends State<GameDrawingRound>
    with SingleTickerProviderStateMixin {
  late final GameDrawingRoundModel viewModel;

  GameDrawingRoundState get state => viewModel.state;
  AnimationController get animCtrl => viewModel.animCtrl;
  Animation<double> get fadeAnim => state.fadeAnim;
  Animation<int> get counterAnim => state.counterAnim;
  Animation<double> get counterFadeAnim => state.counterFadeAnim;
  Animation<double> get roundTransformAnim => state.roundTransformAnim;

  @override
  void initState() {
    super.initState();
    viewModel = GameDrawingRoundModel(
      animCtrl: AnimationController(
        vsync: this,
        duration: Duration.zero,
      ),
      initAnimMs: widget.initAnimMs,
      roundAnimMs: widget.roundAnimMs,
    );
    start();
  }

  void start() {
    viewModel.init(
      currentRound: widget.currentRound,
      turnStartedAt: widget.turnStartedAt,
    );
  }

  @override
  void didUpdateWidget(GameDrawingRound oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentRound != widget.currentRound) {
      start();
    }
  }

  @override
  void dispose() {
    animCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: fadeAnim,
      builder: (context, child) => Opacity(
        opacity: fadeAnim.value,
        child: child,
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: context.color.background,
        alignment: Alignment.center,
        child: Container(
          width: viewModel.dialogSize,
          height: viewModel.dialogSize,
          decoration: BoxDecoration(
            color: context.color.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 36),

                    /// Title
                    Text(
                      S.current.gameDrawingTurnOverlayTitle,
                      style: context.typo.header3,
                    ),
                    const SizedBox(height: 20),

                    /// Profile
                    ProfileCitizen(
                      user: widget.user,
                      showNickname: false,
                      isConnect: true,
                    ),
                    const SizedBox(height: 2),

                    /// Order
                    Text(
                      (widget.myTurn + 1).ordinal(widget.language),
                      style: context.typo.header1.copyWith(
                        color: widget.user.color,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const SizedBox(width: double.infinity),

                    /// Round
                    AnimatedBuilder(
                      animation: roundTransformAnim,
                      builder: (context, child) => Positioned(
                        left: roundTransformAnim.value,
                        child: child!,
                      ),
                      child: SizedBox(
                        width: viewModel.roundWidth,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Round ${widget.currentRound + 1}\n",
                              style: context.subTypo.header0.copyWith(
                                fontSize: 18,
                                color: context.color.primary,
                                height: 0.5,
                                letterSpacing: 0,
                              ),
                            ),
                            Text(
                              "START",
                              style: context.subTypo.header0.copyWith(
                                fontSize: 34,
                                color: context.color.primary,
                                height: 1,
                                letterSpacing: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Timer
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 7,
                      ),
                      child: AnimatedBuilder(
                        animation: counterFadeAnim,
                        builder: (context, child) => Opacity(
                          opacity: counterFadeAnim.value,
                          child: child,
                        ),
                        child: AnimatedBuilder(
                          animation: counterAnim,
                          builder: (context, child) => StyledText(
                            S.current.gameDrawingInitMsg1(
                              S.current.gameDrawingInitMsg0(
                                counterAnim.value,
                              ),
                            ),
                            style: context.typo.subHeader1.copyWith(
                              color: context.color.subtext1,
                            ),
                            target: S.current.gameDrawingInitMsg0(
                              counterAnim.value,
                            ),
                            builder: (target, style) {
                              return TextSpan(
                                text: target,
                                style: style.copyWith(
                                  color: context.color.primary,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
