import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final BuildContext context;
  final FocusNode? focusNode;
  final bool? isPassword;
  final bool? expand;
  final String? helperText;
  final int minLines;
  final int maxLines;
  final TextInputType? type;
  final bool? readOnly;
  final bool? filled;
  final Widget? label;
  final double? radius;
  final Color? fillColor;
  /* final IconData? prefix;
      final IconData? suffix; */
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final String? labelText;
  final bool? borderNone;
  final double padding;
  final String? Function(String?)? validate;
  final Function(String)? onchanged;
  final Function()? suffixPressed;
  final Function()? onTap;
  final String? hintText;
  final bool? enabled;
  const DefaultFormField(
      {super.key,
      required this.controller,
      required this.context,
      this.isPassword,
      this.focusNode,
      this.enabled,
      this.type,
      this.maxLines = 1,
      this.minLines = 1,
      this.readOnly,
      this.filled,
      this.label,
      this.expand,
      this.helperText,
      this.radius,
      this.padding = 20,
      this.fillColor,
      this.onTap,
      this.prefixWidget,
      this.suffixWidget,
      this.labelText,
      this.borderNone,
      this.validate,
      this.onchanged,
      this.suffixPressed,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      controller: controller,

      obscureText: isPassword ?? false,
      keyboardType: type,
      readOnly: readOnly ?? false,
      onTap: onTap,
      onChanged: onchanged,

      minLines: expand != null ? null : minLines,
      maxLines: expand != null ? null : maxLines,
      expands: expand != null ? true : false,
      //style of search text
      style: Theme.of(context).textTheme.titleMedium!,
      //onFieldSubmitted: ((value) => print(contoller.text)),
      focusNode: focusNode,

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Colors.grey),
        helperText: helperText,
        enabled: enabled ?? true,
        label: label,
        helperMaxLines: 2,

        contentPadding: EdgeInsets.all(padding),

        labelStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Colors.black),
        // focusColor: defaultColor,
        labelText: labelText,
        helperStyle: helperText != null
            ? Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: helperText!.startsWith('P')
                      ? Colors.deepOrange
                      : Colors.grey[600],
                )
            : const TextStyle(),

        filled: filled ?? false,

        fillColor: fillColor, // const Color(0xff21203e),
        prefixIcon: prefixWidget,

        prefixIconColor: Theme.of(context).iconTheme.color,

        suffixIcon: suffixWidget,

        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              radius ?? 0,
            )),
        border: UnderlineInputBorder(
            borderSide:
                borderNone != null ? BorderSide.none : const BorderSide(),
            borderRadius: BorderRadius.circular(
              radius ?? 0,
            )),
      ),
    );
  }
}
