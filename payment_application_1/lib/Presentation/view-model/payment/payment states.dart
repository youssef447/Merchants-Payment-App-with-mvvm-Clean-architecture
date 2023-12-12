abstract class PaymentStates {}

class PaymentInitialState extends PaymentStates {}

class PaymentLoadingState extends PaymentStates {}

class PaymentSuccessState extends PaymentStates {}

class PaymentErrorState extends PaymentStates {
  String errMessage;
  String get getErrMessage => errMessage;
  PaymentErrorState({ required this.errMessage}) {
    //print(' PaymentError $errMessage');
  }
}


  

