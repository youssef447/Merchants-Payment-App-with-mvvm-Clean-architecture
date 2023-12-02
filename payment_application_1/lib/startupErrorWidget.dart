import 'package:flutter/material.dart';

class AppstartupErrorWidget extends StatelessWidget {
  final String errMessage;
  const AppstartupErrorWidget(
    this.errMessage, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            errMessage,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
