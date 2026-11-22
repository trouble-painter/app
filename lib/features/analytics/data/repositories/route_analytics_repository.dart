import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/features/analytics/data/repositories/route_analytics_repository_with_firebase.dart';
import 'package:trouble_painter/features/analytics/data/sources/firebase_analytics_event_source.dart';

abstract class RouteAnalyticsRepository extends NavigatorObserver {
  static final $ = Provider.autoDispose<RouteAnalyticsRepository>((ref) {
    return RouteAnalyticsRepositoryWithFirebase(
      analyticsEventSource: ref.read(FirebaseAnalyticsEventSource.$),
    );
  });
}
