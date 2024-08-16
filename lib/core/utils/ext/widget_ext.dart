import 'package:flutter/material.dart';

extension ListWidgetExt on List<Widget> {
  List<Widget> gap({double? width, double? height}) {
    final gap = SizedBox(width: width, height: height);
    return [
      for (int i = 0; i < length; i++) ...[
        this[i],
        if (i < length - 1) gap,
      ],
    ];
  }

  List<Widget> conditionalWrap({
    List<Type> ignoreWidgets = const [SizedBox, Spacer],
    bool Function(Widget widget, int index)? isWrap,
    required Widget Function(Widget child, int index) builder,
  }) {
    int wrapIndex = 0;
    for (int index = 0; index < length; index++) {
      final widget = this[index];
      if (ignoreWidgets.contains(widget.runtimeType)) {
        continue;
      }
      if (isWrap?.call(widget, index) ?? true) {
        this[index] = switch (widget) {
          Expanded(
            key: final key,
            flex: final flex,
            child: final child,
          ) =>
            Expanded(
              key: key,
              flex: flex,
              child: builder(child, wrapIndex),
            ),
          Positioned(
            key: final key,
            child: final child,
            left: final left,
            top: final top,
            right: final right,
            bottom: final bottom,
            width: final width,
            height: final height,
          ) =>
            Positioned(
              key: key,
              left: left,
              top: top,
              right: right,
              bottom: bottom,
              width: width,
              height: height,
              child: builder(
                child,
                wrapIndex,
              ),
            ),
          _ => builder(widget, wrapIndex),
        };
        wrapIndex += 1;
      }
    }
    return this;
  }
}
