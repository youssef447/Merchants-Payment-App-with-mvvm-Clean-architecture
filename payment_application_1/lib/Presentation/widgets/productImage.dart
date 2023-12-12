import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payment_application_1/core/utils/sharedAssets.dart';
import 'package:payment_application_1/Presentation/view-model/NavScreens/addProductCubit.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/sharedFunctions.dart';

class ProductImage extends StatefulWidget {
  final BuildContext ctx;
  final AddProductCubit cubit;
  final File? img;

  const ProductImage(
      {super.key, required this.ctx, this.img, required this.cubit});

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  @override
  Widget build(BuildContext context) {
    return widget.img == null
        ? GestureDetector(
            onTap: () async {
              widget.cubit.imgFiles.addAll(
                await pickIamge(ctx: context, source: ImageSource.gallery),
              );

              if (widget.cubit.imgFiles.isNotEmpty) {
                widget.cubit.changeImage();
              }
              //imageFile != null ? setState(() {}) : null;
            },
            child: Container(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? height * 0.2
                  : height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                color: defaultFieldsColor,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      ImageAssets.camera,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Add images',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container(
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? height * 0.2
                : height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: FileImage(widget.img!), fit: BoxFit.cover),
              border: Border.all(color: Colors.blue),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              color: defaultFieldsColor,
            ),
          );
  }
}
