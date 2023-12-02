import 'package:flutter/material.dart';

class BottomAppBarTabItem extends StatelessWidget {
  final int index;
  final IconData icon;
  final String labelText;
  final Color color;
  const BottomAppBarTabItem(
      {super.key,
      required this.index,
      required this.icon,
      required this.labelText,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: color,
          size: 28,
        ),
        Text(
          labelText,
          style:
              Theme.of(context).textTheme.titleSmall!.copyWith(color: color),
        ),
      ],
    );
  }
}
