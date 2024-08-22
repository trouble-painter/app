part of 'routes.dart';

extension RoutesHelper on BuildContext {
  void popUntil(Routes target) {
    final delegate = GoRouter.of(this).routerDelegate;
    final routes = delegate.currentConfiguration.routes;
    for (int i = routes.length - 1; i >= 0; i--) {
      final route = routes[i] as GoRoute;
      if (route.name == target.name) break;
      pop();
    }
  }
}
