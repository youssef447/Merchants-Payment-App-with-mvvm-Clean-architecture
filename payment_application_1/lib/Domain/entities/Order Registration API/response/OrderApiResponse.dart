
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../Data/models/Order Registration API/request/itemModel.dart';
import '../../../../Data/models/Order Registration API/shippingDataModel.dart';

class OrderApiResponse {
  String id;
  Timestamp createdAt;
  String deliveryNeeded;
  String amountCents;
  String currency;
  List<ItemModel> item;
  String merchantUid;
  List<String> imgsUrl;
  ShippingDataModel? shippingData;
  OrderApiResponse({
    required this.id,
    required this.createdAt,
    required this.deliveryNeeded,
    required this.item,
    required this.amountCents,
    required this.currency,
    required this.merchantUid,
    required this.imgsUrl,
    this.shippingData,
  });

  
}
