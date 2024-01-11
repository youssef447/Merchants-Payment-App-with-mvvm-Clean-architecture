import 'package:flutter/material.dart';
import 'package:payment_application_1/Presentation/widgets/defaultImageContainer.dart';
import 'package:payment_application_1/core/utils/appColors.dart';
import 'package:payment_application_1/core/utils/sharedAssets.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../core/utils/globales.dart';

class MobileWalletScreen extends StatelessWidget {
  final String url;
  MobileWalletScreen({
    super.key,
    required this.url,
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
    _controller.loadRequest(Uri.parse(url));
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
                'please fill the following information',
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
