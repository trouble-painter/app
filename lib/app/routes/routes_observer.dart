import 'package:flutter/material.dart';
import 'package:x_pr/core/utils/log/logger.dart';

class RoutesObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    Logger.d("🚪 didPop : ${route.settings.name}");
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    Logger.d("🚪 didPush : ${route.settings.name}");
    super.didPush(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    Logger.d("🚪 didReplace : ${newRoute?.settings.name}");
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    Logger.d("🚪 didRemove : ${route.settings.name}");
    super.didRemove(route, previousRoute);
  }
}
