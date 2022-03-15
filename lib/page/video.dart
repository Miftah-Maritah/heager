import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Video extends StatelessWidget {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  Video({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video"),
        backgroundColor: const Color(0xff0055A5),
      ),
      body: WebView(
        initialUrl: "https://appinter.id/2022/01/22/video/",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (webviewController) {
          _completer.complete(webviewController);
        },
      ),
    );
  }
}
