import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:x_pr/core/theme/components/buttons/pop_button.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class Webview extends StatefulWidget {
  const Webview({
    super.key,
    required this.url,
    this.title,
    this.onPopPressed,
  });

  final Uri url;
  final String? title;
  final VoidCallback? onPopPressed;

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  /// Web view controller
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    init();
  }

  void init() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // ..setBackgroundColor(G.primaryColor)
      ..loadRequest(widget.url);

    if (controller.platform is WebKitWebViewController) {
      (controller.platform as WebKitWebViewController)
          .setAllowsBackForwardNavigationGestures(true);
    }
  }

  @override
  void didUpdateWidget(Webview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.url != oldWidget.url) {
      controller.loadRequest(widget.url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            /// AppBar
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 12,
                bottom: 8,
              ),
              child: Stack(
                children: [
                  const SizedBox(width: double.infinity),

                  /// Pop
                  PopButton(
                    onPressed: widget.onPopPressed,
                  ),

                  /// Title
                  if (widget.title != null)
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          widget.title!,
                          style: context.typo.header3,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            /// Webview
            Expanded(
              child: WebViewWidget(
                controller: controller,
                gestureRecognizers: {
                  Factory<OneSequenceGestureRecognizer>(
                    () => LongPressGestureRecognizer(),
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
