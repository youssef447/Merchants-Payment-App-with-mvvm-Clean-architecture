import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/shared/widgets/FadeInDown.dart';
import 'package:payment_application_1/views/AuthScreens/logupForm.dart';

import '../../constants.dart';
import '../../shared/sharedAssets.dart';
import '../../view-model/Auth/logupCubit.dart';



class LogupScreen extends StatelessWidget {
  LogupScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        backgroundColor: defaultColor,
        //appBar: AppBar(title: const Text('PAYMENT app')),
        body:  BlocProvider<LogupCubit>(
            lazy: false,
            create: (_) => LogupCubit(),
          
        
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.27,
                  child: Image.asset(
                    ImageAssets.paymob,
                    width: double.infinity,
                  ),
                ),
                Expanded(child: FadeInDown(child: LogupForm())),
              ],
            ),
          ),
        ));
  }
}
