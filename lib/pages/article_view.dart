import 'package:flutter/material.dart';
import 'package:newsapp/widgets/appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable, camel_case_types
class Article_View extends StatefulWidget {
  String blogurl;
  Article_View({super.key, required this.blogurl});

  @override
  State<Article_View> createState() => _Article_ViewState();
}

// ignore: camel_case_types
class _Article_ViewState extends State<Article_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEFEFEF),
        appBar: const MyAppBar(),
        body: WebView(
          initialUrl: widget.blogurl,
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
