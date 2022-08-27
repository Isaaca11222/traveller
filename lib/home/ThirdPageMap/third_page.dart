import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

class ThirdPageMap extends StatefulWidget {
  const ThirdPageMap({
    Key? key,
  }) : super(key: key);

  @override
  State<ThirdPageMap> createState() => _ThirdPageMapState();
}

class _ThirdPageMapState extends State<ThirdPageMap> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl:
            'https://www.google.pl/maps/@46.4801721,-9.6493011,3z/data=!5m1!1e4',
      ),
    );
  }
}
