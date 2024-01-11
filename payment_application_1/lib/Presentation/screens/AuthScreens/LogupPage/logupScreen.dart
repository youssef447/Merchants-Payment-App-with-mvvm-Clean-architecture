import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:payment_application_1/core/utils/extensions.dart';
import 'package:payment_application_1/Presentation/view-model/Auth/logupCubit.dart';
import '../../../../core/utils/appColors.dart';
import '../../../../core/utils/globales.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../core/utils/sharedAssets.dart';
import '../../../../core/utils/sharedFunctions.dart';
import '../../../widgets/FadeInDown.dart';
import '../../../widgets/defaultContainer.dart';
import '../otpScreen.dart';
import '../../../widgets/defaultButton.dart';
import '../../../widgets/passFormField.dart';

import '../../../view-model/Auth/logupStates.dart';
import '../../../widgets/defaultFormField.dart';
part 'logupForm.dart';

class LogupScreen extends StatelessWidget {
  LogupScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    globalLocale ??= AppLocalizations.of(context)!;

    return Scaffold(
        backgroundColor:AppColors.  defaultColor,
        //appBar: AppBar(title: const Text('PAYMENT app')),
        body: BlocProvider<LogupCubit>(
          create: (_) => LogupCubit(),
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
                          padding:  EdgeInsets.only(
                              left: 18.0, right: 18.0, bottom: 5),
                          child: LogupForm(),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ));
  }
}
