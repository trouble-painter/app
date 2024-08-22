import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:x_pr/core/utils/log/logger.dart';

class RoutesObserver extends NavigatorObserver {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  void _print(String message, [bool isShow = true]) {
    if (!isShow) return;
    Logger.d("🚪 $message");
  }

  bool _logFilter(Route<dynamic>? route) {
    return !(route?.settings.name?.startsWith('dev') ?? true);
  }

  Future<void> _sendScreenViewLog(Route<dynamic> route) async {
    final String? screenName = route.settings.name;
    if (screenName == null) return;
    try {
      await analytics.logScreenView(screenName: screenName);
    } catch (e, s) {
      Logger.e("Failed to sendLog", e, s);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    _print("didPop : ${route.settings.name}");
    if (previousRoute != null &&
        _logFilter(previousRoute) &&
        _logFilter(route)) {
      _sendScreenViewLog(previousRoute);
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    _print("didPush : ${route.settings.name}");
    if (_logFilter(route)) {
      _sendScreenViewLog(route);
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _print("didReplace : ${newRoute?.settings.name}");
    if (newRoute != null && _logFilter(newRoute)) {
      _sendScreenViewLog(newRoute);
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    _print("didRemove : ${route.settings.name}");
  }
}
