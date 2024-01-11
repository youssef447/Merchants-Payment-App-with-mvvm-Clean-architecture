import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_application_1/Presentation/screens/KioskPayResult.dart';
import 'package:payment_application_1/Presentation/screens/mobileWalletScreen.dart';
import 'package:payment_application_1/Presentation/view-model/payment/paymentStates.dart';
import 'package:payment_application_1/core/utils/defaultAwesomeDialog.dart';
import 'package:payment_application_1/core/utils/paymobConstants.dart';

import '../../../Data/models/paymentKey/request/PaymentKeyReqModel.dart';
import '../../../Data/models/paymentKey/request/billingDataModel.dart';
import '../../../Domain/repositories/iPaymentRepo.dart';
import '../../../core/Di/injection.dart';
import '../../../core/utils/sharedFunctions.dart';
import '../../screens/cardPaymentScreen.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitialState());
  static PaymentCubit get(context) => BlocProvider.of(context);
  String? payToken;
  Future<void> getPaymentToken({
    required BillingDataModel billingData,
    required String amountCents,
    required String currency,
    required int integrationId,
    required String orderId,
    required BuildContext context,
  }) async {
    emit(GetPaymentTokenLoadingState());
    double tmp = double.parse(amountCents);
    tmp *= 100;
    amountCents = tmp.toString();
    PaymentKeyReqModel model = PaymentKeyReqModel(
      amountCents: amountCents,
      currency: currency,
      expiration: 3600,
      integrationId: integrationId,
      billingData: billingData,
      orderId: orderId,
    );
    try {
      payToken = await locators
          .get<IPaymentRepo>()
          .reqPaymentToken(query: model.toJson());
      emit(GetPaymentTokenSuccessState());

      if (integrationId == PaymobConstants.integrationIdCard) {
        if (context.mounted) {
          navigate(
            context,
            CardPaymentSreen(payToken: payToken!),
          );
        }
      }
    } catch (e) {
      emit(GetPaymentTokenErrorState(e.toString()));
      if (context.mounted) {
        AwesomeDialogUtil.error(
            context: context,
            body: onError.toString(),
            title: 'Error getting Payment Token');
      }
    }
  }

  Future<void> reqKioskRef(BuildContext context) async {
    emit(ReqReferenceCodeLoadingState());
    try {
      final ref = await locators.get<IPaymentRepo>().reqKioskRef(
            payToken: payToken!,
          );
      emit(ReqReferenceCodeSuccessState());
      if (context.mounted) {
        navigate(
          context,
          KioskPayResult(ref: ref),
        );
      }
    } catch (err) {
      emit(ReqReferenceCodeErrorState(err.toString()));
      if (context.mounted) {
        AwesomeDialogUtil.error(
            context: context,
            body: onError.toString(),
            title: 'Error getting reference');
      }
    }
  }

  Future<void> reqMobileWalletUrl(BuildContext context) async {
    emit(ReqMobileWalletUrlLoadingState());
    try {
      final url = await locators.get<IPaymentRepo>().reqMobileWalletUrl(
            payToken: payToken!,
          );
      emit(ReqMobileWalletUrlSuccessState());
      if (context.mounted) {
        navigate(
          context,
          MobileWalletScreen(url: url),
        );
      }
    } catch (err) {
      emit(ReqMobileWalletUrlErrorState(onError.toString()));
      if (context.mounted) {
        AwesomeDialogUtil.error(
            context: context,
            body: onError.toString(),
            title: 'Error getting wallet url');
      }
    }
  }
}
