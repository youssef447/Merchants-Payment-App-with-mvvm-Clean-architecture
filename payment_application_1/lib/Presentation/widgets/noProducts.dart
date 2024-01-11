import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/sharedAssets.dart';
import 'FadeInDown.dart';

class NoProductsScreen extends StatelessWidget {
  final Orientation orientation;
  const NoProductsScreen({super.key, required this.orientation});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No Products yet',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 0.5,
              child: Lottie.asset(
                AnimsAssets.products,
                fit: BoxFit.contain,
                frameRate: FrameRate(100),
                repeat: false
              ),
            ),
          ),
        ],
      ),
    );
  }
}
