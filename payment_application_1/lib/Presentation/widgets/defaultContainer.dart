import 'package:flutter/material.dart';

import '../../core/utils/appColors.dart';

class DefaultContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  const DefaultContainer(
      {required this.child,
      super.key,
      this.width,
      this.height,
      this.padding,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: color ?? AppColors.defaultFieldsColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: child,
    );
  }
}
