import 'package:flutter/material.dart';
import 'dart:async' show Completer;
import 'package:webview_flutter/webview_flutter.dart';

class WebViewComponent extends StatefulWidget {
  const WebViewComponent({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<WebViewComponent> createState() => _WebViewComponentState();
}

class _WebViewComponentState extends State<WebViewComponent> {
  late Completer<WebViewController> _controller;

  @override
  void initState() {
    super.initState();
    _controller = Completer<WebViewController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            gestureNavigationEnabled: true,
          );
        },
      ),
    );
  }
}
