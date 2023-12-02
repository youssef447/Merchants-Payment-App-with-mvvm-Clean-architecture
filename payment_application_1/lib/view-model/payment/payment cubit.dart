import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/view-model/payment/payment%20states.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitialState());
  static PaymentCubit get(context) => BlocProvider.of(context);

  
  


}
