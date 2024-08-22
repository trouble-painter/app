import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/features/analytics/data/repository/analytics_repository_impl.dart';
import 'package:x_pr/features/analytics/data/source/firebase_analytics_source.dart';

abstract interface class AnalyticsRepository {
  static final $ = AutoDisposeProvider<AnalyticsRepository>((ref) {
    return AnalyticsRepositoryImpl(
      firebaseAnalyticsSource: ref.read(FirebaseAnalyticsSource.$),
    );
  });

  NavigatorObserver getNavigatorObserver();
}
