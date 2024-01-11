import 'package:dio/dio.dart';

abstract class IPaymentService{


   Future<Response<dynamic>> reqAuthToken();

   Future<Response<dynamic>> reqOrderToken({required Map<String,dynamic>query});

      Future<Response<dynamic>> reqPaymentToken({required Map<String,dynamic>query});



      Future<Response<dynamic>> reqKioskRef({required Map<String,dynamic>query});
            Future<Response<dynamic>> reqMobileWalletUrl({required Map<String,dynamic>query});


      Future<Response<dynamic>> getTransactions({required Map<String,dynamic>query});


}