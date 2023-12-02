import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Function()? onClicked;
  final double? elevation;
  final Color? shadowColor;
  final Color? foregroundColor;
  final Color? backgroundColor;

  final Color? sideColor;
  final double? raduis;
  final String text;

  const DefaultButton(
      {super.key,
      this.onClicked,
      this.backgroundColor,
      this.elevation,
      this.foregroundColor,
      this.shadowColor,
      required this.text,
      this.sideColor,
      this.raduis});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(elevation ?? 0),
        shadowColor:
            MaterialStateProperty.all<Color>(shadowColor ?? Colors.white),
        foregroundColor:
            MaterialStateProperty.all<Color>(foregroundColor ?? Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(raduis ?? 0),
            side: BorderSide(
              color: sideColor ?? Colors.transparent,
            ),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 50),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color>(backgroundColor ?? Colors.black),
      ),
      onPressed: onClicked,
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
