import 'package:flutter/material.dart';
import 'package:payment_application_1/Presentation/screens/orderView/orderScreen.dart';
import 'package:payment_application_1/Presentation/widgets/orderButtonsRow.dart';
import 'package:payment_application_1/core/utils/sharedAssets.dart';
import 'package:payment_application_1/core/utils/sharedFunctions.dart';

import '../../Data/models/Order Registration API/response/OrderApiResponseModel.dart';
import '../../core/utils/appColors.dart';
import 'defaultCachedImage.dart';

import 'defaultImageContainer.dart';
import 'imagesPageView.dart';

class PortraitProductCard extends StatefulWidget {
  final OrderApiResponseModel orders;

  const PortraitProductCard(this.orders, {super.key});

  @override
  State<PortraitProductCard> createState() => _PortraitProductCardState();
}

class _PortraitProductCardState extends State<PortraitProductCard> {
  int currentIndex = 0;
  PageController pagecontroller = PageController();
  double offset = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.defaultFieldsColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return InkWell(
              onTap: () => navigate(context, OrderScreen(widget.orders)),
              child: Column(
                children: [
                  widget.orders.imgsUrl.isEmpty
                      ? DefaultImageContainer(
                          widget: Image.asset(ImageAssets.camera),
                          height: constraints.maxHeight * 0.5,
                        )
                      : widget.orders.imgsUrl.length == 1
                          ? SizedBox(
                              height: constraints.maxHeight * 0.5,
                              child: DefaultImageContainer(
                                height: constraints.maxHeight * 0.5,
                                width: constraints.maxWidth,
                                widget: DefaultCachedImage(
                                  imgUrl: widget.orders.imgsUrl[0],
                                ),
                              ))
                          : ImagesPageView(
                              height: constraints.maxHeight * 0.55,
                              width: constraints.maxWidth,
                              itemBuilder: (context, index) {
                                return DefaultImageContainer(
                                  widget: DefaultCachedImage(
                                    imgUrl: widget.orders.imgsUrl[index],
                                  ),
                                );
                              },
                              controller: pagecontroller,
                              itemCount: widget.orders.imgsUrl.length,
                            ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(widget.orders.item[0].name,
                            style: Theme.of(context).textTheme.titleLarge),
                        Text(widget.orders.item[0].description ?? '',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.titleMedium),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${widget.orders.amountCents} ${widget.orders.currency}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'Available: ${widget.orders.item[0].quantity}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        OrderButtonsRow(
                          width: constraints.maxWidth * 0.35,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
