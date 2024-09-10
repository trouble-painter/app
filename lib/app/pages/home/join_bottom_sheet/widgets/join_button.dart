import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class JoinButton extends StatelessWidget {
  const JoinButton({
    super.key,
    required this.image,
    required this.text,
    required this.onPressed,
  });

  final String image;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.translucent,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: context.color.iconContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: AssetImg(
              image,
              width: 68,
              height: 68,
              color: context.color.text,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            text,
            style: context.typo.subHeader2.copyWith(
              color: context.color.primary,
            ),
          ),
        ],
      ),
    );
  }
}
