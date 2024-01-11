import 'package:dio/dio.dart';
import 'package:payment_application_1/core/utils/paymobConstants.dart';

import '../../core/Network/remote/dio_helper.dart';
import 'iPaymentService.dart';

class PaymobService implements IPaymentService {
  @override
  Future<Response<dynamic>> reqAuthToken() async {

    final response=await DioHelper.postData(
      method: PaymobConstants.authMethod,
      data: {'api_key': const String.fromEnvironment('Api_Key')},
    
    );
    return response;
  }

  @override
  Future<Response<dynamic>> reqOrderToken(
      {required Map<String, dynamic> query}) async {
    return await DioHelper.postData(
      method: PaymobConstants.orderRegMethod,
      data: query,
    );
  }

  @override
  Future<Response<dynamic>> reqPaymentToken(
      {required Map<String, dynamic> query}) async {
    return await DioHelper.postData(
      method: PaymobConstants.paymentKeyReqMethod,
      data: query,
    );
  }

  @override
  Future<Response> reqKioskRef({required Map<String, dynamic> query}) async {
   
    return await DioHelper.postData(
      method: PaymobConstants.kioskMethod,
      data: query,
    );
  }

    @override
  Future<Response> reqMobileWalletUrl({required Map<String, dynamic> query}) async {
   print('zz $query');
    return await DioHelper.postData(
      method: PaymobConstants.kioskMethod,
      data: query,
    );
  }
  
  
  @override
  Future<Response> getTransactions({required Map<String, dynamic> query}) async{
 return await DioHelper.postData(
      method: PaymobConstants.kioskMethod,
      data: query,
    );
  }
}
