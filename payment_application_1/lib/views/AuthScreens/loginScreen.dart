import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/shared/widgets/FadeInDown.dart';
import 'package:payment_application_1/shared/sharedAssets.dart';

import 'package:payment_application_1/views/AuthScreens/loginForm.dart';

import '../../constants.dart';
import '../../view-model/Auth/loginCubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      //appBar: AppBar(title: const Text('PAYMENT app')),
      body: BlocProvider<LoginCubit>(
        lazy: false,
        create: (_) => LoginCubit(),
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
              Expanded(
                child: FadeInDown(child: LoginForm()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
