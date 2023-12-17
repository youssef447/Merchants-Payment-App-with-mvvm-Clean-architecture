import 'package:flutter/material.dart';
import 'package:payment_application_1/core/utils/constants.dart';

import 'defaultButton.dart';
import 'defaultCachedImage.dart';
import 'inputQty.dart';

class PortraitProductCard extends StatelessWidget {
  PortraitProductCard({super.key});
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                SizedBox(
               height: constraints.maxHeight * 0.5,
               width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: const DefaultCachedImage(
                      imgUrl:
                          'https://www.dexerto.es/cdn-cgi/image/width=3840,quality=75,format=auto/https://editors.dexerto.es/wp-content/uploads/sites/3/2021/09/20/jett-valorant-nerfs.jpg',
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Title',
                          style: Theme.of(context).textTheme.titleLarge),
                      Expanded(
                        child: Text(
                            'description description description description description description description description description description description description description description description description description description description description description description description description ',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                      SizedBox(
                        height:  constraints.maxHeight * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '200\$',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            InputQtyWidget(
                              onQtyChanged: (val) {
                                quantity = val;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height:  constraints.maxHeight * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * 0.35,
                              child: DefaultButton(
                                backgroundColor: Colors.grey[200],
                                foregroundColor: defaultColor,
                                sideColor: defaultColor,
                                raduis: 25,
                                onClicked: () {},
                                child: const Text(
                                  'Add To Cart',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.35,
                              child: DefaultButton(
                                backgroundColor: defaultColor,
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
              ],
            );
          },
        ),
      ),
    );
  }
}
