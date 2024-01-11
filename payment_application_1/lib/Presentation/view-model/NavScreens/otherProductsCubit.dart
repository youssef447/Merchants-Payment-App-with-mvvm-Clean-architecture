import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Domain/repositories/ICrudRepo.dart';

import '../../../Data/models/Order Registration API/response/OrderApiResponseModel.dart';
import '../../../core/Di/injection.dart';
import 'otherProductsStates.dart';

class OtherProductsCubit extends Cubit<OtherProductsStates> {
  OtherProductsCubit() : super(OtherProductsInitialState());
  static OtherProductsCubit get(context) => BlocProvider.of(context);

  List<OrderApiResponseModel> othersOrders = [];



  getOthersProducts() {
    emit(OtherProductsLoadingState());

    locators.get<ICrudRepo>().getOthersOrders().then((value) {
      othersOrders = value;
      emit(OtherProductsSuccessState());
    }).catchError((onError) {
      emit(OtherProductsErrorState(onError.toString()));
    });
  }
}
