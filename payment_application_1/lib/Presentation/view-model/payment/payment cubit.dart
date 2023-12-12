import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Domain/repositories/iPaymentRepo.dart';
import 'package:payment_application_1/Presentation/view-model/payment/payment%20states.dart';

import '../../../core/Di/injection.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitialState());
  static PaymentCubit get(context) => BlocProvider.of(context);

  getAuthToken() {
    locators.get<IPaymentRepo>().getAuthToken().then((value) {



    });
  }
}
