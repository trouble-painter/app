import 'package:flutter/material.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';

class AssetImg extends StatelessWidget {
  const AssetImg(
    this.image, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.color,
    this.blendMode,
    this.language,
    this.alignment = Alignment.center,
  });

  final String image;
  final Language? language;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final BlendMode? blendMode;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    final locale = language == null ? '' : '${language?.locale.languageCode}/';
    return Image.asset(
      'assets/images/$locale$image.png',
      width: width,
      height: height,
      fit: fit,
      color: color,
      alignment: alignment,
      colorBlendMode: blendMode,
    );
  }
}
