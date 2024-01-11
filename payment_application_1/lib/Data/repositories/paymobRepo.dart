import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:payment_application_1/Data/services/PaymobService.dart';
import 'package:payment_application_1/Domain/repositories/iPaymentRepo.dart';

import '../../Domain/repositories/ICrudRepo.dart';
import '../../core/Di/injection.dart';
import '../../core/utils/globales.dart';
import '../models/Order Registration API/response/OrderApiResponseModel.dart';
import '../models/txnInquiryResponseModel.dart';

class PaymobRepo implements IPaymentRepo {
  final PaymobService _paymobService;
  PaymobRepo(PaymobService service) : _paymobService = service;
  @override
  Future<String> getAuthToken() async {
    final response = await _paymobService.reqAuthToken();

    return response.data['token'];
  }

  @override
  Future<void> reqOrderToken(
      {required Map<String, dynamic> orderReqQuery,
      List<File>? imgsFiles}) async {
    var response = await _paymobService.reqOrderToken(query: orderReqQuery);
    print('eeeeeeeeeeeeeeeeh ');
    var map = response.data as Map<String, dynamic>;

    map.addAll({
      'images_url': <String>[],
      'merchant_uid': FirebaseAuth.instance.currentUser!.uid
    });

    final String orderId = map['id'].toString();
    ///upload images then get their urls
    if (imgsFiles != null) {
      List<String> imgsUrl = [];

      for (File file in imgsFiles) {
        var tmp = await locators.get<ICrudRepo>().uploadFile(
              image: file,
              path: 'orders/$orderId/${Uri.file(file.path).pathSegments.last}',
            );
        imgsUrl.add(tmp);
      }
      map['images_url'] = imgsUrl;
    }
    ///filtiring specific key-vaule data
    map['created_at'] = Timestamp.fromDate(DateTime.parse(map['created_at']));
    map['amount_cents'] /= 100;
    map['items'][0]['amount_cents']/=100;
    final orderReq = OrderApiResponseModel.fromJson(map);

    ///insert order

    await locators.get<ICrudRepo>().addOrder(
          orderQuery: orderReq.toJson(),
          docName: orderId,
        );
  }

  @override
  Future<String> reqPaymentToken({required Map<String, dynamic> query}) async {
    query.addAll({'auth_token': authToken});
    final response = await _paymobService.reqPaymentToken(query: query);
    return response.data['token'];
  }

  @override
  Future<String> reqKioskRef({required String payToken}) async {
    Map<String, dynamic> query = {
      "source": {
        "identifier": "AGGREGATOR",
        "subtype": "AGGREGATOR",
      },
      'payment_token': payToken,
    };

    final response = await _paymobService.reqKioskRef(query: query);
    return response.data['data']['bill_reference'].toString();
  }

  @override
  Future<String> reqMobileWalletUrl({required String payToken}) async {
    Map<String, dynamic> query = {
      "source": {"identifier": "wallet mobile number", "subtype": "WALLET"},
      'payment_token': payToken,
    };

    final response = await _paymobService.reqMobileWalletUrl(query: query);
    print('ama nshof $response');
    return response.data['pending'];
  }

  @override
  Future<TxnInquiryResponseModel> getTransactions() async {
    final response = await _paymobService.reqAuthToken();

    return response.data['token'];
  }
}
