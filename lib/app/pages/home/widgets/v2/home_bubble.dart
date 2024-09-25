import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/palette.dart';

class HomeBubble extends StatelessWidget {
  const HomeBubble({
    super.key,
    required this.text,
    required this.bubble,
  });

  final String text;
  final String bubble;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/$bubble.png',
          ),
        ),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        top: 8,
        bottom: 19.5,
      ),
      child: Text(
        text,
        style: context.typo.caption1.copyWith(
          color: Palette.white,
        ),
        maxLines: 1,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
