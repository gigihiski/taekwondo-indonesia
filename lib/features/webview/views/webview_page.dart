import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/features/webview/views/webview_view.dart';

class WebviewPage extends StatelessWidget {
  const WebviewPage({
    super.key,
    required this.title,
    required this.url,
    this.headers,
    this.userAgent,
    this.isShowBar = true,
  });

  final String title;
  final String url;
  final Map<String, String>? headers;
  final String? userAgent;
  final bool isShowBar;

  static Route route(
    String title,
    String url,
    Map<String, String>? headers,
    String? userAgent,
  ) {
    return MaterialPageRoute(
      builder: (_) => WebviewPage(
        title: title,
        url: url,
        headers: headers,
        userAgent: userAgent,
      ),
    );
  }

  static RouteSettings routeSettings = const RouteSettings(name: "webview");

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarHeader(
      title: title,
      height: 60,
      textColor: Colors.white,
    );
    return Scaffold(
      appBar: appBar,
      body: WebviewView(url, title, headers: headers),
    );
  }
}
