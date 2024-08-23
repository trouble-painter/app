import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/utils/env/constant.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/analytics/data/repository/route_analytics_repository.dart';
import 'package:x_pr/features/analytics/data/source/firebase_analytics_event_source.dart';

class RouteAnalyticsRepositoryWithFirebase extends RouteAnalyticsRepository {
  static final $ = Provider<RouteAnalyticsRepositoryWithFirebase>((ref) {
    return RouteAnalyticsRepositoryWithFirebase(
      analyticsEventSource: ref.read(FirebaseAnalyticsEventSource.$),
    );
  });

  RouteAnalyticsRepositoryWithFirebase({
    required FirebaseAnalyticsEventSource analyticsEventSource,
  }) : _analyticsEventSource = analyticsEventSource;

  final FirebaseAnalyticsEventSource _analyticsEventSource;

  Future<void> _sendScreenViewLog(Route<dynamic> route) async {
    final String? screenName = route.settings.name;
    if (screenName == null) return;
    try {
      await _analyticsEventSource.logScreenView(screenName);
    } catch (e, s) {
      Logger.e("Failed to sendLog", e, s);
    }
  }

  void _log(String message, [bool isShow = false]) {
    if (!isShow) return;
    Logger.d("${Constant.eRouter} $message");
  }

  bool _filter(Route<dynamic>? route) {
    return !(route?.settings.name?.startsWith('dev') ?? true);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    _log("didPop : ${route.settings.name}");
    if (previousRoute != null && _filter(previousRoute) && _filter(route)) {
      _sendScreenViewLog(previousRoute);
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    _log("didPush : ${route.settings.name}");
    if (_filter(route)) {
      _sendScreenViewLog(route);
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _log("didReplace : ${newRoute?.settings.name}");
    if (newRoute != null && _filter(newRoute)) {
      _sendScreenViewLog(newRoute);
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    _log("didRemove : ${route.settings.name}");
  }
}
