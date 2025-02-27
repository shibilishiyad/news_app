import 'package:flutter/material.dart';
import 'package:newsapp/widgets/appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SliderWebView extends StatelessWidget {
  final String url;

  const SliderWebView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: const MyAppBar(),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
