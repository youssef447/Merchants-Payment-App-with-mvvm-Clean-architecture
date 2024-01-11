import '../../../../Domain/entities/Order Registration API/request/OrderApiReq.dart';

//import '../shipping_details.dart';

class OrderApiReqModel extends OrderApiReq {
 

  //ShippingDetails? shippingDetails;

  OrderApiReqModel({
    required super.authToken,
    required super.deliveryNeeded,
    required super.amountCents,
    required super.currency,
    required super.items,
    super.shippingData,
    //super.shippingDetails,
  });

  Map<String, dynamic> toJson() => {
        "auth_token": authToken,
        "delivery_needed": deliveryNeeded,
        "amount_cents": amountCents,
        "currency": currency,
        "items": List<Map<String, dynamic>>.from(items.map((x) => x.toJson())),
        "shipping_data": shippingData == null ? {} : shippingData!.toJson(),
      };
}
