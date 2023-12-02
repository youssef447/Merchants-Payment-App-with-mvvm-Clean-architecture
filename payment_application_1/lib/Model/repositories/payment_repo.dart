import 'package:payment_application_1/Model/models/authApi/AuthTokenApi.dart';

import '../models/Order Registration API/response/OrderApiResponse.dart';
import '../service/PaymentService.dart';

class PaymentRepo {
  final _paymentService = PaymentService();
  Future<AuthTokenResponse> getAuthToken() async {
    final response = await _paymentService.getAuthResponse();

    return AuthTokenResponse.fromJson(response.data);
  }

  Future<OrderApiResponse> getOrderId(
      {required Map<String, dynamic> query}) async {
    final response = await _paymentService.getOrderResponse(query: query);

    return OrderApiResponse.fromJson(response.data);
  }

  Future<OrderApiResponse> getpaymentToken(
      {required Map<String, dynamic> query}) async {
    final response = await _paymentService.getPaymentkeyResponse(query: query);

    return response.data['token'];
  }
}
