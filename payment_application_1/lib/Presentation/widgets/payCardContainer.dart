import 'package:flutter/material.dart';

import '../../core/utils/appColors.dart';

class PayCardContainer extends StatelessWidget {
  final double width, height;
  final String assetImg, title;
  const PayCardContainer({
    super.key,
    required this.width,
    required this.height,
    required this.assetImg,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: AppColors.defaultColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      height: height,
      padding: const EdgeInsets.all(10),
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              assetImg,
              width: constraints.maxWidth * 0.2,
              fit: BoxFit.cover,
            ),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
            const Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        );
      }),
    );
  }
}
