import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/sharedAssets.dart';
import 'FadeInDown.dart';

class NoHistory extends StatelessWidget {
  const NoHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FadeInDown(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No Transactions Yet',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: (height - kBottomNavigationBarHeight) * 0.5,
              child: Lottie.asset(
                AnimsAssets.transactions,
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
