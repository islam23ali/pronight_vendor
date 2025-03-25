import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../../../core/screen_state/screen_state_layout.dart';
import '../../../../components/custom_scaffold/custom_scaffold.dart';

class WebViewScreen extends StatefulWidget {
  final String _title;
  final String? url;

  const WebViewScreen({
    super.key,
    String title = '', required this.url,
  })  : _title = title;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController webView;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // context.read<SettingViewModel>().setting();
    });
    webView = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://asheer.romozgroup.com')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url??''));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar:CustomAppBar(height: 64.h,
        title: widget._title.tr(),
      ),
      body: ScreenStateLayout(
        // isLoading: data.isLoading ,
          builder: (context) {
            return WebViewWidget(
              controller: webView,
            );
          }
      ),
    );
  }
}