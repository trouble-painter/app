part of 'routes.dart';

extension RoutesHelper on BuildContext {
  Future<T?> bottomSheet<T>(
    Widget bottomSheet, {
    String? name,
    bool isScrollControlled = false,
    Color? backgroundColor,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      builder: (_) => bottomSheet,
      routeSettings: RouteSettings(
        name: (name ?? "${bottomSheet.runtimeType}").toLowerFirst(),
      ),
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
    );
  }
}
