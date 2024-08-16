import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:x_pr/core/theme/res/palette.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    required this.child,
    required this.isBusy,
  });

  final Widget child;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        IgnorePointer(
          ignoring: isBusy,
          child: child,
        ),
        AnimTransOpacity(
          isReverse: !isBusy,
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Palette.white,
            ),
          ),
        ),
      ],
    );
  }
}
