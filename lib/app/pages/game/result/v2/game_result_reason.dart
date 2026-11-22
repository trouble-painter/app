import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';

/// A short line under the title that says why I won or lost.
class GameResultReason extends StatelessWidget {
  const GameResultReason({
    super.key,
    required this.reason,
    required this.isMeWin,
  });

  final String reason;
  final bool isMeWin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: AutoSizeText(
        reason,
        textAlign: TextAlign.center,
        maxLines: 1,
        minFontSize: 8,
        style: context.typo.header2.copyWith(
          color: isMeWin ? context.color.info : context.color.primary,
        ),
      ),
    );
  }
}
