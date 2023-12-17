import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Domain/repositories/iAuthRepo.dart';
import 'package:payment_application_1/Presentation/screens/AuthScreens/loginScreen.dart';
import 'package:payment_application_1/Presentation/view-model/NavScreens/settingsStates.dart';
import 'package:payment_application_1/core/utils/sharedFunctions.dart';

import '../../../core/Di/injection.dart';

class SettingCubit extends Cubit<SettingStates> {
  SettingCubit() : super(SettingsInitialState());
  static SettingCubit get(context) => BlocProvider.of(context);

  signOut(BuildContext ctx) {
    emit(SettingsLogoutLoadingState());
    locators.get<IAuthRepo>().signOut().then((value) {
      emit(SettingsLogoutSuccessState());
      navigateTo(ctx, LoginScreen());
    }).catchError((onError) {
      emit(SettingsLogoutErrorState());

    });
  }
}
