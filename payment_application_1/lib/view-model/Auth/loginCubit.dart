import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Network/local/cach_helper.dart';
import 'package:payment_application_1/shared/sharedFunctions.dart';
import 'package:payment_application_1/views/home.dart';

import '../../constants.dart';
import 'loginStates.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(ctx) => BlocProvider.of(ctx);

  String helperText = globalLocale!.helperPassText;

  bool showPassword = true;

  void uncoverPassword() {
    showPassword = !showPassword;
    emit(ShowPasswordSuccessState());
  }

  bool loadingLogin = false;

  void signIn({
    required String email,
    required String pass,
    required BuildContext ctx,
  }) {
    loadingLogin = true;

    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((value) async {
      await CacheHelper.saveData(key: 'token', value: value.user!.uid);
      print('uidddddd ${value.user!.uid}');
      loadingLogin = false;

      emit(LoginSuccessState());
      if (ctx.mounted) {
        const Duration(milliseconds: 600);
        navigateTo(ctx, const HomeScreen());
      }
    }).catchError((error) {
      loadingLogin = false;
      emit(LoginFaluireState(error.toString()));
      if (state is LoginFaluireState) {
        ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
          ),
        );
      }
    });
  }
}
