import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';

class OnboardingPageItem extends StatelessWidget {
  const OnboardingPageItem({
    super.key,
    required this.image,
    this.language,
    required this.index,
    required this.title,
    required this.content,
  });

  final String image;
  final Language? language;
  final int index;
  final Widget title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 300,
          height: 298,
          child: AssetImg(
            image,
            language: language,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 18,
            left: 16,
            right: 16,
            bottom: 8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Title
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 11.5,
                    backgroundColor: context.color.primary,
                    child: Text(
                      "${index + 1}",
                      style: context.typo.subHeader1,
                    ),
                  ),
                  const SizedBox(width: 8),
                  DefaultTextStyle(
                    style: context.typo.header3,
                    textAlign: TextAlign.center,
                    child: title,
                  ),
                ],
              ),
              const SizedBox(height: 8),

              /// Content
              DefaultTextStyle(
                style: context.typo.subHeader1,
                textAlign: TextAlign.center,
                child: content,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
