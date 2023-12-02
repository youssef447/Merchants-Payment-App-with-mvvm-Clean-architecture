import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/view-model/addProductStates.dart';

class AddProductCubit extends Cubit<AddProductStates> {
  AddProductCubit() : super(AddProductInitialState());
  static AddProductCubit get(context) => BlocProvider.of(context);

  File? imageFile;
  bool deliveryNeeded = false;
  String currencyCode = "currency";

  changeImage() {
    emit(AddProductImageState());
  }

  changeCheckBox(bool? val) {
    deliveryNeeded = val!;
    emit(AddProductCheckBoxState());
  }

  selectCurrency(String currency) {
    currencyCode = currency;
    emit(currentCurrencyState());
  }

  AddProduct() {}
}
