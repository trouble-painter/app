import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:x_pr/core/utils/log/logger.dart';

extension KeyExt on GlobalKey {
  Future<Uint8List> getImage({double imageWidth = 512}) async {
    try {
      final repaintBoundaryKey = this;
      final boundary = repaintBoundaryKey.currentContext!.findRenderObject()
          as RenderRepaintBoundary;
      final imageRatio = imageWidth / boundary.size.width;
      final image = await boundary.toImage(pixelRatio: imageRatio);
      Logger.d("🏞️ image size : ${image.width}x${image.height}");
      final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
      return bytes!.buffer.asUint8List();
    } catch (e, s) {
      Logger.e("Failed to getImage", e, s);
      rethrow;
    }
  }
}
