import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/extensions.dart';
import 'package:payment_application_1/shared/widgets/passFormField.dart';
import 'package:payment_application_1/shared/widgets/defaultContainer.dart';
import 'package:payment_application_1/views/AuthScreens/logupScreen.dart';


import '../../constants.dart';
import '../../shared/sharedFunctions.dart';
import '../../shared/widgets/defaultButton.dart';
import '../../shared/widgets/defaultFormField.dart';

import '../../view-model/Auth/loginCubit.dart';
import '../../view-model/Auth/loginStates.dart';

class LoginForm extends StatelessWidget {
  late final TextEditingController _emailController;

  late final TextEditingController _passController;
  late final GlobalKey<FormState> _formkey;

  @override
  Widget build(BuildContext context) {
    _formkey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passController = TextEditingController();

    return BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
      
    }, builder: (context, state) {
      LoginCubit cubit = LoginCubit.get(context);

      return DefaultContainer(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    FittedBox(
                      child: Text(
                        globalLocale!.loginPageTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.1,
                    ),
                    DefaultFormField(
                      context: context,
                      controller: _emailController,
                      type: TextInputType.emailAddress,

                      /*  suffixWidget: const Icon(
                                        Icons.email_outlined,
                                      ), */
                      hintText: globalLocale!.emailHintText,
                      filled: true,
                      fillColor: defaultFieldsColor,
                      borderNone: true,
                      radius: 25,
                      validate: (str) {
                        if (str!.isEmpty) {
                          return globalLocale!.emailRequiredWarning;
                        } else if (!str.isValidEmail) {
                          return globalLocale!.emailFormatWarning;
                        } 
                        return null;
                      },
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.05,
                    ),
                    PassFormField(
                      passController: _passController,
                      loginCubit: cubit,
                      helperPassText: cubit.helperText,
                      hintText: globalLocale!.passwordHintText,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              globalLocale!.forgotPassword,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.05,
                    ),
                    state is LoginLoadingState
                        ? const CircularProgressIndicator.adaptive()
                        : DefaultButton(
                            text: globalLocale!.loginText,
                            backgroundColor: defaultColor,
                            foregroundColor: Colors.white,
                            elevation: 10,
                            shadowColor: Colors.black,
                            raduis: 20,
                            onClicked: () {
                              if (_formkey.currentState!.validate()) {
                                cubit.signIn(
                                    ctx: context,
                                    email: _emailController.text,
                                    pass: _passController.text);
                                //navigate to homeScreen
                              } else {}
                            },
                          ),
                  state is LoginLoadingState
                        ? const SizedBox()
                        :   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(globalLocale!.notRegistered),
                        TextButton(
                            onPressed: () {
                              navigate(
                                context,
                                LogupScreen(),
                              );
                            },
                            child: Text(
                              globalLocale!.createAccount,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
