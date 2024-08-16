part of 'button.dart';

enum ButtonType {
  icon,
  fill,
  flat,
  outline;

  /// Text & Icon color
  Color getColor(
    BuildContext context,
    bool isInactive, [
    Color? color,
  ]) {
    switch (this) {
      case ButtonType.icon:
        return isInactive
            ? color == context.color.onInactiveContainer
                ? context.color.inactive
                : context.color.onInactiveContainer
            : color ?? context.color.text;
      case ButtonType.fill:
        return isInactive
            ? color == context.color.onInactiveContainer
                ? context.color.inactive
                : context.color.onInactiveContainer
            : color ?? context.color.onPrimary;
      case ButtonType.flat:
        return isInactive
            ? color == context.color.onInactiveContainer
                ? context.color.inactive
                : context.color.onInactiveContainer
            : color ?? context.color.text;
      case ButtonType.outline:
        return isInactive
            ? color == context.color.inactive
                ? context.color.inactiveContainer
                : context.color.inactive
            : color ?? context.color.primary;
    }
  }

  /// Background color
  Color getBackgroundColor(
    BuildContext context,
    bool isInactive, [
    Color? color,
  ]) {
    switch (this) {
      case ButtonType.icon:
        return isInactive
            ? context.color.inactiveContainer
            : color ?? context.color.iconContainer;
      case ButtonType.fill:
        return isInactive
            ? context.color.inactiveContainer
            : color ?? context.color.primary;
      case ButtonType.flat:
      case ButtonType.outline:
        return color ?? Colors.transparent;
    }
  }

  /// Border
  Border? getBorder(
    BuildContext context,
    bool isInactive, [
    Color? color,
  ]) {
    switch (this) {
      case ButtonType.icon:
      case ButtonType.fill:
      case ButtonType.flat:
        return null;
      case ButtonType.outline:
        return Border.all(
          color: getColor(context, isInactive, color),
        );
    }
  }
}
