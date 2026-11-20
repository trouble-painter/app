import 'dart:ui';

import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/theme/components/icons/asset_icon.dart';
import 'package:trouble_painter/core/theme/res/palette.dart';

/// An icon with a soft drop shadow
class ShadowedIcon extends StatelessWidget {
  const ShadowedIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.useIconColor = false,
  });

  final String icon;
  final double? size;
  final Color? color;
  final bool useIconColor;

  static const Offset _shadowOffset = Offset(1, 2);
  static const double _shadowBlur = 1.5;
  static const double _shadowAlpha = 0.4;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: _shadowOffset,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: _shadowBlur,
              sigmaY: _shadowBlur,
            ),
            child: AssetIcon(
              icon,
              size: size,
              color: Palette.black.withValues(alpha: _shadowAlpha),
            ),
          ),
        ),
        AssetIcon(
          icon,
          size: size,
          color: color,
          useIconColor: useIconColor,
        ),
      ],
    );
  }
}
