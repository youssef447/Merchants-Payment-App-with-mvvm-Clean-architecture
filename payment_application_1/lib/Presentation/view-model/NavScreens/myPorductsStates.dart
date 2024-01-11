abstract class MyProductsStates {}

class MyProductsInitialState extends MyProductsStates {}

class MyProductsLoadingState extends MyProductsStates {}

class MyProductsSuccessState extends MyProductsStates {}

class MyProductsErrorState extends MyProductsStates {
  final String err;
  MyProductsErrorState(this.err);
}


