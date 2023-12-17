import 'package:flutter/material.dart';
import 'package:payment_application_1/Presentation/widgets/portraitProductCard.dart';

import '../../core/utils/constants.dart';
import 'lanscapeProductCard.dart';

class MerchantsProductsList extends StatelessWidget {
  const MerchantsProductsList({super.key});

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            
            scrollDirection:
                orientation == Orientation.landscape
                    ? Axis.horizontal
                    : Axis.vertical,
           physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return orientation == Orientation.landscape?LanscapeProductCard(): PortraitProductCard();
            },
            itemCount: 10,
             itemExtent: orientation == Orientation.landscape
              ? width * 0.6
              : height * 0.43, 
          );
        }
      ),
    );
  }
}
