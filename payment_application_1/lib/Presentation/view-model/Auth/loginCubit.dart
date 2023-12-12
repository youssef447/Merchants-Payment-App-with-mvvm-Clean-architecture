import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/core/utils/sharedFunctions.dart';
import 'package:payment_application_1/Presentation/screens/homeScreen.dart';

import '../../../Domain/repositories/iAuthRepo.dart';
import '../../../core/utils/constants.dart';
import '../../../core/Di/injection.dart';
import 'loginStates.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginPageInitialState());
  static LoginCubit get(ctx) => BlocProvider.of(ctx);

  String helperText = globalLocale!.helperPassText;

  bool showPassword = true;

  void uncoverPassword() {
    showPassword = !showPassword;
    emit(ShowPasswordSuccessState());
  }

  signIn({
    required String email,
    required String pass,
    required BuildContext ctx,
  }) {
    emit(LoginLoadingState());

    locators
        .get<IAuthRepo>()
        .signInEmailPass(email: email, pass: pass)
        .then((uid) {
      emit(LoginSuccessState());
      if (ctx.mounted) {
        const Duration(milliseconds: 600);
        navigateTo(ctx, const HomeScreen());
      }
    }).catchError((error) {
      emit(LoginFaluireState(error.toString()));

      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
        ),
      );
    });
  }

  signInWithGoogle({
    required BuildContext ctx,
  }) {
    emit(GoogleLoginLoadingState());
    locators.get<IAuthRepo>().signInWithGoogle().then((value) {
      if (value == false) {
        emit(GoogleLoginCanceledState());
      } else {
        emit(GoogleLoginSuccessState());
        if (ctx.mounted) {
          const Duration(milliseconds: 600);
          navigateTo(ctx, const HomeScreen());
        }
      }
    }).catchError((error) {
      emit(GoogleLoginFaluireState(error.toString()));

      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
        ),
      );
    });
  }
}
