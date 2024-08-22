import 'package:flutter/material.dart';
import 'package:x_pr/app/routes/routes.dart';

class BottomSheetPage<T> extends Page<T> {
  final Offset? anchorPoint;
  final String? barrierLabel;
  final Routes route;
  final bool useSafeArea;
  final bool isScrollControlled;
  final CapturedThemes? themes;
  final Widget child;

  const BottomSheetPage({
    required this.child,
    required this.route,
    this.anchorPoint,
    this.barrierLabel,
    this.useSafeArea = true,
    this.isScrollControlled = false,
    this.themes,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  String? get name => route.name;

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
        settings: this,
        builder: (context) => child,
        anchorPoint: anchorPoint,
        barrierLabel: barrierLabel,
        useSafeArea: useSafeArea,
        isScrollControlled: isScrollControlled,
      );
}
