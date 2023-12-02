import 'package:flutter/material.dart';

class MerchantsProductsList extends StatelessWidget {
  const MerchantsProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Text("hello $index");
        },
        itemCount: 10,
      ),
    );
  }
}
