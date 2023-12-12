import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/core/utils/extensions.dart';
import 'package:payment_application_1/Presentation/screens/AuthScreens/logupScreen.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/sharedFunctions.dart';

import '../view-model/Auth/loginCubit.dart';
import '../view-model/Auth/loginStates.dart';
import 'defaultButton.dart';
import 'defaultContainer.dart';
import 'passFormField.dart';
import 'defaultFormField.dart';

class LoginForm extends StatelessWidget {
  late final TextEditingController _emailController;

  late final TextEditingController _passController;
  late final GlobalKey<FormState> _formkey;

  @override
  Widget build(BuildContext context) {
    _formkey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passController = TextEditingController();

    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);

        return DefaultContainer(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: _formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
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
                          height: constraints.maxHeight * 0.04,
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
                              onPressed: () {
                                //FOROGT PASSWORD
                              },
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  globalLocale!.forgotPassword,
                                ),
                              ),
                            ),
                          ],
                        ),
                        state is LoginLoadingState
                            ? const CircularProgressIndicator.adaptive()
                            : DefaultButton(
                                backgroundColor: defaultColor,
                                foregroundColor: Colors.white,
                                elevation: 10,
                                shadowColor: Colors.black,
                                raduis: 20,
                                onClicked: () {
                                  if (_formkey.currentState!.validate()) {
                                    //OTP Done Before Signing In
                                    cubit.signIn(
                                        ctx: context,
                                        email: _emailController.text,
                                        pass: _passController.text);
                                  } else {}
                                },
                                child: Text(globalLocale!.loginText),
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              globalLocale!.notRegistered,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                navigate(
                                  context,
                                  LogupScreen(),
                                );
                              },
                              child: Text(
                                globalLocale!.createAccount,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Divider(
                              color: Colors.grey[300],
                              endIndent: 10,
                            )),
                            Text(
                              'Or connect using',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey[300],
                                indent: 10,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.01,
                        ),
                        state is GoogleLoginLoadingState
                            ? const CircularProgressIndicator.adaptive()
                            : DefaultButton(
                                backgroundColor: defaultFieldsColor,
                                foregroundColor: Colors.black,
                                elevation: 5,
                                shadowColor: Colors.black,
                                raduis: 20,
                                onClicked: () {
                                  //OTP Done Before Signing In
                                  cubit.signInWithGoogle(
                                    ctx: context,
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.network(
                                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                    const Text('Sign in with Google'),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
