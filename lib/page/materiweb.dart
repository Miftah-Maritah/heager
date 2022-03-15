import 'dart:async';

import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MateriApp extends StatelessWidget {
  final String link;
  final String title;
  // final Completer<WebViewController> _completer =
  //     Completer<WebViewController>();

  MateriApp({Key? key, required this.title, required this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title.text.maxLines(1).ellipsis.make(),
        backgroundColor: const Color(0xff0055A5),
      ),
      body: WebView(
        initialUrl: link,
      ),
    );
  }
}
