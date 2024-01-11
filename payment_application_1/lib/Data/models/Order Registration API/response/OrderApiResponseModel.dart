import '../../../../Domain/entities/Order Registration API/response/OrderApiResponse.dart';
import '../request/itemModel.dart';
import '../shippingDataModel.dart';

class OrderApiResponseModel extends OrderApiResponse {
  OrderApiResponseModel({
    required super.id,
    required super.createdAt,
    required super.deliveryNeeded,
    required super.item,
    required super.amountCents,
    required super.currency,
    required super.merchantUid,
    required super.imgsUrl,
    super.shippingData,
  });

  factory OrderApiResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderApiResponseModel(
        id: json["id"].toString(),
        createdAt: json["created_at"],
        deliveryNeeded: json["delivery_needed"].toString(),
        item: [(ItemModel.fromJson(json["items"][0]))],
        currency: json['currency'],
        amountCents: json['amount_cents'].toString(),
        merchantUid: json['merchant_uid'],
        imgsUrl: (json['images_url'] as List)
            .map(
              (item) => item.toString(),
            )
            .toList(),
        shippingData: json['shipping_data'] == null ||
                (json['shipping_data'] as Map).isEmpty
            ? null
            : ShippingDataModel.fromJson(json['shipping_data']),
      );

  //needed when updating order
  Map<String, dynamic> toJson() => {
        "id": id,
        "amount_cents": amountCents,
        "currency": currency,
        "items": List.from(item.map(
            (x) => x.toJson())), //to be list of map not list of item instances
        "created_at": createdAt,
        "merchant_uid": merchantUid,
        "delivery_needed": deliveryNeeded,
        'images_url': imgsUrl,
        "shipping_data": shippingData == null ? {} : shippingData!.toJson(),
      };
}
