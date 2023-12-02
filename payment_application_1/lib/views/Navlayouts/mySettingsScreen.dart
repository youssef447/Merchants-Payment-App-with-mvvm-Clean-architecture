import 'package:flutter/material.dart';

class Mysettings extends StatelessWidget {
   const Mysettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Center(),
    );
  }
}
