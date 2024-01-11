import '../../../../Data/models/Order Registration API/request/itemModel.dart';
import '../../../../Data/models/Order Registration API/shippingDataModel.dart';
//import '../shipping_details.dart';

class OrderApiReq {
  String authToken;
  String deliveryNeeded;
  String amountCents;
  String currency;
  List<ItemModel> items;
  ShippingDataModel? shippingData;


  OrderApiReq({
    required this.authToken,
    required this.deliveryNeeded,
    required this.amountCents,
    required this.currency,
    required this.items,
    this.shippingData,
  });

  
}
