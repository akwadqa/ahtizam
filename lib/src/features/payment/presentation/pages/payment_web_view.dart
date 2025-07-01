import 'dart:convert';
import 'dart:io';

import 'package:ahtizam/src/shared_widgets/custom_appbar.dart';
import 'package:ahtizam/src/shared_widgets/custom_back_arrow_widget.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class PaymentWebViewPage extends StatefulWidget {
  final String redirectUrl;
  final void Function(bool success)? onResult;

  const PaymentWebViewPage({super.key, required this.redirectUrl, this.onResult});

  @override
  State<PaymentWebViewPage> createState() => _PaymentWebViewPageState();
}
class _PaymentWebViewPageState extends State<PaymentWebViewPage> {
  late final WebViewController controller;
  bool _hasCompleted = false; // 👈 prevent double-pop

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: _onPageFinished,
          onProgress: (progress) {
            FadeCircleLoadingIndicator();
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.redirectUrl));
  }

  Future<void> _onPageFinished(String url) async {
    debugPrint('✅ Page loaded: $url');

    try {
      var bodyText = await controller.runJavaScriptReturningResult(
        "document.body.innerText",
      );

      debugPrint('📄 Body content: $bodyText');

      if (Platform.isAndroid && (bodyText as String).contains('Txn Success')) {
        _handleResult(bodyText);
      }
    } catch (e) {
      debugPrint('❌ Failed to parse response: $e');
    }
  }

void _handleResult(String rawBody) {
  if (_hasCompleted) return;
  _hasCompleted = true;

  try {
    final bodyStr = rawBody.toString();

    // 1. Remove surrounding quotes if needed (on Android)
    final unquoted = bodyStr.startsWith('"') ? json.decode(bodyStr) : bodyStr;

    // 2. Parse the inner JSON string
    final parsed = json.decode(unquoted);

    if (parsed['message'] == 'Txn Success') {
      widget.onResult?.call(true);
      context.maybePop(true); // ✅ Return to success screen
    } else {
      debugPrint("⚠️ Payment failed or unknown response: $parsed");
      widget.onResult?.call(false);
      context.maybePop(false); // optional: go back with failure
    }
  } catch (e) {
    debugPrint("❌ Failed to decode or handle result: $e");
    widget.onResult?.call(false);
    context.maybePop(false);
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
