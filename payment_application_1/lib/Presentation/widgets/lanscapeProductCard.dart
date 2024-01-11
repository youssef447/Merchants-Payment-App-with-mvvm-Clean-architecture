import 'package:flutter/material.dart';

import '../../Data/models/Order Registration API/response/OrderApiResponseModel.dart';
import '../../core/utils/appColors.dart';
import 'defaultButton.dart';
import 'defaultCachedImage.dart';
import 'defaultImageContainer.dart';

class LanscapeProductCard extends StatelessWidget {
  final OrderApiResponseModel orders;
  const LanscapeProductCard(this.orders, {super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultImageContainer(
                widget: const DefaultCachedImage(
                  imgUrl:
                      'https://www.dexerto.es/cdn-cgi/image/width=3840,quality=75,format=auto/https://editors.dexerto.es/wp-content/uploads/sites/3/2021/09/20/jett-valorant-nerfs.jpg',
                ),
                height: double.infinity,
                width: constraints.maxWidth * 0.4,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Title',
                          style: Theme.of(context).textTheme.titleLarge),
                      Text(orders.item[0].description ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.titleMedium),
                      SizedBox(
                        height: constraints.maxHeight * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${orders.item[0].amountCents} ${orders.currency}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'Available: ${orders.item[0].quantity}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * 0.25,
                              child: DefaultButton(
                                backgroundColor: Colors.grey[200],
                                foregroundColor: AppColors.defaultColor,
                                sideColor: AppColors.defaultColor,
                                raduis: 25,
                                onClicked: () {},
                                child: const Text(
                                  'Add To Cart',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.25,
                              child: DefaultButton(
                                backgroundColor: AppColors.defaultColor,
                                raduis: 25,
                                foregroundColor: Colors.white,
                                onClicked: () {},
                                child: const Text('Buy Now'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
