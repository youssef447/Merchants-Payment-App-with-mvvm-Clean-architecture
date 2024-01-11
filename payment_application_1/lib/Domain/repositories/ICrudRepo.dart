import 'dart:io';


import '../../Data/models/Order Registration API/response/OrderApiResponseModel.dart';
import '../../Data/models/merchantMode.dart';

abstract class ICrudRepo {
  Future<MerchantModel> getUser({required String userId});
  Future<void> addUser(
      {required Map<String, dynamic> query, required String uid});
  Future<void> updateUser(Map<String, dynamic> data);

  Future<String> uploadFile({
    required File image,
    required String path,
  });

  Future<void> addOrder(
      {required Map<String, dynamic> orderQuery, required String docName});
  Future<List<OrderApiResponseModel>> getMyOrders();
  Future<List<OrderApiResponseModel>> getOthersOrders();
}
