import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';

import '../../core/utils/constants.dart';

class InputQtyWidget extends StatelessWidget {
  final Function(dynamic)? onQtyChanged;
  final Color? fillColor;
  final bool? messageBuilder;

  const InputQtyWidget(
      {super.key, this.onQtyChanged, this.fillColor, this.messageBuilder});

  @override
  Widget build(BuildContext context) {
    return InputQty.int(
      qtyFormProps: const QtyFormProps(
        enableTyping: false,
      ),
      messageBuilder: messageBuilder != null
          ? (minVal, maxVal, value) => FittedBox(
                child: Text(
                  'Quantity',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              )
          : null,
      decoration: QtyDecorationProps(
        fillColor: fillColor,
        btnColor: defaultColor,
        isBordered: false,
        contentPadding: fillColor == null
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(vertical: 10),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        width: 20,
        borderShape: BorderShapeBtn.circle,
      ),
      initVal: 1,
      minVal: 1,
      onQtyChanged: onQtyChanged,
    );
  }
}
