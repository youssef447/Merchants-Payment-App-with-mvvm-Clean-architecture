import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Domain/repositories/iAuthRepo.dart';
import 'package:payment_application_1/Presentation/screens/AuthScreens/LoginPage/loginScreen.dart';
import 'package:payment_application_1/core/utils/sharedFunctions.dart';

import '../../../core/Di/injection.dart';
import 'profileStates.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());
  static ProfileCubit get(context) => BlocProvider.of(context);

  signOut(BuildContext ctx) {
    emit(ProfileLogoutLoadingState());
    locators.get<IAuthRepo>().signOut().then((value) {
      emit(ProfileLogoutSuccessState());
      navigateTo(ctx, LoginScreen());
    }).catchError((onError) {
      emit(ProfileLogoutErrorState());

    });
  }
}
