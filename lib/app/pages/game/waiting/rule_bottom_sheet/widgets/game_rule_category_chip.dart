import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';

class GameRuleCategoryChip extends StatelessWidget {
  const GameRuleCategoryChip({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onPressed,
  });

  final String name;
  final bool isSelected;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: context.color.iconContainer,
          border: Border.all(
            color: isSelected ? context.color.primary : Colors.transparent,
          ),
        ),
        child: Text(
          name,
          style: context.typo.body2.copyWith(
            color: isSelected ? context.color.primary : context.color.subtext4,
          ),
        ),
      ),
    );
  }
}
