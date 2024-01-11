import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Domain/entities/merchant.dart';
import 'package:payment_application_1/Domain/repositories/ICrudRepo.dart';
import 'package:payment_application_1/core/Di/injection.dart';

import 'orderViewStates.dart';

class OrderViewCubit extends Cubit<OrderViewStates> {
  OrderViewCubit({required this.originalPrice})
      : super(OrderViewInitialState());
  late final double originalPrice;
  late double price = originalPrice;
  late Merchant merchant;
  static OrderViewCubit get(context) => BlocProvider.of(context);
  getMerchat(String uID) {
    emit(GetMerchatLoadingState());

    locators.get<ICrudRepo>().getUser(userId: uID).then((value) {
      merchant = value;
      emit(GetMerchatSuccessState());
    }).catchError((onError) {
      emit(GetMerchatErrorState(onError.toString()));
    });
  }

  

  changeQuantity(
    int quantity,
  ) {
    price = originalPrice;
    price = price * quantity;
    emit(OrderViewChangeQuantityState());
  }

  addToCart() {
    emit(OrderViewAddToCartLoadingState());
  }
}
