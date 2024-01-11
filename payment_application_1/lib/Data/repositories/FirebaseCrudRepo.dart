import 'dart:io';
import 'package:payment_application_1/Data/services/FirebaseCrudService.dart';
import 'package:payment_application_1/Domain/repositories/ICrudRepo.dart';

import '../models/Order Registration API/response/OrderApiResponseModel.dart';
import '../models/merchantMode.dart';

class FirebaseCrudRepo implements ICrudRepo {
  late final FirebaseCrudService _service;

  FirebaseCrudRepo(FirebaseCrudService service) {
    _service = service;
  }
  @override
  Future<MerchantModel> getUser({required String userId}) async {
    final response = await _service.getUser(userId: userId);
    return MerchantModel.fromJson(response.data()!);
  }

  @override
  Future<void> updateUser(Map<String, dynamic> data) async {
    _service.updateUser(data);
  }

  @override
  Future<String> uploadFile({
    required File image,
    required String path,
  }) async {
    final ref = await _service.uploadFile(image: image, path: path);

    return await ref.getDownloadURL();
  }

  @override
  Future<void> addOrder(
      {required Map<String, dynamic> orderQuery,
      required String docName}) async {
    await _service.addOrder(orderReqQuery: orderQuery, docName: docName);
  }

  @override
  Future<void> addUser(
      {required Map<String, dynamic> query, required String uid}) async {
    await _service.addUser(query: query, uid: uid);
  }

  @override
  Future<List<OrderApiResponseModel>> getOthersOrders() async {
    List<OrderApiResponseModel> result = [];
    var querySnapshot = await _service.getOthersOrders();
    for (var document in querySnapshot.docs) {
      result.add(OrderApiResponseModel.fromJson(document.data()));
    }
    return result;
  }

  @override
  Future<List<OrderApiResponseModel>> getMyOrders() async {
    List<OrderApiResponseModel> result = [];
    var querySnapshot = await _service.getMyOrders();
    for (var document in querySnapshot.docs) {
      result.add(OrderApiResponseModel.fromJson(document.data()));
    }
    return result;
  }
}
