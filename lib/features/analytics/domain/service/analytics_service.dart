import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/features/analytics/domain/usecase/get_navigator_observer_usecase.dart';

class AnalyticsService {
  static final $ = Provider<AnalyticsService>((ref) {
    return AnalyticsService(ref);
  });

  AnalyticsService(this._ref);
  final ProviderRef<AnalyticsService> _ref;

  NavigatorObserver getNavigatorObserver() {
    return _ref.read(GetNavigatorObserverUsecase.$).call();
  }
}
