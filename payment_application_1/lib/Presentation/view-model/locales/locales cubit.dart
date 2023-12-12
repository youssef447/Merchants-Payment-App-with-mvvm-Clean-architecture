import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/core/Network/local/cach_helper.dart';
import 'package:payment_application_1/Presentation/screens/splashScreen.dart';

import 'locales states.dart';

class LocalesCubit extends Cubit<LocalesStates> {
  LocalesCubit() : super(LocalesInitialState());
  static LocalesCubit get(context) => BlocProvider.of(context);
  late Locale selectedLang;
  late Languages selectedValue;

  changeLocale(Languages lang) async {
    try {
      if (lang == Languages.arabic) {
        selectedValue = Languages.arabic;
        await CacheHelper.saveData(key: 'lang', value: 'ar');
        selectedLang = const Locale('ar');
        
      } else {
        selectedValue = Languages.english;
        await CacheHelper.saveData(key: 'lang', value: 'en');

        selectedLang = const Locale('en');
      }

      emit(localesChangeSuccessState());
    } catch (e) {
      emit(localesChangeErrorState(errMessage: e.toString()));
    }
  }
}
