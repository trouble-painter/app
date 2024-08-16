part of 'routes.dart';

extension RoutesHelper on BuildContext {
  Future<T?> dialog<T>(
    Widget dialog, {
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: this,
      builder: (_) => dialog,
      barrierDismissible: barrierDismissible,
    );
  }

  Future<T?> bottomSheet<T>(
    Widget bottomSheet, {
    bool isScrollControlled = false,
    Color? backgroundColor,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      builder: (_) => bottomSheet,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
    );
  }
}
