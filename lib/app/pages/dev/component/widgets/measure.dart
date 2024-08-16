import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/measure/measure_size.dart';
import 'package:x_pr/core/utils/ext/widget_ext.dart';

class Measure extends StatefulWidget {
  const Measure({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<Measure> createState() => _MeasureState();
}

class _MeasureState extends State<Measure> {
  Size? widgetSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: MeasureSize(
            child: widget.child,
            onChange: (final size) => setState(() {
              widgetSize = size;
            }),
          ),
        ),
        Row(
          children: [
            const Spacer(),
            if (widgetSize != null) Text(widgetSize!.toString()),
          ],
        ),
      ].gap(height: 8),
    );
  }
}
