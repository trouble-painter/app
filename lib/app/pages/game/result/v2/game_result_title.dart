import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';

/// "Mafia win", "Mafia lose", "Citizen win" or "Citizen lose", for my side.
class GameResultTitle extends StatelessWidget {
  const GameResultTitle({
    super.key,
    required this.isMeMafia,
    required this.isMeWin,
  });

  final bool isMeMafia;
  final bool isMeWin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: AutoSizeText.rich(
        textAlign: TextAlign.center,
        maxLines: 1,
        minFontSize: 8,
        TextSpan(
          children: [
            TextSpan(
              text: isMeMafia ? S.current.mafia : S.current.citizen,
              style: context.typoSecondary.header0.copyWith(
                fontSize: 38,
                color:
                    isMeMafia ? context.color.primary : context.color.secondary,
              ),
            ),
            TextSpan(
              text:
                  isMeWin ? S.current.gameResultWin : S.current.gameResultLose,
              style: context.typoSecondary.header0.copyWith(
                fontSize: 38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
