import 'package:flutter/material.dart';

class DefaultImageContainer extends StatelessWidget {
  final Widget widget;
  final double? height;
  final double? width;

  const DefaultImageContainer(
      {required this.widget, super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: widget,
      ),
    );
  }
}
