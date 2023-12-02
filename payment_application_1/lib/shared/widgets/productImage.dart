import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payment_application_1/view-model/addProductCubit.dart';

import '../../constants.dart';
import '../sharedFunctions.dart';
import '../sharedAssets.dart';

class ProductImage extends StatefulWidget {
  final BuildContext ctx;
  final AddProductCubit cubit;

  const ProductImage({required this.cubit, super.key, required this.ctx});

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        widget.cubit.imageFile =
            await pickIamge(ctx: context, source: ImageSource.gallery);
        if (widget.cubit.imageFile != null) {
          widget.cubit.changeImage();
        }
        //imageFile != null ? setState(() {}) : null;
      },
      child: Container(
        height: MediaQuery.of(context).orientation == Orientation.portrait
            ? height * 0.25
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
            widget.cubit.imageFile != null
                ? Image.file(
                    widget.cubit.imageFile!,
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? height * 0.25 * 0.8
                        : height * 0.25,
                  )
                : Image.asset(
                    ImageAssets.camera,
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? height * 0.25 * 0.8
                        : height * 0.25,
                  ),
            Expanded(
              child: Text(
                'Tap here to add an image',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
