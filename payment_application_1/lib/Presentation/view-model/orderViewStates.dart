abstract class OrderViewStates {}

class OrderViewInitialState extends OrderViewStates {}

class GetMerchatLoadingState extends OrderViewStates {}

class GetMerchatSuccessState extends OrderViewStates {}

class GetMerchatErrorState extends OrderViewStates {
  final String err;
  GetMerchatErrorState(
    this.err,
  );
}

class OrderViewChangeQuantityState extends OrderViewStates {}

class OrderViewAddToCartLoadingState extends OrderViewStates {}

class OrderViewAddToCartSuccessState extends OrderViewStates {}

class OrderViewAddToCartErrorState extends OrderViewStates {
  final String err;
  OrderViewAddToCartErrorState(
    this.err,
  );
}


