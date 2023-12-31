import 'package:flutter/material.dart';

import '../../core/utils/appColors.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;
  final Function() retry;
  const ErrorScreen(
      {super.key, required this.errorMessage, required this.retry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'error getting Data, $errorMessage',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed: () {
            retry();
          },
          child: Text(
            'Refresh',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppColors.defaultColor),
          ),
        ),
      ],
    );
  }
}
