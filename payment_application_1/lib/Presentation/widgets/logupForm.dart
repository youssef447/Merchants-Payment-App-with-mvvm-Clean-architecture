import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:payment_application_1/core/utils/extensions.dart';
import 'package:payment_application_1/Presentation/view-model/Auth/logupCubit.dart';
import '../../core/utils/constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'defaultButton.dart';
import 'defaultContainer.dart';
import 'passFormField.dart';

import '../view-model/Auth/logupStates.dart';
import 'defaultFormField.dart';

class LogupForm extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passController = TextEditingController();

  final TextEditingController _passController2 = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  LogupForm({super.key});

  @override
  Widget build(BuildContext context) {
    PhoneNumber? phoneNumber;
    return BlocConsumer<LogupCubit, LogupStates>(
      listener: (context, state) {},
      builder: (context, state) {
        LogupCubit cubit = LogupCubit.get(context);
        return DefaultContainer(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: _formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(children: [
                      FittedBox(
                        child: Text(
                          globalLocale!.logupPageTitle,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.1,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: DefaultFormField(
                              controller: _firstNameController,
                              context: context,
                              hintText: "first name",
                              filled: true,
                              fillColor: defaultFieldsColor,
                              borderNone: true,
                              radius: 25,
                              validate: (str) {
                                if (str!.isEmpty) {
                                  return globalLocale!.firstNameRequiredText;
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.05,
                          ),
                          Expanded(
                            child: DefaultFormField(
                              controller: _lastNameController,
                              context: context,
                              borderNone: true,
                              filled: true,
                              hintText: "last name",
                              radius: 25,
                              fillColor: defaultFieldsColor,
                              validate: (str) {
                                if (str!.isEmpty) {
                                  return globalLocale!.lastNameRequiredText;
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      DefaultFormField(
                        context: context,
                        controller: _emailController,
                        type: TextInputType.emailAddress,
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
                        logupCubit: cubit,
                        hintText: globalLocale!.passwordHintText,
                        helperPassText: cubit.helperText1,
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      PassFormField(
                        passController: _passController2,
                        logupCubit: cubit,
                        hintText: globalLocale!.passwordHintText,
                        secondPassField: true,
                        pass1: cubit.pass1,
                        helperPassText: cubit.helperText2,
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      IntlPhoneField(
                        invalidNumberMessage: globalLocale!.phoneInvalidText,
                        decoration: InputDecoration(
                          fillColor: defaultFieldsColor,
                          filled: true,
                          prefixIconColor: defaultColor,
                          labelText: globalLocale!.phoneNumber,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                        ),
                        initialCountryCode: 'IN',
                        onChanged: (phone) {
                          phoneNumber = phone;
                        },
                      ),
                      cubit.phoneRequiredMessage
                          ? Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 25.0),
                                child: Text(
                                  globalLocale!.phoneNumberRequired,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: const Color.fromARGB(
                                              255, 227, 52, 39)),
                                ),
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      state is LogupLoadingState
                          ? const CircularProgressIndicator.adaptive()
                          : DefaultButton(
                              backgroundColor: defaultColor,
                              foregroundColor: Colors.white,
                              elevation: 10,
                              shadowColor: Colors.black,
                              raduis: 20,
                              onClicked: () {
                                if (phoneNumber == null) {
                                  cubit.showPhoneRequiredMessage(true);
                                } else if (phoneNumber != null) {
                                  if (phoneNumber!.number.isEmpty) {
                                    cubit.showPhoneRequiredMessage(true);
                                  } else {
                                    cubit.showPhoneRequiredMessage(false);
                                  }
                                }
                                if (_formkey.currentState!.validate()) {
                                  //if (phoneNumber!.isValidNumber()) {
                                  cubit.signup(
                                      firstName: _firstNameController.text,
                                      lastName: _lastNameController.text,
                                      phone: phoneNumber!.completeNumber,
                                      ctx: context,
                                      email: _emailController.text,
                                      pass: _passController.text);
                                  // }
                                }
                              },
                              child: Text(globalLocale!.logupText),
                            ),
                    ]),
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
