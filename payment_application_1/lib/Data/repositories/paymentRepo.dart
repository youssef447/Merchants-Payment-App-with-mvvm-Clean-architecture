import 'package:payment_application_1/Data/services/PaymobService.dart';
import 'package:payment_application_1/Domain/repositories/iPaymentRepo.dart';

import '../models/Order Registration API/response/OrderApiResponse.dart';

class PaymobRepo implements IPaymentRepo {
  final PaymobService _paymobService;
  PaymobRepo(PaymobService service) : _paymobService = service;
  @override
  Future<String> getAuthToken() async {
    final response = await _paymobService.getAuthResponse();

    return response.data['token'];
  }

  @override
  Future<OrderApiResponse> getOrderId(
      {required Map<String, dynamic> query}) async {
    final response = await _paymobService.getOrderResponse(query: query);

    return OrderApiResponse.fromJson(response.data);
  }

  @override
  Future<OrderApiResponse> getpaymentToken(
      {required Map<String, dynamic> query}) async {
    final response = await _paymobService.getPaymentkeyResponse(query: query);

    return response.data['token'];
  }
}
