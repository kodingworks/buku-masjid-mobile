import 'dart:developer';

import 'package:buku_masjid/core/core.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    super.key,
    this.appBar,
    required this.url,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.onUpdateVisitedUri,
    this.onWebViewCreated,
  });

  final PreferredSizeWidget? appBar;
  final String url;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final NavigationDelegate? onUpdateVisitedUri;
  final Function(WebViewController)? onWebViewCreated;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  var controller = WebViewController();
  double progress = 0;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            log('WEBVIEW PROGRESS: $progress', name: 'WEBVIEW');
            setState(() {
              this.progress = progress / 100;
            });
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
      body: Stack(
        children: [
          _buildWebView(),
          _buildIndicator(),
        ],
      ),
    );
  }

  Widget _buildWebView() {
    return WebViewWidget(controller: controller);
  }

  Widget _buildIndicator() {
    return progress < 1
        ? SizedBox(
            height: 3,
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: context.theme.disabledColor.withOpacity(.3),
            ),
          )
        : const SizedBox();
  }
}
