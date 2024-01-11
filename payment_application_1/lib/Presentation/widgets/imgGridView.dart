import 'package:flutter/material.dart';
import 'package:payment_application_1/Presentation/view-model/NavScreens/addProductCubit.dart';

import 'productImage.dart';

class ImgGridView extends StatelessWidget {
  final int itemCount;
  final AddProductCubit cubit;
  const ImgGridView({super.key, required this.itemCount, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: itemCount + 1,
      itemBuilder: (context, index) {
        return index == itemCount
            ? ProductImage(
                ctx: context,
                cubit: cubit,
              )
            : Stack(
                alignment: Alignment.topRight,
                children: [
                  ProductImage(
                    ctx: context,
                    cubit: cubit,
                    img: cubit.imgFiles[index],
                  ),
                  IconButton(
                    onPressed: () {
                      cubit.imgFiles.removeAt(index);

                      cubit.changeImage();
                    },
                    icon: const Icon(
                      Icons.cancel_rounded,
                    ),
                  )
                ],
              );
      },
    );
  }
}
