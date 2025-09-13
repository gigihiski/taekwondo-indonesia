import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

class WebviewView extends StatefulWidget {
  const WebviewView(
    this.url,
    this.title, {
    this.headers,
    this.userAgent =
        "Mozilla/5.0 (Linux; Android 7.0; SM-G930V Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36 AppWebView",
    super.key,
  });

  static RouteSettings settings() {
    return const RouteSettings(name: "webview");
  }

  final String url;
  final String title;
  final Map<String, String>? headers;
  final String userAgent;

  @override
  State<WebviewView> createState() => _WebviewViewState();
}

class _WebviewViewState extends State<WebviewView> {
  late InAppWebViewController webView;
  double current = 0;
  String errorMessage = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) webView.goBack();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                if (current != 1.0)
                  LinearProgressIndicator(
                    color: current == 1.0
                        ? Colors.transparent
                        : AppColors.primary,
                    backgroundColor: AppColors.primary,
                    value: current,
                    semanticsLabel: "Loading",
                    minHeight: 2.0,
                  ),
                Expanded(
                  child: InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: WebUri(widget.url),
                      headers: widget.headers,
                    ),
                    initialSettings: InAppWebViewSettings(
                      useShouldOverrideUrlLoading: true,
                      javaScriptEnabled: true,
                      useOnLoadResource: true,
                      cacheEnabled: true,
                      userAgent: widget.userAgent,
                    ),
                    onWebViewCreated: (InAppWebViewController controller) {
                      webView = controller;
                    },
                    onReceivedServerTrustAuthRequest:
                        (controller, challenge) async {
                          return ServerTrustAuthResponse(
                            action: ServerTrustAuthResponseAction.PROCEED,
                          );
                        },
                    onProgressChanged:
                        (
                          InAppWebViewController controller,
                          int progress,
                        ) async {
                          setState(() {
                            current = progress / 100;
                          });
                        },
                    onReceivedError: (controller, request, error) {
                      setState(() {
                        errorMessage = error.description;
                        current = 500.0;
                      });
                    },
                    shouldOverrideUrlLoading:
                        (controller, shouldOverrideUrlLoadingRequest) async {
                          if (Platform.isAndroid ||
                              shouldOverrideUrlLoadingRequest.navigationType ==
                                  NavigationType.LINK_ACTIVATED) {
                            controller.loadUrl(
                              urlRequest: URLRequest(
                                url: shouldOverrideUrlLoadingRequest
                                    .request
                                    .url!,
                                headers: widget.headers,
                              ),
                            );
                          }
                          return;
                        },
                  ),
                ),
              ],
            ),
            Visibility(
              visible: current == 500.0 ? true : false,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      webView.reload();
                    },
                    icon: const Icon(Icons.refresh, color: AppColors.primary),
                  ),
                  Center(child: AppTextCaption(text: errorMessage)),
                ],
              ),
            ),
            Visibility(
              visible: current == 1.0 ? false : true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: AppColors.spanishGray.withOpacity(0.7),
                child: Center(child: AppTextCaption(text: "Loading")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
