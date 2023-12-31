import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:payment_application_1/Presentation/widgets/defaultButton.dart';

import '../../../core/utils/appColors.dart';
import '../../../core/utils/globales.dart';
import '../../../core/utils/sharedAssets.dart';
import '../../view-model/Auth/OtpCubit.dart';
import '../../view-model/Auth/OtpStates.dart';
import '../../widgets/FadeInDown.dart';
import '../../widgets/defaultContainer.dart';

class OTPScreen extends StatelessWidget {
  final String phoneNumber;
  const OTPScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? codeInput;

    return BlocProvider(
        create: (context) => OtpCubit()
          ..sendOTPRequest(phoneNumber: phoneNumber, context: context),
        child: BlocConsumer<OtpCubit, OtpStates>(
          listener: (BuildContext context, OtpStates state) {},
          builder: (BuildContext context, OtpStates state) {
            OtpCubit cubit = OtpCubit.get(context);
            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: AppColors. defaultColor,
              body: SafeArea(
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
                      SliverFillRemaining(
                        child: FadeInDown(
                          child: DefaultContainer(
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return state is OtpSentLoadingState
                                    ? const Center(
                                        child: LinearProgressIndicator(
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18.0,
                                            right: 18.0,
                                            bottom: 10),
                                        child: Center(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Verification'.toUpperCase(),
                                                  style: GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 30),
                                                ),
                                                Text('code',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                SizedBox(
                                                    height:
                                                        constraints.maxHeight *
                                                            0.05),
                                                Text(
                                                    "Enter the verification code sent To",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium),
                                                Text(phoneNumber,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                SizedBox(
                                                    height:
                                                        constraints.maxHeight *
                                                            0.1),
                                                OtpTextField(
                                                  numberOfFields: 6,
                                                  fillColor: AppColors. defaultColor
                                                      .withOpacity(0.2),
                                                  filled: true,
                                                  focusedBorderColor:
                                                      AppColors. defaultColor,
                                                  enabledBorderColor:
                                                      Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(11),
                                                  showFieldAsBox: true,
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge,
                                                  onSubmit: (value) {
                                                    print(
                                                        'subbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb $value');

                                                    codeInput = value;
                                                  },
                                                ),
                                                SizedBox(
                                                    height:
                                                        constraints.maxHeight *
                                                            0.04),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text('OTP not recieved?',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium),
                                                    state
                                                            is OtpResentLoadingState
                                                        ? const CircularProgressIndicator
                                                            .adaptive()
                                                        : TextButton(
                                                            onPressed:
                                                                () async {
                                                              cubit.resendOTP(
                                                                phoneNumber:
                                                                    phoneNumber,
                                                                context:
                                                                    context,
                                                              );
                                                            },
                                                            child: Text(
                                                              'RESEND',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleMedium!
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                            ),
                                                          ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height:
                                                      constraints.maxHeight *
                                                          0.1,
                                                ),
                                                state is OtpVerifiedLoadingState
                                                    ? const CircularProgressIndicator()
                                                    : DefaultButton(
                                                        backgroundColor:
                                                            AppColors. defaultColor,
                                                        elevation: 5,
                                                        shadowColor:
                                                            Colors.black,
                                                        raduis: 20,
                                                        onClicked: () {
                                                          cubit.submitOTP(
                                                              smsCode:
                                                                  codeInput ??
                                                                      '',
                                                              context: context);

                                                          print(
                                                              'a3aaaaaaaaaaaaaaaaaaaaaaaaaa $codeInput');
                                                        },
                                                        child: const Text(
                                                          'submit',
                                                        ),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            );
          },
        ));
  }
}
