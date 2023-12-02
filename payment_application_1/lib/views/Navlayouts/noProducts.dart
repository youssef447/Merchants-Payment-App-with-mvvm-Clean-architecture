import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constants.dart';
import '../../shared/sharedAssets.dart';
import '../../shared/widgets/FadeInDown.dart';

class NoProductsScreen extends StatelessWidget {
  const NoProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FadeInDown(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No Products Yet',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: (height - kBottomNavigationBarHeight) * 0.5,
              child: Lottie.asset(
                AnimsAssets.products,
                frameRate: FrameRate(200),
                repeat: true,
                width: width * 0.6,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
