import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';

import '../../core/utils/appColors.dart';

class InputQtyWidget extends StatelessWidget {
  final Function(dynamic)? onQtyChanged;
  final Color? fillColor;
  final bool? messageBuilder;
  final String? msgText;
    final int? maxVal;


  const InputQtyWidget(
      {super.key, this.onQtyChanged, this.fillColor, this.messageBuilder,this.msgText, this.maxVal});

  @override
  Widget build(BuildContext context) {
    return InputQty.int(
      qtyFormProps: const QtyFormProps(
        enableTyping: false,
        
      ),
      maxVal: maxVal??double.maxFinite,
      messageBuilder: messageBuilder != null
          ? (minVal, maxVal, value) => FittedBox(
                child: Text(
                  msgText??'Quantity',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              )
          : null,
      decoration: QtyDecorationProps(
        width: 20,
        fillColor: fillColor,
        btnColor: AppColors. defaultColor,
        isBordered: false,
        contentPadding: fillColor == null
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(
                vertical: 10,
              ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        borderShape: BorderShapeBtn.circle,
      ),
      initVal: 1,
      minVal: 1,
      onQtyChanged: onQtyChanged,
    );
  }
}
