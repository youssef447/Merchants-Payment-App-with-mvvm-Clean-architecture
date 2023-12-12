import 'package:flutter/material.dart';

class DefaultContainer extends StatelessWidget {
  final Widget child;
  final  double? height;
    final  double? width;

  const DefaultContainer({required this.child, super.key,this.width,this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      child: child,
    );
  }
}
