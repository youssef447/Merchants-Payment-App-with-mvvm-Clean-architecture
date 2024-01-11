import 'dart:io';

import '../../Data/models/txnInquiryResponseModel.dart';

abstract class IPaymentRepo {
  Future<String> getAuthToken();

  Future<void> reqOrderToken(
      {required Map<String, dynamic> orderReqQuery, List<File>? imgsFiles});

  Future<String> reqPaymentToken({
    required Map<String, dynamic> query,
  });

  Future<String> reqKioskRef({
    required String payToken,
  });

  Future<String> reqMobileWalletUrl({
    required String payToken,
  });
  Future<TxnInquiryResponseModel> getTransactions();
}
