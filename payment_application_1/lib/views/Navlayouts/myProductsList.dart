import 'package:flutter/material.dart';

class MyProductsList extends StatelessWidget {
  const MyProductsList({super.key});

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
