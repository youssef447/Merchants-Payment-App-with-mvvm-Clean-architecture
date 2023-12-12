import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Presentation/widgets/FadeInDown.dart';
import 'package:payment_application_1/core/utils/sharedAssets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/utils/constants.dart';
import '../../view-model/Auth/loginCubit.dart';
import '../../widgets/loginForm.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    globalLocale??=AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: defaultColor,
      //appBar: AppBar(title: const Text('PAYMENT app')),
      body: BlocProvider<LoginCubit>(
        // lazy: false,
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
