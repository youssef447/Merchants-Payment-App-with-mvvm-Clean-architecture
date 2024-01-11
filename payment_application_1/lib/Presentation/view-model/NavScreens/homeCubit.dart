import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Domain/repositories/iPaymentRepo.dart';
import 'package:payment_application_1/Presentation/screens/Navlayouts/productsScreen.dart';
import 'package:payment_application_1/Presentation/screens/Navlayouts/historyScreen.dart';
import 'package:payment_application_1/Presentation/view-model/NavScreens/homeStates.dart';

import '../../../Domain/repositories/ICrudRepo.dart';
import '../../../core/Di/injection.dart';
import '../../../core/utils/globales.dart';
import '../../screens/Navlayouts/ProfilePage/myProfileScreen.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = const [
    Myproducts(),
    TransactionsHistory(),
    MyProfileScreen(),
  ];

  changeHomeIndex(int index) {
    currentIndex = index;
    emit(HomeChangeIndexState());
  }

  getData() {
    emit(GetDataLoadingState());

    //Generating Auth Token
    locators.get<IPaymentRepo>().getAuthToken().then((value) {
      authToken = value;

      //Getting User Data

      locators
          .get<ICrudRepo>()
          .getUser(userId: FirebaseAuth.instance.currentUser!.uid)
          .then((value) {
        currentUser = value;
        print('${currentUser.firstName} ${currentUser.lastName}');

        //Getting Merchants Data
        emit(GetDataSuccessState());
      }).catchError((onError) {
        emit(
          GetDataErrorState(onError.toString()),
        );
      });
    }).catchError((onError) {
      emit(
        GetDataErrorState(
          onError.toString(),
        ),
      );
    });
  }
}
