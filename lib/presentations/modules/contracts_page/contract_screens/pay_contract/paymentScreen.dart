
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contracts_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../injection.dart';
import '../widget/success_payed_sheet.dart';

class PaymentWebView extends StatefulWidget {
  final String paymentLink;
  final String successLink;
  final String failedLink;
  final String contractId;

  const PaymentWebView({
    super.key,
    required this.paymentLink,
    required this.successLink,
    required this.failedLink,
    required this.contractId,
  });

  @override
  _PaymentWebViewState createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  ContractViewModel provider = getIt();
  late WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'FlutterChannel',
        onMessageReceived: (JavaScriptMessage message) {
          print('JavaScript message: ${message.message}');
        },
      )
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onUrlChange: (s) {

          },

          onProgress: (int progress) {
            setState(() {
              _isLoading = progress < 100;
            });
          },
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
            if (url == widget.successLink||url==widget.failedLink) {
              if (url == widget.successLink){
                NavigatorHandler.pop();
                showSuccessPayedSheet();
                provider.oneContractDetails(widget.contractId);

                // NavigatorHandler.pushAndRemoveUntil( PropertiesDetailsScreen(id: int.tryParse(widget.id)??0,isMy: true));

              }
              // Future.delayed(const Duration(seconds: 2)).then((onValue){
              //   Navigator.pop(context);
              // });
            }
          },
          onWebResourceError: (WebResourceError error) {

          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url == widget.successLink) {
              return NavigationDecision.navigate;
            } else if (request.url == widget.failedLink) {
              Future.delayed(const Duration(seconds: 2)).then((onValue){
                // NavigatorHandler.pushAndRemoveUntil(const MainScreen());
              });
              return NavigationDecision.navigate;
            }
            return NavigationDecision.navigate;
          },

        ),
      )
      ..loadRequest(Uri.parse(widget.paymentLink));

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: _controller),
        if (_isLoading)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
  Future<dynamic> showSuccessPayedSheet() async {
    return  showModalBottomSheet(
      // isDismissible: false,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        context: context,

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(36.r),
            )),
        builder: (BuildContext context) {
          return const SuccessPayedSheet();
        });}
}

