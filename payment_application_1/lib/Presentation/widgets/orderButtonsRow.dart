import 'package:flutter/material.dart';

import '../../core/utils/appColors.dart';
import 'defaultButton.dart';

class OrderButtonsRow extends StatelessWidget {
  final double width;
  final Function()? buyOnClicked, cartOnClicked;
  const OrderButtonsRow(
      {super.key, required this.width, this.buyOnClicked, this.cartOnClicked});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: width,
          child: DefaultButton(
            backgroundColor: Colors.grey[200],
            foregroundColor: AppColors.defaultColor,
            sideColor: AppColors.defaultColor,
            raduis: 25,
            onClicked: cartOnClicked,
            child: const Text(
              'Add To Cart',
            ),
          ),
        ),
        SizedBox(
          width: width,
          child: DefaultButton(
            backgroundColor: AppColors.defaultColor,
            raduis: 25,
            foregroundColor: Colors.white,
            onClicked: buyOnClicked,
            child: const Text('Buy Now'),
          ),
        ),
      ],
    );
  }
}
