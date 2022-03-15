import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Quiz extends StatelessWidget {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  Quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
        backgroundColor: const Color(0xff0055A5),
      ),
      body: WebView(
        initialUrl: "https://appinter.id/2022/01/22/quiz-healthy-teenager/",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (webviewController) {
          _completer.complete(webviewController);
        },
      ),
    );
  }
}
