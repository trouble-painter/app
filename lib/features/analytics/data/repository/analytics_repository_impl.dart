import 'package:flutter/material.dart';
import 'package:x_pr/features/analytics/data/repository/analytics_repository.dart';
import 'package:x_pr/features/analytics/data/source/firebase_analytics_source.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  const AnalyticsRepositoryImpl({
    required this.firebaseAnalyticsSource,
  });

  final FirebaseAnalyticsSource firebaseAnalyticsSource;

  @override
  NavigatorObserver getNavigatorObserver() {
    return firebaseAnalyticsSource.getObserver();
  }
}
