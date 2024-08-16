import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class OnboardingDesc extends StatelessWidget {
  const OnboardingDesc({
    super.key,
    required this.text,
    this.isUseTextBalancer = false,
  });
  final String text;
  final bool isUseTextBalancer;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return ref.read(ConfigService.$).language.isKorean || isUseTextBalancer
            ? TextBalancer(
                text,
                style: context.typo.subHeader0.copyWith(
                  color: context.color.subtext1,
                ),
                minLines: 2,
                maxLines: 2,
                textAlign: TextAlign.center,
              )
            : AutoSizeText(
                text,
                style: context.typo.subHeader0.copyWith(
                  color: context.color.subtext1,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              );
      },
    );
  }
}
