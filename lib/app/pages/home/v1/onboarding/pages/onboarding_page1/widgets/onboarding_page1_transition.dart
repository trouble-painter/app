import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/home/v1/onboarding/onboarding_page_view_state.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';

class OnboardingPage1Transition extends StatefulWidget {
  const OnboardingPage1Transition(
    this.pageController, {
    super.key,
    required this.image,
    required this.tween,
    this.width,
    this.height,
    this.curve = Curves.ease,
    this.duration = const Duration(milliseconds: 777),
    this.delay = const Duration(milliseconds: 333),
  });

  final String image;
  final double? width;
  final double? height;
  final Tween<Offset> tween;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final PageController pageController;

  @override
  State<OnboardingPage1Transition> createState() =>
      _OnboardingPage1TransitionState();
}

class _OnboardingPage1TransitionState extends State<OnboardingPage1Transition>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );
  late Animation<Offset> transitionAnimation;
  final pageCount = OnboardingPageViewState.pageCount;

  @override
  void initState() {
    super.initState();
    transitionAnimation = widget.tween.animate(
      CurvedAnimation(
        parent: controller,
        curve: widget.curve,
      ),
    );
    controller
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          transitionAnimation = widget.tween.animate(
            CurvedAnimation(
              parent: controller,
              curve: Curves.easeOut,
            ),
          );
        }
      });
    widget.pageController.addListener(pageControllerListener);
    Future.delayed(widget.delay, () {
      if (!mounted) return;
      controller.forward();
    });
  }

  void pageControllerListener() {
    final page = widget.pageController.page ?? 0;
    final p = page % pageCount;
    final value = p > pageCount - 1 ? p - pageCount + 1 : 1 - p.clamp(0, 1);
    controller.value = value.clamp(0, 1).toDouble();
  }

  @override
  void dispose() {
    controller.dispose();
    widget.pageController.removeListener(pageControllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: transitionAnimation.value,
      child: AssetImg(
        widget.image,
        width: widget.width,
        height: widget.height,
      ),
    );
  }
}
