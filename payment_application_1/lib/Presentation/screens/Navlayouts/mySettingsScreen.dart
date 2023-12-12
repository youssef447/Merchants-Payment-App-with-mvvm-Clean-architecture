import 'package:firebase_auth/firebase_auth.dart';
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
      body: Center(
        child: IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout_rounded)),
      ),
    );
  }
}
