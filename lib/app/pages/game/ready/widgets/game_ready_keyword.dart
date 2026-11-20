import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';

class GameReadyKeyword extends StatelessWidget {
  const GameReadyKeyword({
    super.key,
    required this.category,
    required this.keyword,
    required this.isMafia,
  });

  final String category;
  /// Null for the mafia
  final String? keyword;
  final bool isMafia;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      constraints: const BoxConstraints(
        maxWidth: 315,
      ),
      padding: const EdgeInsets.only(
        top: 36,
        left: 28,
        right: 28,
        bottom: 40,
      ),
      decoration: BoxDecoration(
        color: context.color.hintContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Title
          Text(
            isMafia ? S.current.category : S.current.keyword,
            style: context.typo.header2.copyWith(
              color: isMafia ? context.color.primary : context.color.secondary,
            ),
          ),
          const SizedBox(height: 6),

          /// Content
          Text(
            isMafia ? category : keyword ?? '',
            textAlign: TextAlign.center,
            style: context.typo.header0,
          ),
        ],
      ),
    );
  }
}
