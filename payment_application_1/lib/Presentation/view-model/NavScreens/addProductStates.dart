abstract class AddProductStates {}

class AddProductInitialState extends AddProductStates {}

class AddProductLoadingState extends AddProductStates {}

class AddProductSuccessState extends AddProductStates {}

class AddProductErrorState extends AddProductStates {
  final String err;
  AddProductErrorState(this.err);
}

class AddProductImageState extends AddProductStates {}

class AddProductCheckBoxState extends AddProductStates {}

class ChangeCurrencyState extends AddProductStates {}

class ShowCurrReqMessageState extends AddProductStates {}

class ChangeAddressState extends AddProductStates {}

class ShowAddressReqMessageState extends AddProductStates {}

class GetAddressLoadingState extends AddProductStates {}

class GetAddressSuccessState extends AddProductStates {}

class GetAddressErrorState extends AddProductStates {
  late final String err;
  GetAddressErrorState(this.err);
}
