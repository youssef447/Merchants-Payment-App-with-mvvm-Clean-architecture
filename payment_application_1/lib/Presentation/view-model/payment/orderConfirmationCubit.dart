import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:payment_application_1/Data/models/paymentKey/request/billingDataModel.dart';


import 'orderConfirmationStates.dart';

class OrderConfirmationCubit extends Cubit<OrderConfirmationStates> {
  OrderConfirmationCubit() : super(OrderConfirmationInitialState());
  static OrderConfirmationCubit get(context) => BlocProvider.of(context);
  PaySelection currentSelection = PaySelection.instantpay;
  List<PaySelection> selections = [
    PaySelection.instantpay,
    PaySelection.cashondelivery
  ];
  PhoneNumber? phoneNumber;
  BillingDataModel? billingDataModel;

  changeRadioButton(PaySelection val) {
    currentSelection = val;
    emit(ChangeRadioButtonState());
  }

  changeNumber(PhoneNumber number) {
    phoneNumber = number;
    emit(ChangeNumberState());
  }

}
enum PaySelection {
  instantpay,
  cashondelivery,
}
