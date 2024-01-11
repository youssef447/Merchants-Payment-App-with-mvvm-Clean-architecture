import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/utils/appColors.dart';

class ImagesPageView extends StatelessWidget {
  final PageController controller;
  final Widget Function(BuildContext, int) itemBuilder;
  final double? height;
  final double? width;
  final int itemCount;
  const ImagesPageView(
      {super.key,
      this.height,
      this.width,
      required this.itemBuilder,
      required this.controller,
      required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: itemCount,
              controller: controller,
              itemBuilder: itemBuilder,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SmoothPageIndicator(
              controller: controller,
              count: itemCount,
              effect: const ExpandingDotsEffect(
                spacing: 15, //المساحة بينهم
                dotHeight: 5, // كل ما يزيد هياخد شكل مستطيل كدا
                activeDotColor: AppColors.defaultColor,
                dotWidth: 16, // كل ما يزيد هياخد شكل مستطيل كدا
              ),
            ),
          ),
        ],
      ),
    );
  }
}
