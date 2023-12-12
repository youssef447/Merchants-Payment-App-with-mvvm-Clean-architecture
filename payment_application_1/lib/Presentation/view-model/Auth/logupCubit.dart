import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Domain/repositories/iAuthRepo.dart';
import 'package:payment_application_1/core/utils/constants.dart';

import '../../../core/Di/injection.dart';
import 'logupStates.dart';

class LogupCubit extends Cubit<LogupStates> {
  LogupCubit() : super(LogupInitialState());
  static LogupCubit get(ctx) => BlocProvider.of(ctx);
  String helperText1 = globalLocale!.helperPassText;
  String helperText2 = "";

  bool showPassword1 = true;
  bool showPassword2 = true;

  void changeHelperText1(String val) {
    helperText1 = val;
    // emit(ChangeHelperTextState());
  }

  void changeHelperText2(String val) {
    helperText2 = val;
    emit(ChangeHelperTextState());
  }

  void uncoverPassword1() {
    showPassword1 = !showPassword1;
    emit(ShowPasswordSuccessState());
  }

  void uncoverPassword2() {
    showPassword2 = !showPassword2;
    emit(ShowPasswordSuccessState());
  }

  String? pass1;

  void firstPasswordChanged(
      {required String pass, required String helperText}) {
    pass1 = pass;
    changeHelperText1(helperText);

    emit(FirstPasswordChangedState());
  }

  bool phoneRequiredMessage = false;
  showPhoneRequiredMessage(bool val) {
    phoneRequiredMessage = val;
    emit(PhoneRequiredMessageState());
  }

  bool loadingLogUp = false;

  void signup({
    required String firstName,
    required String lastName,
    required String email,
    required String pass,
    required String phone,
    required BuildContext ctx,
  }) {
    loadingLogUp = true;
    emit(LogupLoadingState());

    locators
        .get<IAuthRepo>()
        .signUp(
          email: email,
          pass: pass,
          firstName: firstName,
          lastName: lastName,
          phone: phone,
        )
        .then((value) {
      
     
        loadingLogUp = false;
        AwesomeDialog(
            context: ctx,
            body: Text(
              "Registered Successfully",
              style: Theme.of(ctx).textTheme.titleLarge,
            ),
            title: "Sign up",
            dialogType: DialogType.success,
            btnOkColor: defaultColor,
            btnOkOnPress: () {
              Navigator.of(ctx).pop();
            }).show();
        emit(LogupSuccessState());
      
      }).catchError((e) {
        loadingLogUp = false;
        emit(
          LogupFaluireState(
            e.toString(),
          ),
        );
        ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      
    }).catchError(
      (onError) {
        emit(
          LogupFaluireState(
            onError.toString(),
          ),
        );
        ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(
            content: Text(onError.toString()),
          ),
        );
      },
    );
  }
}
