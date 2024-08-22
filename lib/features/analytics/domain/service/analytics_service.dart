import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/features/analytics/data/repository/analytics_repository.dart';

class AnalyticsService {
  static final $ = Provider<AnalyticsService>((ref) {
    return AnalyticsService(
      analyticsRepository: ref.read(AnalyticsRepository.$),
    );
  });

  const AnalyticsService({
    required this.analyticsRepository,
  });

  final AnalyticsRepository analyticsRepository;

  NavigatorObserver getNavigatorObserver() {
    return analyticsRepository.getNavigatorObserver();
  }
}
