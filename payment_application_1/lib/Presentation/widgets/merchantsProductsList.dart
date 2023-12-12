import 'package:flutter/material.dart';
import 'package:payment_application_1/Presentation/widgets/productCard.dart';

class MerchantsProductsList extends StatelessWidget {
  const MerchantsProductsList({super.key});

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        
        scrollDirection:
            MediaQuery.of(context).orientation == Orientation.landscape
                ? Axis.horizontal
                : Axis.vertical,
       physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return ProductCard();
        },
        itemCount: 10,
      ),
    );
  }
}
