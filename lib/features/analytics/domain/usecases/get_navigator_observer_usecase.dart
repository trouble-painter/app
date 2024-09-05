import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/analytics/data/repositories/route_analytics_repository.dart';

class GetNavigatorObserverParam {
  GetNavigatorObserverParam();
}

class GetNavigatorObserverUsecase
    implements BaseUsecase<GetNavigatorObserverParam, NavigatorObserver> {
  static final $ = AutoDisposeProvider<GetNavigatorObserverUsecase>((ref) {
    return GetNavigatorObserverUsecase(
      routeAnalyticsRepository: ref.read(RouteAnalyticsRepository.$),
    );
  });

  GetNavigatorObserverUsecase({
    required this.routeAnalyticsRepository,
  });

  final RouteAnalyticsRepository routeAnalyticsRepository;

  @override
  NavigatorObserver call([GetNavigatorObserverParam? param]) {
    return routeAnalyticsRepository;
  }
}
