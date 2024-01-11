abstract class OtherProductsStates {}

class OtherProductsInitialState extends OtherProductsStates {}

class OtherProductsLoadingState extends OtherProductsStates {}

class OtherProductsSuccessState extends OtherProductsStates {}

class OtherProductsErrorState extends OtherProductsStates {
  final String err;
  OtherProductsErrorState(this.err);
}
