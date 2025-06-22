import 'dart:convert';
import 'dart:io';

import 'package:ahtizam/src/shared_widgets/custom_appbar.dart';
import 'package:ahtizam/src/shared_widgets/custom_back_arrow_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class PaymentWebViewPage extends StatefulWidget {
  final String redirectUrl;

  const PaymentWebViewPage({super.key, required this.redirectUrl});

  @override
  State<PaymentWebViewPage> createState() => _PaymentWebViewPageState();
}

class _PaymentWebViewPageState extends State<PaymentWebViewPage> {
  late final WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) => _onPageFinished(url),
        ),
      )
      ..loadRequest(Uri.parse(widget.redirectUrl));
    super.initState();
  }

  Future<void> _onPageFinished(String url) async {
    debugPrint('✅ Page loaded: $url');
    try {
      var bodyText = await controller.runJavaScriptReturningResult(
        "document.body.innerText",
      );

      debugPrint('📄 Body content: $bodyText');

      // Remove surrounding quotes if platform wraps them
      if (Platform.isAndroid) {
        if ((bodyText as String).contains('Txn Success')) {
          _handleResult(bodyText);
        }
      }
    } catch (e) {
      debugPrint('❌ Failed to parse response: $e');
    }
  }

  void _handleResult(String bodyText) {
    if (Platform.isAndroid) {
      bodyText = json.decode(bodyText);
    }
    // final Map<String, dynamic> parsedTextBody = json.decode(bodyText);
    final parsed = json.decode(bodyText);

    if (parsed['message'] == 'Txn Success') {
      // Payment successful
      context.maybePop(true); // return true as success flag
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: CustomAppbar(title: "payment_information"),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
