import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Tentang extends StatelessWidget {
  const Tentang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tentang Heager"),
        backgroundColor: const Color(0xff0055A5),
      ),
      body: const WebView(
        initialUrl: "https://appinter.id/2022/01/22/tentang-heager/",
      ),
    );
  }
}
