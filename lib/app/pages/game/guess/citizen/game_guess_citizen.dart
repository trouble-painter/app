import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/guess/citizen/game_guess_info.dart';
import 'package:trouble_painter/app/pages/game/guess/citizen/game_guess_mafia_profile.dart';
import 'package:trouble_painter/app/pages/game/guess/widgets/game_guess_app_bar.dart';
import 'package:trouble_painter/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:trouble_painter/core/utils/ext/widget_ext.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/sketch.dart';
import 'package:trouble_painter/features/game/domain/entities/game_user.dart';

class GameGuessCitizen extends StatelessWidget {
  const GameGuessCitizen({
    super.key,
    required this.isMafia,
    required this.category,
    required this.keyword,
    required this.mafia,
    required this.mafiaAnswer,
    required this.startedAt,
    required this.maxGuessMs,
    required this.sketchList,
  });

  final bool isMafia;
  final String category;
  final String keyword;
  final String mafiaAnswer;
  final GameUser mafia;
  final DateTime startedAt;
  final int maxGuessMs;
  final List<Sketch> sketchList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GameGuessAppBar(
          isMafia: false,
          startedAt: startedAt,
          maxGuessMs: maxGuessMs,
          category: category,
        ),

        const SizedBox(height: 32),

        /// Info
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: GameGuessInfo(),
        ),

        const SizedBox(height: 48),

        /// Mafia Profile
        GameGuessMafiaProfile(
          mafia: mafia,
          mafiaAnswer: mafiaAnswer,
        ),

        /// Canvas
        // Expanded(
        //   child: Padding(
        //     padding: const EdgeInsets.only(
        //       top: 52,
        //       left: 30,
        //       right: 30,
        //       bottom: 10,
        //     ),
        //     child: GameGuessCanvas(
        //       isMafia: isMafia,
        //       category: category,
        //       keyword: keyword,
        //       sketchList: sketchList,
        //     ),
        //   ),
        // ),
      ].conditionalWrap(
        builder: (child, index) => AnimTransOpacity(
          delayIndex: index,
          child: child,
        ),
      ),
    );
  }
}
