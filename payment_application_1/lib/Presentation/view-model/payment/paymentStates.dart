abstract class PaymentStates {}

class PaymentInitialState extends PaymentStates {}

class GetPaymentTokenLoadingState extends PaymentStates {}

class GetPaymentTokenSuccessState extends PaymentStates {}

class GetPaymentTokenErrorState extends PaymentStates {
  final String err;
  GetPaymentTokenErrorState(
    this.err,
  );
}

class ReqReferenceCodeLoadingState extends PaymentStates {}

class ReqReferenceCodeSuccessState extends PaymentStates {}

class ReqReferenceCodeErrorState extends PaymentStates {
  final String err;
  ReqReferenceCodeErrorState(
    this.err,
  );
}
class ReqMobileWalletUrlLoadingState extends PaymentStates {}

class ReqMobileWalletUrlSuccessState extends PaymentStates {}

class ReqMobileWalletUrlErrorState extends PaymentStates {
  final String err;
  ReqMobileWalletUrlErrorState(
    this.err,
  );
}