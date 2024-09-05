import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/usecases/get_navigator_observer_usecase.dart';
import 'package:x_pr/features/analytics/domain/usecases/send_event_usecase.dart';
import 'package:x_pr/features/analytics/domain/usecases/send_screen_view_event_usecase.dart';

class AnalyticsService {
  static final $ = Provider<AnalyticsService>((ref) {
    return AnalyticsService(ref);
  });

  AnalyticsService(this._ref);
  final ProviderRef<AnalyticsService> _ref;

  NavigatorObserver getNavigatorObserver() {
    return _ref.read(GetNavigatorObserverUsecase.$).call();
  }

  Future<void> sendEvent(AppEvent event) {
    return _ref.read(SendEventUsecase.$).call(event);
  }

  Future<void> sendScreenViewEvent(AppEventScreen screen) {
    return _ref.read(SendScreenViewEventUsecase.$).call(screen);
  }
}
