import 'package:flutter/material.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class DialogPage<T> extends Page<T> {
  final Routes route;
  final Offset? anchorPoint;
  final Color? barrierColor;
  final bool barrierDismissible;
  final String? barrierLabel;
  final bool useSafeArea;
  final CapturedThemes? themes;
  final Widget child;

  const DialogPage({
    required this.child,
    required this.route,
    this.anchorPoint,
    this.barrierColor,
    this.barrierDismissible = true,
    this.barrierLabel,
    this.useSafeArea = true,
    this.themes,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  String? get name => route.name;

  @override
  Route<T> createRoute(BuildContext context) => DialogRoute<T>(
        context: context,
        settings: this,
        builder: (context) => child,
        anchorPoint: anchorPoint,
        barrierColor: barrierColor ?? context.color.background,
        barrierDismissible: barrierDismissible,
        barrierLabel: barrierLabel,
        useSafeArea: useSafeArea,
        themes: themes,
      );
}
