import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Presentation/screens/AuthScreens/loginScreen.dart';
import 'package:payment_application_1/core/utils/defaultAwesomeDialog.dart';
import 'package:payment_application_1/core/utils/sharedFunctions.dart';

import '../../../Domain/repositories/iAuthRepo.dart';
import '../../../core/Di/injection.dart';
import '../../../core/Network/local/cach_helper.dart';
import 'OtpStates.dart';

class OtpCubit extends Cubit<OtpStates> {
  OtpCubit() : super(OtpInitialState());
  static OtpCubit get(ctx) => BlocProvider.of(ctx);
  IAuthRepo repo = locators.get<IAuthRepo>();

  String? _verificationId;

  resendOTP({
    required String phoneNumber,
    required BuildContext context,
  }) {
    emit(
      OtpResentLoadingState(),
    );

    repo
        .sendOTP(
      phoneNumber: phoneNumber,
    )
        .then((value) {
      _verificationId = value;
     /*  showDialog(
        context: context,
        builder: (context) => const DefaultAlertDialog(
          icon: Icons.done_outlined,
          iconColor: Colors.green,
          content: 'OTP is sent, please check your SMS',
        ),
      ); */
      AwesomeDialogUtil.sucess(
        context: context,
        body: 'OTP is sent, please check your SMS',
        title: 'VERIFICATION',
      );

      emit(
        OtpResentSuccessState(),
      );
    }).catchError((onError) {
      emit(
        OtpResentErrorState(),
      );
      AwesomeDialogUtil.error(
        context: context,
        body: 'error sending OTP',
        msg: onError.toString(),
        title: 'VERIFICATION',
      );
    });
  }

  sendOTPRequest({
    required String phoneNumber,
    required BuildContext context,
  }) async {
    emit(
      OtpSentLoadingState(),
    );
    await Future.delayed(
      const Duration(seconds: 1),
    );
    repo
        .sendOTP(
      phoneNumber: phoneNumber,
    )
        .then((value) {
      _verificationId = value;
      emit(
        OtpSentSuccessState(),
      );

      AwesomeDialogUtil.sucess(
        context: context,
        body: 'OTP is sent, please check your SMS',
        title: 'VERIFICATION',
      );
    }).catchError((onError) {
      AwesomeDialogUtil.error(
        context: context,
        body: 'error sending OTP',
        msg: onError.toString(),
        title: 'VERIFICATION',
      );

      emit(
        OtpSentErrorState(),
      );
    });
  }

  submitOTP({
    required String smsCode,
    required BuildContext context,
  }) async {
    if (smsCode.isEmpty || smsCode.length < 6) {
    
      AwesomeDialogUtil.error(
        context: context,
        body: 'please fill the 6 fields',
        title: 'VERIFICATION',
      );
    } else {
      emit(
        OtpVerifiedLoadingState(),
      );
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId ?? '', smsCode: smsCode);

      if (credential.token != null) {
        await CacheHelper.saveData(key: 'token', value: true);
        await FirebaseAuth.instance.currentUser!.linkWithCredential(credential);
        if (context.mounted) {
          AwesomeDialogUtil.sucess(
            context: context,
            body: "Verification Success, Please Login",
            title: 'VERIFICATION',
            btnOkOnPress: () => navigateTo(
              context,
              LoginScreen(),
            ),
          );

          emit(
            OtpVerifiedSuccessState(),
          );
        }
      } else {
        AwesomeDialogUtil.error(
        context: context,
        body: 'SMS code is not correct, please Try Again',
        title: 'VERIFICATION',
      );
       

        emit(
          OtpVerifiedErrorState(),
        );
      }
    }
  }
}
