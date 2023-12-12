import '../../Data/models/Order Registration API/response/OrderApiResponse.dart';

abstract class IPaymentRepo{

Future<String> getAuthToken();

  Future<OrderApiResponse> getOrderId(
      {required Map<String, dynamic> query}) ;

  Future<OrderApiResponse> getpaymentToken(
      {required Map<String, dynamic> query}) ;
  }

