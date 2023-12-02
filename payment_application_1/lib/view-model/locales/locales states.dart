abstract class LocalesStates {}

class LocalesInitialState extends LocalesStates {}

class localesChangeSuccessState extends LocalesStates {}

class localesChangeErrorState extends LocalesStates {
  String errMessage;
  String get getErrMessage => errMessage;
  localesChangeErrorState({required this.errMessage}) {
    print(' PaymentError $errMessage');
  }
}
