import 'package:dio/dio.dart';

abstract class IPaymentService{


   Future<Response<dynamic>> getAuthResponse();

   Future<Response<dynamic>> getOrderResponse({required Map<String,dynamic>query});

      Future<Response<dynamic>> getPaymentkeyResponse({required Map<String,dynamic>query});






}