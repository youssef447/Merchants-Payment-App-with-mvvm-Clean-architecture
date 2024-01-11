import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Presentation/widgets/FadeInDown.dart';
import 'package:payment_application_1/core/utils/extensions.dart';
import 'package:payment_application_1/core/utils/sharedAssets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/utils/appColors.dart';
import '../../../../core/utils/globales.dart';
import '../../../../core/utils/sharedFunctions.dart';
import '../../../view-model/Auth/loginCubit.dart';
import '../../../view-model/Auth/loginStates.dart';
import '../../../widgets/defaultButton.dart';
import '../../../widgets/defaultContainer.dart';
import '../../../widgets/defaultFormField.dart';
import '../../../widgets/passFormField.dart';
import '../LogupPage/logupScreen.dart';
part 'loginForm.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    globalLocale ??= AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors. defaultColor,
      //appBar: AppBar(title: const Text('PAYMENT app')),
      body: BlocProvider<LoginCubit>(
        // lazy: false,
        create: (_) => LoginCubit(),
        child: SafeArea(
          child: OrientationBuilder(builder: (context, orientation) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Image.asset(
                    ImageAssets.paymob,
                    //width: double.infinity,
                    height: orientation == Orientation.portrait
                        ? height * 0.27
                        : width * 0.17,

                    fit: BoxFit.cover,
                  ),
                ),
                const SliverFillRemaining(
                  child: FadeInDown(
                    child: DefaultContainer(
                    
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 18.0, right: 18.0, bottom: 5),
                        child: LoginForm(),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
