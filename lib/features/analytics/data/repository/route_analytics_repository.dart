import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/features/analytics/data/repository/route_analytics_repository_with_firebase.dart';
import 'package:x_pr/features/analytics/data/source/firebase_analytics_event_source.dart';

abstract class RouteAnalyticsRepository extends NavigatorObserver {
  static final $ = AutoDisposeProvider<RouteAnalyticsRepository>((ref) {
    return RouteAnalyticsRepositoryWithFirebase(
      analyticsEventSource: ref.read(FirebaseAnalyticsEventSource.$),
    );
  });
}
