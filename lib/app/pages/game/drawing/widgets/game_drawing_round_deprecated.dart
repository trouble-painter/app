import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/theme/res/palette.dart';

class GameDrawingRoundDeprecated extends StatelessWidget {
  const GameDrawingRoundDeprecated({
    super.key,
    required this.round,
  });

  final int round;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(10),
      child: Text(
        "Round$round\nSTART",
        textAlign: TextAlign.center,
        style: context.typoSecondary.header0.copyWith(
          color: Palette.white,
        ),
      ),
    );
  }
}
