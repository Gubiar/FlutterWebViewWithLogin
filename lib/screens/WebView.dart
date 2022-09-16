import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PageWebView extends StatefulWidget {

  final String url;

  PageWebView(
    this.url
  );

  @override
  PageWebViewState createState() => PageWebViewState();
}

class PageWebViewState extends State<PageWebView> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.url,
    );
  }
}