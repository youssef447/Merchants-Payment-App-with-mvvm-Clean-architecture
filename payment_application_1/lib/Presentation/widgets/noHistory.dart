import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/sharedAssets.dart';
import 'FadeInDown.dart';

class NoHistory extends StatelessWidget {
  const NoHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No Transactions Yet',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Flexible(
              child: FractionallySizedBox(
                widthFactor: 0.5,
                heightFactor: 0.5,
                child: Lottie.asset(
                  AnimsAssets.transactions,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
