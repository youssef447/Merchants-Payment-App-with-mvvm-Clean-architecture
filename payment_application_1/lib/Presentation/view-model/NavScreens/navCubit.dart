import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Presentation/screens/Navlayouts/myProductsScreen.dart';
import 'package:payment_application_1/Presentation/screens/Navlayouts/historyScreen.dart';

import '../../screens/Navlayouts/mySettingsScreen.dart';
import 'navStates.dart';

class NavCubit extends Cubit<NavStates> {
  NavCubit() : super(NavInitialState());
  static NavCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = const [
    Myproducts(),
    TransactionsHistory(),
    Mysettings(),
  ];

  changeNavIndex(int index) {
    currentIndex = index;
    emit(NavChangeIndexState());
  }
}
