import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:pronight_vendor/core/screen_state/screen_state_layout.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';

class WebViewScreen extends StatefulWidget {
  final String _title;
  final String? url;

  const WebViewScreen({
    super.key,
    String title = '',
    required this.url,
  }) : _title = title;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  InAppWebViewController? webViewController;


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        height: 64.h,
        title: widget._title.tr()
      ),
      body: ScreenStateLayout(
        builder: (context) {
          return InAppWebView(
            initialUrlRequest:
            URLRequest(url: WebUri(widget.url ?? '')),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                javaScriptEnabled: true,
                useShouldOverrideUrlLoading: true,
              ),
            ),
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            onLoadStart: (controller, url) {
              setState((){});
            },
            onLoadStop: (controller, url) async {
              setState(() {});
            },
            shouldOverrideUrlLoading:
                (controller, navigationAction) async {
              // final uri = navigationAction.request.url;
              // if (uri.toString().startsWith('https://asheer.romozgroup.com')) {
              //   return NavigationActionPolicy.CANCEL;
              // }
              return NavigationActionPolicy.ALLOW;
            },
          );
        },
      ),
    );
  }
}
