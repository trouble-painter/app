import 'dart:async';

import 'package:flutter/material.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/palette.dart';

class GameVotingGuide extends StatefulWidget {
  const GameVotingGuide({
    super.key,
  });

  @override
  State<GameVotingGuide> createState() => _GameVotingGuideState();
}

class _GameVotingGuideState extends State<GameVotingGuide>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;
  late final Timer? timer;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 555,
      ),
    )..addListener(() {
        setState(() {});
      });
    animation = Tween<double>(
      begin: -80,
      end: 0,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.forward();
      timer = Timer.periodic(const Duration(seconds: 3), (_) {
        _.cancel();
        controller.reverse();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: animation.value,
      child: GestureDetector(
        onTap: () {
          if (controller.isCompleted) {
            controller.reverse();
          } else {
            controller.forward();
          }
        },
        child: Stack(
          children: [
            const SizedBox(width: double.infinity),

            /// Bubble
            Positioned(
              right: 80,
              bottom: 22,
              child: Container(
                height: 52,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/vote_bubble.png',
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                  left: 32,
                  right: 42,
                  top: 8,
                  bottom: 12.5,
                ),
                child: Text(
                  S.current.gameVotingGuide,
                  style: context.typo.subHeader1.copyWith(
                    color: Palette.white,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

            /// Mafia V
            const Positioned(
              right: 0,
              bottom: -4,
              child: AssetImg(
                'vote_mafia_v',
                width: 142,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
