import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';

/// "WIN" in the info color or "LOSE" in the primary color, for my side.
class GameResultTitle extends StatelessWidget {
  const GameResultTitle({
    super.key,
    required this.isMeWin,
  });

  final bool isMeWin;

  static const double _fontSize = 88;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: AutoSizeText(
        isMeWin ? S.current.gameResultWin : S.current.gameResultLose,
        textAlign: TextAlign.center,
        maxLines: 1,
        minFontSize: 8,
        style: context.typoSecondary.header0.copyWith(
          fontSize: _fontSize,
          color: isMeWin ? context.color.info : context.color.primary,
        ),
      ),
    );
  }
}
