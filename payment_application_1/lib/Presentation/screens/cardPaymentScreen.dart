import 'package:flutter/material.dart';
import 'package:payment_application_1/Presentation/widgets/defaultImageContainer.dart';
import 'package:payment_application_1/core/utils/appColors.dart';
import 'package:payment_application_1/core/utils/sharedAssets.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../core/utils/globales.dart';

class CardPaymentSreen extends StatelessWidget {
  final String payToken;
  CardPaymentSreen({
    super.key,
    required this.payToken,
  });
  final WebViewController _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
  
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );

  @override
  Widget build(BuildContext context) {
    print ( 'https://accept.paymob.com/api/acceptance/iframes/777332?payment_token=$payToken');
    _controller.loadRequest(Uri.parse(
        'https://accept.paymob.com/api/acceptance/iframes/777332?payment_token=$payToken'));
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.defaultColor,
        body: SizedBox(
          child: Column(
            children: [
              DefaultImageContainer(
                widget: Image.asset(
                  ImageAssets.paymob,
                ),
                height: height * 0.3,
              ),
              Text(
                'please fill your card information',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
              Expanded(
                child: WebViewWidget(
                  controller: _controller,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
