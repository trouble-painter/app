import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/buttons/pop_button.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class AppLicenseAppBar extends StatelessWidget {
  const AppLicenseAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 6,
          sigmaY: 6,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
                height: 42,
              ),

              /// Back button
              const Positioned(
                left: 0,
                child: PopButton(),
              ),

              /// Title
              Positioned(
                left: 50,
                right: 50,
                child: AutoSizeText(
                  title,
                  style: context.typo.header3,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
