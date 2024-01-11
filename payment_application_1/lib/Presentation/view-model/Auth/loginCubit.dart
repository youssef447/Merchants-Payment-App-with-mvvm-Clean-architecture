import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:payment_application_1/core/utils/sharedFunctions.dart';
import 'package:payment_application_1/Presentation/screens/homeScreen.dart';

import '../../../Domain/repositories/iAuthRepo.dart';
import '../../../core/utils/appColors.dart';
import '../../../core/utils/globales.dart';
import '../../../core/Di/injection.dart';
import '../../widgets/FadeInDown.dart';
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
      if (uid.isNotEmpty) {
        emit(LoginSuccessState());
        if (ctx.mounted) {
          const Duration(milliseconds: 600);
          navigateTo(ctx, const HomeScreen());
        }
      } else {
        emit(
          LoginFaluireState('current User not verified'),
        );

        showDialog(
          context: ctx,
          builder: (BuildContext context) => FadeInDown(
            child: AlertDialog(
              icon: const Icon(
                Icons.warning_outlined,
                color: Colors.red,
              ),
              backgroundColor: AppColors.defaultColor,
              content: Text(
                'current User not verified, please complete Sign Up',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        );
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

        navigateTo(ctx, const HomeScreen());
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
