import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class HomeGameButton extends StatefulWidget {
  const HomeGameButton({
    super.key,
    required this.image,
    required this.text,
    required this.color,
    required this.backgroundColor,
    required this.onPressed,
    this.width,
    this.height,
  });

  final String image;
  final String text;
  final double? width;
  final double? height;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onPressed;

  @override
  State<HomeGameButton> createState() => _HomeGameButtonState();
}

class _HomeGameButtonState extends State<HomeGameButton> {
  bool _isPressed = false;

  bool get isPressed => _isPressed;

  set isPressed(bool value) {
    setState(() {
      _isPressed = value;
    });
  }

  Color get color => _isPressed ? widget.backgroundColor : widget.color;
  Color get backgroundColor =>
      _isPressed ? widget.color : widget.backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        isPressed = true;
      },
      onTapUp: (_) {
        isPressed = false;
        widget.onPressed();
      },
      onTapCancel: () {
        isPressed = false;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 222),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AssetImg(
              widget.image,
              color: color,
              width: 32,
              height: 32,
            ),
            const SizedBox(height: 8),
            Text(
              widget.text,
              style: context.typo.subHeader2.copyWith(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
