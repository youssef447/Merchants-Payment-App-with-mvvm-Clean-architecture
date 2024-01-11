import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Data/models/Order%20Registration%20API/request/OrderApiReqModel.dart';
import 'package:payment_application_1/Data/models/Order%20Registration%20API/shippingDataModel.dart';
import 'package:payment_application_1/Domain/repositories/iPaymentRepo.dart';
import 'package:payment_application_1/Presentation/view-model/NavScreens/addProductStates.dart';
import 'package:payment_application_1/core/Di/injection.dart';
import 'package:payment_application_1/core/utils/globales.dart';

import '../../../Data/models/Order Registration API/request/itemModel.dart';
import '../../../Data/services/locationService.dart';
import '../../../core/utils/defaultAwesomeDialog.dart';

class AddProductCubit extends Cubit<AddProductStates> {
  AddProductCubit() : super(AddProductInitialState());
  static AddProductCubit get(context) => BlocProvider.of(context);

  List<File> imgFiles = [];
  bool deliveryNeeded = false;
  String currencyCode = "currency";
  String addressField = "";

  ///only empty when no delivery needed
  String countryValue = "Country";

  ///only empty when no delivery needed

  String cityValue = "City";

  ///only empty when no delivery needed

  String stateValue = "State";

  changeImage() {
    emit(AddProductImageState());
  }

  changeCheckBox(bool? val) {
    deliveryNeeded = val!;
    emit(AddProductCheckBoxState());
  }

  selectCurrency(String currency) {
    currencyCode = currency;
    emit(ChangeCurrencyState());
  }

  changeCountryValue(String val) {
    countryValue = val;
    emit(ChangeAddressState());
  }

  changeCityValue(String val) {
    cityValue = val;
    emit(ChangeAddressState());
  }

  changeStateValue(String val) {
    stateValue = val;
    emit(ChangeAddressState());
  }

  changedAddressField(String val) {
    addressField = val;
    emit(
      ChangeAddressState(),
    );
  }

  getLocation() {
    emit(
      GetAddressLoadingState(),
    );
    locators.get<LocationService>().getAddress().then((address) {
      countryValue = address[0];
      stateValue = address[1];
      cityValue = address[2];
      addressField = address[3];
      emit(
        GetAddressSuccessState(),
      );
    }).catchError((onError) {
      emit(
        GetAddressErrorState(onError.toString()),
      );
    });
  }

  bool addReqMeesage = false;
  showAddressReqMessage(bool val) {
    addReqMeesage = val;
    emit(
      ShowAddressReqMessageState(),
    );
  }

  bool currReqMeesage = false;
  showCurrReqMessage(bool val) {
    currReqMeesage = val;
    emit(
      ShowCurrReqMessageState(),
    );
  }

  ///adding order to database and saving it's id
  addOrder(
      {required String productName,
      required double price,
      required int quantity,
      required BuildContext ctx,
      String? description,
      String? city,
      String? country,
      String? state,
      String? street,
      String? apartNo,
      String? postalCode}) async {
    emit(
      AddProductLoadingState(),
    );
    price *=100.0;
    ShippingDataModel? shippingData;
    if (deliveryNeeded) {
      shippingData = ShippingDataModel(
        phoneNumber: currentUser.phone['number']!,
        email: currentUser.email,
        firstName: currentUser.firstName,
        lastName: currentUser.lastName,
        country: country!,
        city: city!,
        postalCode: postalCode ?? '',
        street: street!,
        apartment: apartNo,
      );
    }

    ItemModel item = ItemModel(
      amountCents: price.toString(),
      description: description,
      name: productName,
      quantity: quantity.toString(),
    );
    final orderApiReq = OrderApiReqModel(
      items: [item],
      shippingData: shippingData,
      amountCents: price.toString(),
      authToken: authToken!,
      deliveryNeeded: deliveryNeeded.toString(),
      currency: currencyCode,
    );

    locators
        .get<IPaymentRepo>()
        .reqOrderToken(
          orderReqQuery: orderApiReq.toJson(),
          imgsFiles: imgFiles,
        )
        .then(
      (value) {
        emit(
          AddProductSuccessState(),
        );
        AwesomeDialogUtil.sucess(
            context: ctx,
            body: 'Order Posted Successfully',
            title: 'Done',
            btnOkOnPress: () {
              Navigator.of(ctx).pop();
            });
      },
    ).catchError((onError) {
      emit(
        AddProductErrorState(onError.toString()),
      );

      AwesomeDialogUtil.error(
          context: ctx,
          body: 'error Adding your order ${onError.toString()}',
          title: 'Failed');
    });
  }
}
