import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Domain/repositories/ICrudRepo.dart';
import 'package:payment_application_1/Presentation/view-model/NavScreens/myPorductsStates.dart';

import '../../../Data/models/Order Registration API/response/OrderApiResponseModel.dart';
import '../../../core/Di/injection.dart';

class MyProductsCubit extends Cubit<MyProductsStates> {
  MyProductsCubit() : super(MyProductsInitialState());
  static MyProductsCubit get(context) => BlocProvider.of(context);

  List<OrderApiResponseModel> myOrders = [];

  getMyProducts() {
    emit(MyProductsLoadingState());

    locators.get<ICrudRepo>().getMyOrders().then((value) {
      myOrders = value;
      emit(MyProductsSuccessState());
    }).catchError((onError) {
      emit(MyProductsErrorState(onError.toString()));
    });
  }
}
