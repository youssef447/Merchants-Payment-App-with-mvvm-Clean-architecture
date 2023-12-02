// To parse this JSON data, do
//
//     final orderApiReq = orderApiReqFromJson(jsonString);

import '../shipping_data.dart';
import 'item.dart';
import 'shipping_details.dart';

class OrderApiReq {
  String? authToken;
  String? deliveryNeeded;
  String? amountCents;
  String? currency;
  List<Item>? items;
  ShippingData? shippingData;
  ShippingDetails? shippingDetails;

  OrderApiReq({
    this.authToken,
    this.deliveryNeeded,
    this.amountCents,
    this.currency,
    this.items,
    this.shippingData,
    this.shippingDetails,
  });

  Map<String, dynamic> toJson() => {
        "auth_token": authToken,
        "delivery_needed": deliveryNeeded,
        "amount_cents": amountCents,
        "currency": currency,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "shipping_data": shippingData?.toJson(),
        "shipping_details": shippingDetails?.toJson(),
      };
}
