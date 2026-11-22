import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/description/description.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';

class GameGuessInfo extends StatelessWidget {
  const GameGuessInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AutoSizeText.rich(
          TextSpan(
            children: [
              TextSpan(
                text: S.current.mafia,
                style: context.typoSecondary.header1.copyWith(
                  color: context.color.primary,
                ),
              ),
              TextSpan(
                text: S.current.gameGuessCitizenTitle2,
                style: context.typoSecondary.header1,
              ),
            ],
          ),
          maxLines: 1,
        ),
        const SizedBox(height: 10),
        Description(
          type: DescriptionType.small,
          title: S.current.gameGuessCitizenDescription,
          content: [TextSpan(text: S.current.gameGuessCitizenCaption)],
        ),
      ],
    );
  }
}
