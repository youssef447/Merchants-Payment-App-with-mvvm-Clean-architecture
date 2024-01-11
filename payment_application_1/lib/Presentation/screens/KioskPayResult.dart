import 'package:flutter/material.dart';
import 'package:payment_application_1/Presentation/screens/homeScreen.dart';
import 'package:payment_application_1/Presentation/widgets/defaultButton.dart';
import 'package:payment_application_1/core/utils/appColors.dart';
import 'package:payment_application_1/core/utils/sharedAssets.dart';

import '../../core/utils/globales.dart';

class KioskPayResult extends StatefulWidget {
  final String ref;
  const KioskPayResult({super.key, required this.ref});

  @override
  State<KioskPayResult> createState() => _KioskPayResultState();
}

class _KioskPayResultState extends State<KioskPayResult> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Transaction Done Successfully',
                style: Theme.of(context).textTheme.titleLarge!,
              ),
              SizedBox(
                height: height * 0.5,
                child: Image.asset(ImageAssets.kiosk),
              ),
              Text(
                'Your bill reference is',
                style: Theme.of(context).textTheme.titleLarge!,
              ),
              Text(
                '#${widget.ref}',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                    ),
              ),
              DefaultButton(
                backgroundColor: AppColors.defaultColor,
                raduis: 50,
                child: const Text(
                  'GO HOME',
                ),
                onClicked: () {
             Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const HomeScreen(),
                    ),
                    (route) => false,
                  ); 
                
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
