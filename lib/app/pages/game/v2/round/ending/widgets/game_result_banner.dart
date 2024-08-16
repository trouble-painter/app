import 'package:flutter/material.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class GameResultBanner extends StatelessWidget {
  const GameResultBanner({
    super.key,
    required this.action,
    required this.result,
  });
  final String action;
  final String result;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: context.typo.header0.copyWith(
        fontWeight: context.typo.bold,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Action
          FittedBox(
            child: TextBalancer(
              action,
              minLines: 2,
            ),
          ),

          const SizedBox(height: 32),

          /// Result
          FittedBox(
            child: TextBalancer(
              result,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
